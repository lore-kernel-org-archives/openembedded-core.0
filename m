Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF503D58B37
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:42:12 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28969.1773582115168134704
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=tJ8VpIAg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZVzt38/K;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019cf1bb74db-6977e80c-a804-45f8-8cd5-af910b936ecc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582120;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8TZRV1TNl4LXnop4wwlkOSSxqX5tzoZ9jIzaT0Le2rk=;
	b=tJ8VpIAgdhc2e0Vzq/DnLqwUsOJdmtgtOiGTiPplQfVMe/9+T9rAu0+kAk49iKbP
	dMpNO0lpFiCDwJ6KO6V+QjaaidTkdkGo3ZC5c09Fk+Sa0liX5tArPHPCgvUCV+DOaRl
	k8KGJ+e2/C4MMgH2POksEUHuHhseV/TRvuqC4eBw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582120;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8TZRV1TNl4LXnop4wwlkOSSxqX5tzoZ9jIzaT0Le2rk=;
	b=ZVzt38/KKsKpOkkJfS1zv1RbN/8YqDvMJ/WMFwqSmxpOSWvTi2Mj6HyShvYSomzY
	6vskblOd8mXhLTbu6Zi/XGp3fjzvkNcm0jwpnF0f1gpv6kSbEgmnw3YQOC/SRd+ugKx
	voPI+5stZtPQtSG6BhWEMKDBtIcVAHJlu2TNvVLE=
Content-Type: multipart/mixed; boundary="===============1122338726205376732=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinxcontrib-svg2pdfconverter: upgrading to 2.1.0
 SUCCEEDED
Message-ID: <0101019cf1bb74db-6977e80c-a804-45f8-8cd5-af910b936ecc-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:42:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:42:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233158

--===============1122338726205376732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-sphinxcontrib-svg2pdfconverter* to *2.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinxcontrib-svg2pdfconverter-upgrade-2.0.0.patch
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
From c303317e08a8ab7a6a3ce8647eaae9e15610d778 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 08:39:20 +0000
Subject: [PATCH] python3-sphinxcontrib-svg2pdfconverter: upgrade 2.0.0 ->
 2.1.0

---
 ...2.0.0.bb => python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-svg2pdfconverter_2.0.0.bb => python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.0.0.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.0.0.bb
rename to meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb
index 1bf3e55ebd..4ce5bb7bb3 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/missinglinkelectronics/sphinxcontrib-svg2pdfconve
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b11cf936853a71258d4b57bb1849a3f9"
 
-SRC_URI[sha256sum] = "ab9c8f1080391e231812d20abf2657a69ee35574563b1014414f953964a95fa3"
+SRC_URI[sha256sum] = "9756e82d5f3bf11629ffcbafb1f8a1092d3bb4789e33494032cdce9a9c8459d3"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.1


--===============1122338726205376732==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinxcontrib-svg2pdfconverter-upgrade-2.0.0.patch"

RnJvbSBjMzAzMzE3ZTA4YThhYjdhNmEzY2U4NjQ3ZWFhZTllMTU2MTBkNzc4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMDg6Mzk6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNwaGlueGNvbnRyaWItc3ZnMnBkZmNvbnZlcnRlcjogdXBncmFkZSAyLjAuMCAtPgog
Mi4xLjAKCi0tLQogLi4uMi4wLjAuYmIgPT4gcHl0aG9uMy1zcGhpbnhjb250cmliLXN2ZzJwZGZj
b252ZXJ0ZXJfMi4xLjAuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0
aG9uMy1zcGhpbnhjb250cmliLXN2ZzJwZGZjb252ZXJ0ZXJfMi4wLjAuYmIgPT4gcHl0aG9uMy1z
cGhpbnhjb250cmliLXN2ZzJwZGZjb252ZXJ0ZXJfMi4xLjAuYmJ9ICg4OSUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueGNvbnRyaWItc3Zn
MnBkZmNvbnZlcnRlcl8yLjAuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1zcGhpbnhjb250cmliLXN2ZzJwZGZjb252ZXJ0ZXJfMi4xLjAuYmIKc2ltaWxhcml0eSBp
bmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXNwaGlueGNvbnRyaWItc3ZnMnBkZmNvbnZlcnRlcl8yLjAuMC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueGNvbnRyaWItc3ZnMnBkZmNvbnZl
cnRlcl8yLjEuMC5iYgppbmRleCAxYmYzZTU1ZWJkLi40Y2U1YmI3YmIzIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54Y29udHJpYi1zdmcycGRm
Y29udmVydGVyXzIuMC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1zcGhpbnhjb250cmliLXN2ZzJwZGZjb252ZXJ0ZXJfMi4xLjAuYmIKQEAgLTMsNyArMyw3
IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9taXNzaW5nbGlua2VsZWN0cm9uaWNz
L3NwaGlueGNvbnRyaWItc3ZnMnBkZmNvbnZlCiBMSUNFTlNFID0gIkJTRC0yLUNsYXVzZSIKIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT1iMTFjZjkzNjg1M2E3MTI1
OGQ0YjU3YmIxODQ5YTNmOSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImFiOWM4ZjEwODAzOTFl
MjMxODEyZDIwYWJmMjY1N2E2OWVlMzU1NzQ1NjNiMTAxNDQxNGY5NTM5NjRhOTVmYTMiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiOTc1NmU4MmQ1ZjNiZjExNjI5ZmZjYmFmYjFmOGExMDkyZDNiYjQ3
ODllMzM0OTQwMzJjZGNlOWE5Yzg0NTlkMyIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRv
b2xzX2J1aWxkX21ldGEKIAotLSAKMi40Ny4xCgo=

--===============1122338726205376732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-sphinxcontrib-svg2pdfconverter: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinxcontrib-svg2pdfconverter: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinxcontrib_svg2pdfconverter/sphinxcontrib_svg2pdfconverter-2.0.0.tar.gz;downloadfilename=sphinxcontrib_svg2pdfconverter-2.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sphinxcontrib_svg2pdfconverter/sphinxcontrib_svg2pdfconverter-2.1.0.tar.gz;downloadfilename=sphinxcontrib_svg2pdfconverter-2.1.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-sphinxcontrib-svg2pdfconverter: PV changed from "2.0.0" to "2.1.0"
packages/x86-64-v3-poky-linux/python3-sphinxcontrib-svg2pdfconverter/python3-sphinxcontrib-svg2pdfconverter-dbg: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinxcontrib-svg2pdfconverter/python3-sphinxcontrib-svg2pdfconverter-dbg: PV changed from "2.0.0" to "2.1.0"
packages/x86-64-v3-poky-linux/python3-sphinxcontrib-svg2pdfconverter/python3-sphinxcontrib-svg2pdfconverter-dev: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinxcontrib-svg2pdfconverter/python3-sphinxcontrib-svg2pdfconverter-dev: PV changed from "2.0.0" to "2.1.0"
packages/x86-64-v3-poky-linux/python3-sphinxcontrib-svg2pdfconverter/python3-sphinxcontrib-svg2pdfconverter-doc: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinxcontrib-svg2pdfconverter/python3-sphinxcontrib-svg2pdfconverter-doc: PV changed from "2.0.0" to "2.1.0"
packages/x86-64-v3-poky-linux/python3-sphinxcontrib-svg2pdfconverter/python3-sphinxcontrib-svg2pdfconverter-locale: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinxcontrib-svg2pdfconverter/python3-sphinxcontrib-svg2pdfconverter-locale: PV changed from "2.0.0" to "2.1.0"
packages/x86-64-v3-poky-linux/python3-sphinxcontrib-svg2pdfconverter/python3-sphinxcontrib-svg2pdfconverter-src: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinxcontrib-svg2pdfconverter/python3-sphinxcontrib-svg2pdfconverter-src: PV changed from "2.0.0" to "2.1.0"
packages/x86-64-v3-poky-linux/python3-sphinxcontrib-svg2pdfconverter/python3-sphinxcontrib-svg2pdfconverter-staticdev: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinxcontrib-svg2pdfconverter/python3-sphinxcontrib-svg2pdfconverter-staticdev: PV changed from "2.0.0" to "2.1.0"
packages/x86-64-v3-poky-linux/python3-sphinxcontrib-svg2pdfconverter/python3-sphinxcontrib-svg2pdfconverter: PKGSIZE changed from 30730 to 31029 (+1%)
packages/x86-64-v3-poky-linux/python3-sphinxcontrib-svg2pdfconverter/python3-sphinxcontrib-svg2pdfconverter: FILELIST: directory renamed /usr/lib/python3.14/site-packages/sphinxcontrib_svg2pdfconverter-2.0.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/sphinxcontrib_svg2pdfconverter-2.1.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/sphinxcontrib_svg2pdfconverter-2.0.0.dist-info -> /usr/lib/python3.14/site-packages/sphinxcontrib_svg2pdfconverter-2.1.0.dist-info, removed "/usr/lib/python3.14/site-packages/sphinxcontrib/__pycache__/cairosvgconverter.cpython-314.pyc /usr/lib/python3.14/site-packages/sphinxcontrib/rsvgconverter.py /usr/lib/python3.14/site-packages/sphinxcontrib/cairosvgconverter.py /usr/lib/python3.14/site-packages/sphinxcontrib/__init__.py /usr/lib/python3.14/site-packages/sphinxcontrib/__pycache__/rsvgconverter.cpython-314.pyc /usr/lib/python3.14/site-packages/sphinxcontrib/__pycache__/inkscapeconverter.cpython-314.pyc /usr/lib/pyt
 hon3.14/site-packages/sphinxcontrib/inkscapeconverter.py /usr/lib/python3.14/site-packages/sphinxcontrib/__pycache__/__init__.cpython-314.pyc", added "/usr/lib/python3.14/site-packages/sphinxcontrib/cairosvgconverter/__pycache__/cairosvgconverter.cpython-314.pyc /usr/lib/python3.14/site-packages/sphinxcontrib/rsvgconverter/__init__.py /usr/lib/python3.14/site-packages/sphinxcontrib/rsvgconverter/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/sphinxcontrib/rsvgconverter/__pycache__/rsvgconverter.cpython-314.pyc /usr/lib/python3.14/site-packages/sphinxcontrib/inkscapeconverter/inkscapeconverter.py /usr/lib/python3.14/site-packages/sphinxcontrib/inkscapeconverter/__init__.py /usr/lib/python3.14/site-packages/sphinxcontrib/cairosvgconverter/__init__.py /usr/lib/python3.14/site-packages/sphinxcontrib/inkscapeconverter/__pycache__/inkscapeconverter.cpython-314.pyc /usr/lib/python3.14/site-packages/sphinxcontrib/cairosvgconverter/cairosvgconverter.py /usr/lib/python
 3.14/site-packages/sphinxcontrib/cairosvgconverter/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/sphinxcontrib/inkscapeconverter/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/sphinxcontrib/rsvgconverter/rsvgconverter.py"
packages/x86-64-v3-poky-linux/python3-sphinxcontrib-svg2pdfconverter/python3-sphinxcontrib-svg2pdfconverter: PKGV changed from 2.0.0 [default] to 2.1.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinxcontrib-svg2pdfconverter/python3-sphinxcontrib-svg2pdfconverter: PV changed from "2.0.0" to "2.1.0"
Changes to packages/x86-64-v3-poky-linux/python3-sphinxcontrib-svg2pdfconverter (sysroot):
  /usr/lib/python3.14/site-packages/sphinxcontrib_svg2pdfconverter-2.0.0.dist-info moved to /usr/lib/python3.14/site-packages/sphinxcontrib_svg2pdfconverter-2.1.0.dist-info
  /usr/lib/python3.14/site-packages/sphinxcontrib/cairosvgconverter was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/cairosvgconverter/cairosvgconverter.py was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/cairosvgconverter/__init__.py was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/cairosvgconverter/__pycache__ was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/cairosvgconverter/__pycache__/cairosvgconverter.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/cairosvgconverter/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/inkscapeconverter was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/inkscapeconverter/__init__.py was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/inkscapeconverter/inkscapeconverter.py was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/inkscapeconverter/__pycache__ was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/inkscapeconverter/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/inkscapeconverter/__pycache__/inkscapeconverter.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/rsvgconverter was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/rsvgconverter/__init__.py was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/rsvgconverter/__pycache__ was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/rsvgconverter/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/rsvgconverter/__pycache__/rsvgconverter.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/rsvgconverter/rsvgconverter.py was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/cairosvgconverter.py was removed
  /usr/lib/python3.14/site-packages/sphinxcontrib/__init__.py was removed
  /usr/lib/python3.14/site-packages/sphinxcontrib/inkscapeconverter.py was removed
  /usr/lib/python3.14/site-packages/sphinxcontrib/__pycache__ was removed
  /usr/lib/python3.14/site-packages/sphinxcontrib/__pycache__/cairosvgconverter.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/sphinxcontrib/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/sphinxcontrib/__pycache__/inkscapeconverter.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/sphinxcontrib/__pycache__/rsvgconverter.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/sphinxcontrib/rsvgconverter.py was removed

--===============1122338726205376732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 64 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-a2b74749a9b03bc816872a5f0c0dde8f1fad16cb"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:a2b74749a9b03bc816872a5f0c0dde8f1fad16cb"
meta-yocto-bsp       
meta-poky            = "master:31e68c7cf6a3686bedbcbdd99056bbd23dda2551"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 761 Local 627 Mirrors 0 Missed 134 Current 308 (82% match, 87% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 312 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_package_qa_setscene)
NOTE: Running setscene task 354 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 402 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 404 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 420 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 438 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 1069 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 444 of 1069 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cargo-c/cargo-c_0.10.21+cargo-0.95.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 456 of 1069 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 461 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 463 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 472 of 1069 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 474 of 1069 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_create_spdx_setscene)
NOTE: Running setscene task 477 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.0.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-packaging-26.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.94.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-docutils-native-0.22.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe vala-native-0.56.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-native-78.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-native-2.44.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe cargo-c-native-0.10.21+cargo-0.95.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 501 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_create_spdx_setscene)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.3-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 520 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 536 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.94.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 537 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-packaging-26.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 543 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.4.bb:do_create_spdx_setscene)
NOTE: recipe vala-native-0.56.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdk-pixbuf-native-2.44.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-docutils-native-0.22.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 554 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 556 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.0.bb:do_populate_sysroot_setscene)
NOTE: recipe cargo-c-native-0.10.21+cargo-0.95.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe icu-native-78.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 560 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 561 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 564 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 569 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.15.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.94.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.86.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.94.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.61.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 571 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.57.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 575 of 1069 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 576 of 1069 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.94.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 579 of 1069 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 584 of 1069 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cargo-c/cargo-c_0.10.21+cargo-0.95.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 586 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 587 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_spdx_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 590 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 592 of 1069 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-2.61.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 593 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-native-0.56.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-docutils-native-0.22.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.86.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 594 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx_setscene)
NOTE: recipe icu-native-78.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cargo-c-native-0.10.21+cargo-0.95.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 595 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-78.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 597 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 598 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 600 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 601 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 602 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 604 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.4.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-78.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 605 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 606 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.86.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-docutils-native-0.22.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 607 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.2.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 609 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.14.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-native-0.56.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 614 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 620 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 623 of 1069 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.4.bb:do_create_spdx_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 625 of 1069 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_create_spdx_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 626 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.4.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 632 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 633 of 1069 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-native-1_2.86.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.14.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 635 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.55.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.86.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 640 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 641 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-native-0.56.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.55-r0: task do_create_spdx_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 642 of 1069 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-native-1_2.86.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe freetype-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 643 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 644 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.86.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 645 of 1069 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-native-0.56.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 646 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 647 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.55-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 653 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-docutils-native-0.22.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 661 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 667 of 1069 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-docutils-native-0.22.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 668 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 670 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 671 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 672 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe meson-native-1.10.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 673 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 674 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe xmlto-native-0.0.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 677 of 1069 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 679 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.86.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 680 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.55.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe meson-native-1.10.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 682 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 683 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.55.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 684 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 685 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.55-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 686 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.55-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 688 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 689 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 691 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.55-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 692 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 693 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.55-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 694 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 698 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 701 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 703 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 706 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.55.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 707 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-82.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 709 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.55-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-82.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.86.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 711 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.55-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 713 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 715 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-setuptools/82.0.0/temp/log.do_packagedata_setscene.1810602
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 716 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.0.bb:do_package_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 719 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 720 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 721 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 726 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 727 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 728 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-82.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 729 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 730 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-native-78.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 732 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-82.0.0-r0: task do_package_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 733 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 734 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 735 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 737 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 738 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 746 of 1069 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 748 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 749 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 752 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 753 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-native-78.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 755 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 758 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 759 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 762 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 763 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 764 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-native-78.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 961 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_fetch)
NOTE: Running task 1008 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 768 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 770 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1047 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: Running task 1048 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_recipe_qa)
NOTE: Running task 1124 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: Running task 1125 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_write_config)
NOTE: Running task 1160 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_fetch)
NOTE: Running task 1161 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_fetch)
NOTE: Running task 1162 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_fetch)
NOTE: recipe icu-78.2-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-82.0.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 772 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_recipe_qa: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: recipe cargo-c-native-0.10.21+cargo-0.95.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_write_config: Started
NOTE: Running setscene task 773 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-12.3.2-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-82.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 775 of 1069 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cargo-c/cargo-c_0.10.21+cargo-0.95.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1178 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_fetch)
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1179 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_write_config: Succeeded
NOTE: Running task 1180 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_fetch)
NOTE: recipe python3-setuptools-82.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: Running task 1195 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_fetch)
NOTE: Running task 1207 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_write_config)
NOTE: recipe python3-3.14.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running task 1208 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_write_config)
NOTE: recipe vala-0.56.18-r0: task do_fetch: Started
NOTE: recipe cargo-c-native-0.10.21+cargo-0.95.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.16-r0: task do_write_config: Started
NOTE: recipe librsvg-2.61.3-r0: task do_fetch: Started
NOTE: recipe python3-3.14.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 776 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 777 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe cargo-c-native-0.10.21+cargo-0.95.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 778 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 779 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_write_config: Succeeded
NOTE: Running setscene task 780 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 781 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-12.3.2-r0: task do_write_config: Succeeded
NOTE: Running setscene task 782 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.94.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 783 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: Running setscene task 784 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 785 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 790 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.0.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 791 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 795 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.94.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 800 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 805 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 813 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1209 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_unpack)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_unpack: Started
NOTE: recipe vala-0.56.18-r0: task do_fetch: Succeeded
NOTE: Running task 1210 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_fetch)
NOTE: recipe libstd-rs-1.94.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1211 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: recipe python3-3.14.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 824 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 825 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.4.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-12.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 826 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 827 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 829 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: Running setscene task 830 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 831 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 832 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 844 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_packagedata_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 847 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 851 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.51.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: Running setscene task 852 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 853 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 856 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 858 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 860 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 862 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 863 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 864 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 865 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 866 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.51.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 871 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 874 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 877 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 885 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_fetch: Succeeded
NOTE: Running setscene task 886 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 888 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 889 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.18.0.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 891 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.0.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 893 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 908 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 918 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 919 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 922 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 923 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 925 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.51.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 928 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 929 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 930 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 932 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 933 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 934 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 935 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 940 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 944 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.4.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 946 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 949 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 951 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.59-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 953 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 955 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 957 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 960 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 961 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 964 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 965 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 967 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 970 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 982 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 984 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 985 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.59-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 987 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1257 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 997 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 999 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1267 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_unpack)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1275 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 1006 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_patch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1328 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_unpack)
NOTE: Running task 1334 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_unpack)
NOTE: recipe openssl-3.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1012 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1335 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1017 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: Running task 1347 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_unpack: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_unpack: Started
NOTE: Running task 1348 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1354 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_generate_toolchain_file)
NOTE: recipe harfbuzz-12.3.2-r0: task do_unpack: Started
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_unpack: Started
NOTE: Running task 1360 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_unpack)
NOTE: recipe pango-1.57.0-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe icu-78.2-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1361 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_unpack)
NOTE: recipe vala-0.56.18-r0: task do_unpack: Started
NOTE: Running task 1362 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_patch)
NOTE: Running task 1373 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_write_config)
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch unihash changed to 136350031d83ff80d2178fe7f5bb53f40f8ba9323098440c9eeaf382a9eb415c
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1024 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 1378 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_patch)
NOTE: Running task 1415 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_write_config)
NOTE: recipe icu-78.2-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_patch: Started
NOTE: recipe pango-1.57.0-r0: task do_write_config: Started
NOTE: Running task 1489 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb:do_recipe_qa)
NOTE: recipe fribidi-1.0.16-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1490 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_patch)
NOTE: recipe pango-1.57.0-r0: task do_unpack: Succeeded
NOTE: Running task 1491 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_patch)
NOTE: recipe libxft-1_2.3.9-r0: task do_patch: Succeeded
NOTE: Running task 1492 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_patch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_deploy_source_date_epoch unihash changed to 8fb01876969a4a9804fe4db0071118a83ef3fb8081f6bfb9c30c1a340bac5a4b
NOTE: recipe pango-1.57.0-r0: task do_write_config: Succeeded
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_recipe_qa: Started
NOTE: recipe fribidi-1.0.16-r0: task do_patch: Started
NOTE: recipe librsvg-2.61.3-r0: task do_write_config: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.57.0-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1012 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1017 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1026 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1027 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1032 of 1069 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1035 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: Running task 1494 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1495 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_patch)
NOTE: Running task 1496 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1497 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1498 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_recipe_qa)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_deploy_source_date_epoch unihash changed to 9dd63fc23f766eb264b4568db86fb2a9524594bc06432349977495fdc17231f5
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-9.1.0-r0: task do_recipe_qa: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.57.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe meson-native-1.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_deploy_source_date_epoch unihash changed to 66162152275d4d00e1507c398cfb40a19256a828e574051913476ae0a30aa314
NOTE: recipe harfbuzz-12.3.2-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_deploy_source_date_epoch unihash changed to f067a1a02e716fb8a003707af091d84c90b8c7b284e864ee06a25fe708d74fe5
NOTE: recipe python3-sphinx-9.1.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe meson-native-1.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1027 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1031 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1040 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1548 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_patch)
NOTE: Running task 1556 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 1566 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb:do_fetch)
NOTE: Running task 1567 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_fetch)
NOTE: Running task 1570 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1609 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_recipe_qa)
NOTE: Running task 1610 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.18.0.bb:do_recipe_qa)
NOTE: Running task 1611 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.0.bb:do_recipe_qa)
NOTE: Running task 1645 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_recipe_qa)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1646 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_recipe_qa)
NOTE: Running task 1647 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb:do_recipe_qa)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_fetch: Started
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-9.1.0-r0: task do_fetch: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-babel-2.18.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-imagesize-2.0.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1648 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb:do_unpack)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-docutils-0.22.4-r0: task do_recipe_qa: Started
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_recipe_qa: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1649 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe harfbuzz-12.3.2-r0: task do_patch: Succeeded
NOTE: Running task 1650 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1656 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-78.2-r0: task do_unpack: Succeeded
NOTE: Running task 1657 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_patch)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1042 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1658 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb:do_patch)
NOTE: recipe harfbuzz-12.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-78.2-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1659 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1660 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_recipe_qa)
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-9.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1661 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1662 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_deploy_source_date_epoch unihash changed to bb1ba8e913f38953c8512d41b8ddf04bef8b64cb33950078fa49075fbce4713a
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_recipe_qa: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-9.1.0-r0: task do_unpack: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_deploy_source_date_epoch unihash changed to a6396debd7fb3fbdf8532a8d3ecee0ca7de077650671e6aa00cecf8b2e8506b0
NOTE: recipe python3-docutils-0.22.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-imagesize-2.0.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-babel-2.18.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe icu-78.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-9.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 1033 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 1036 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1039 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running task 1663 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1664 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_patch)
NOTE: Running task 1665 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: Running task 1666 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.18.0.bb:do_fetch)
NOTE: Running task 1667 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.0.bb:do_fetch)
NOTE: Running task 1669 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1670 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_recipe_qa)
NOTE: Running task 1671 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_recipe_qa)
NOTE: Running task 1672 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_recipe_qa)
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1673 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_recipe_qa)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-babel-2.18.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-9.1.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe python3-imagesize-2.0.0-r0: task do_fetch: Started
NOTE: recipe icu-78.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1674 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_recipe_qa)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1675 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe python3-requests-2.32.5-r0: task do_recipe_qa: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1677 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_recipe_qa)
NOTE: Running task 1683 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_fetch)
NOTE: Running task 1684 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe python3-sphinx-9.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1685 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1686 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe python3-imagesize-2.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1687 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_fetch)
NOTE: Running task 1688 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-docutils-0.22.4-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-9.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_fetch: Started
NOTE: recipe icu-78.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_deploy_source_date_epoch unihash changed to 5703ff579e995e875fb31afee147451cb82b75235c558a20fea1e8a0de56f89d
NOTE: recipe python3-alabaster-1.0.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-babel-2.18.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.22.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-requests-2.32.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-sphinx-9.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_deploy_source_date_epoch unihash changed to f998fd2aaad5c25d5671cb8764179e848d7435acf221417aefb536aaa98dea5f
NOTE: Running setscene task 1030 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1034 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1689 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_fetch)
NOTE: Running task 1690 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_fetch)
NOTE: Running task 1691 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_fetch)
NOTE: Running task 1692 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_fetch)
NOTE: Running task 1693 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_fetch)
NOTE: Running task 1695 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_fetch)
NOTE: Running task 1701 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 1702 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.18.0.bb:do_unpack)
NOTE: Running task 1703 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.0.bb:do_unpack)
NOTE: Running task 1726 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_fetch)
NOTE: Running task 1738 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_unpack)
NOTE: Running task 1739 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_unpack)
NOTE: Running task 1740 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb:do_unpack)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_fetch: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: recipe python3-babel-2.18.0-r0: task do_unpack: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe python3-imagesize-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-docutils-0.22.4-r0: task do_unpack: Started
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_unpack: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-imagesize-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1741 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_unpack)
NOTE: Running task 1742 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: Running task 1743 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.0.bb:do_patch)
NOTE: Running task 1751 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_patch)
NOTE: Running task 1752 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.22.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.32.5-r0: task do_fetch: Succeeded
NOTE: Running task 1753 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_unpack)
NOTE: Running task 1754 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_unpack)
NOTE: Running task 1755 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_unpack)
NOTE: Running task 1756 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_unpack)
NOTE: Running task 1757 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_unpack)
NOTE: Running task 1758 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_patch)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1759 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_unpack)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-imagesize-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_unpack: Started
NOTE: Running task 1782 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_unpack: Started
NOTE: recipe python3-docutils-0.22.4-r0: task do_patch: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1783 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_patch)
NOTE: Running setscene task 1054 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.32.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-babel-2.18.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1055 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1784 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.18.0.bb:do_patch)
NOTE: Running task 1785 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_patch)
NOTE: Running task 1786 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_patch)
NOTE: Running task 1787 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_patch)
NOTE: Running task 1788 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_patch)
NOTE: Running task 1789 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-imagesize-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-docutils-0.22.4-r0: task do_patch: Succeeded
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_patch: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_patch: Started
NOTE: Running task 1790 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_patch)
NOTE: Running task 1796 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_unpack)
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-babel-2.18.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_patch: Started
NOTE: Running task 1858 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1859 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1860 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_patch: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-docutils-0.22.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1861 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1862 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_patch)
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1866 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_check_backend)
NOTE: recipe python3-babel-2.18.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-requests-2.32.5-r0: task do_patch: Succeeded
NOTE: Running task 1867 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1868 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1869 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1870 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1871 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1872 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1873 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_check_backend: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1056 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1057 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_check_backend: Succeeded
NOTE: Running setscene task 1061 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_deploy_source_date_epoch unihash changed to 22c300f9feaf38030d03b54d8cf6f0a295d7a9c8818f837248101cbb1799cc02
NOTE: recipe python3-docutils-0.22.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.32.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_deploy_source_date_epoch unihash changed to 37e299dcf733a3e36e60645e699086fc1a614fdd134d7081d8dbaa2806d59297
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_deploy_source_date_epoch unihash changed to f3389b681c49c32c799b343f53b4ff82b58725eab6c19241a2bdb2fa363a4f54
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_deploy_source_date_epoch unihash changed to c35294f67615a84210f85ef8e62e9725adad718690ea75bb97dbc901cc3645ce
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_deploy_source_date_epoch unihash changed to d191c2f06a588dfadcec7b1a1e07d28c407f85a4c601795c2c632fcc0afdeb2c
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_deploy_source_date_epoch unihash changed to e50bc13a57a199718e3d9c3aa8b8b83d5dcf51545ee5d1aebb4da8dbf20ea81f
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb:do_deploy_source_date_epoch unihash changed to da0a178a868ebff7215207b14d871137b66a0716606c4c8b0f4fefcdd40e292f
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch unihash changed to 6bd4010145a8e9269bc2e9f06026ed45f2af2fdaf9ad7ffe431b4d846063d0f2
NOTE: Running setscene task 1043 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_deploy_source_date_epoch unihash changed to 63c4e39be74cd9dad2dd89e8bf1ae4886da8578e533019d5c199266d38127768
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_deploy_source_date_epoch unihash changed to 0a5e1f6859e692cf09e54512bbd5f0955db319aaf6b9cfa03cda2a85d3d2314c
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_deploy_source_date_epoch unihash changed to c98f58f9d296ee58cf214f64e339194d8bff3467118683797c2da6aa92d04ad8
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1041 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1044 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1047 of 1069 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running task 1885 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.18.0.bb:do_check_backend)
NOTE: Running task 1886 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.18.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1887 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.0.bb:do_check_backend)
NOTE: Running task 1888 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1928 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1929 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1946 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb:do_populate_lic)
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-babel-2.18.0-r0: task do_check_backend: Started
NOTE: recipe python3-babel-2.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-imagesize-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-imagesize-2.0.0-r0: task do_check_backend: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_populate_lic: Started
NOTE: recipe python3-babel-2.18.0-r0: task do_check_backend: Succeeded
NOTE: recipe python3-imagesize-2.0.0-r0: task do_check_backend: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2227 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2279 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2280 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2411 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2412 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2414 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2437 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.0.bb:do_packagedata)
NOTE: recipe icu-78.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_deploy_source_date_epoch unihash changed to 3f14bbc7987249eee3d9ad5e087dcc777f9b63ed091dbcbbdd33baa3c72c3a02
NOTE: recipe libxft-1_2.3.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-82.0.0-r0: task do_packagedata: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Setscene tasks completed
NOTE: Running task 2627 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2630 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-babel-2.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-78.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2699 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-imagesize-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2700 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 2701 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2702 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_make_icudata)
NOTE: Running task 2703 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2704 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-82.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-9.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2716 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.22.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2717 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_configure)
NOTE: recipe libxft-1_2.3.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-78.2-r0: task do_make_icudata: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2718 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_configure: Started
NOTE: recipe icu-78.2-r0: task do_make_icudata: Succeeded
NOTE: Running task 2719 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_configure)
NOTE: recipe fribidi-1.0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2720 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_configure)
NOTE: recipe icu-78.2-r0: task do_configure: Started
NOTE: Running task 2721 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe fribidi-1.0.16-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2722 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_configure)
NOTE: Running task 2723 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-9.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2724 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb:do_configure)
NOTE: Running task 2725 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_configure)
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_configure: Started
NOTE: Running task 2726 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-docutils-0.22.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2727 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2728 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_configure: Started
NOTE: Running task 2730 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-9.1.0-r0: task do_configure: Started
NOTE: Running task 2731 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2732 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.18.0.bb:do_prepare_recipe_sysroot)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: Running task 2735 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-requests-2.32.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-babel-2.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-imagesize-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-9.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2736 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_compile)
NOTE: Running task 2737 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb:do_compile)
NOTE: recipe python3-sphinx-9.1.0-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_compile: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2750 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_configure)
NOTE: recipe python3-requests-2.32.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2751 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_configure)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2752 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb:do_configure)
NOTE: recipe python3-imagesize-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2753 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_configure)
NOTE: recipe python3-babel-2.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2754 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2755 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_configure: Started
NOTE: Running task 2756 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_configure)
NOTE: recipe python3-docutils-0.22.4-r0: task do_configure: Started
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_configure: Started
NOTE: recipe python3-docutils-0.22.4-r0: task do_configure: Succeeded
NOTE: Running task 2757 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2758 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_configure)
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2760 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_configure)
NOTE: Running task 2761 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_configure)
NOTE: Running task 2762 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.18.0.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2763 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.0.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_configure: Started
NOTE: Running task 2770 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_compile)
NOTE: recipe python3-requests-2.32.5-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_configure: Started
NOTE: recipe python3-babel-2.18.0-r0: task do_configure: Started
NOTE: recipe python3-imagesize-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_configure: Succeeded
NOTE: recipe python3-babel-2.18.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2771 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2772 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_compile)
NOTE: Running task 2773 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb:do_compile)
NOTE: Running task 2774 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_compile)
NOTE: recipe python3-requests-2.32.5-r0: task do_configure: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2775 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_compile)
NOTE: recipe python3-imagesize-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2776 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_compile)
NOTE: Running task 2777 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_compile: Started
NOTE: recipe python3-docutils-0.22.4-r0: task do_compile: Started
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.16-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinx-9.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2778 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_compile)
NOTE: Running task 2779 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_install)
NOTE: recipe fribidi-1.0.16-r0: task do_compile: Started
NOTE: recipe python3-sphinx-9.1.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2780 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb:do_install)
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2781 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2782 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_compile)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2784 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_compile)
NOTE: Running task 2785 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_compile)
NOTE: recipe python3-docutils-0.22.4-r0: task do_compile: Succeeded
NOTE: Running task 2786 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.18.0.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2787 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.0.bb:do_compile)
NOTE: recipe python3-requests-2.32.5-r0: task do_compile: Started
NOTE: Running task 2794 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_install)
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Started
NOTE: Running task 2795 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb:do_package)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_compile: Started
NOTE: Running task 2796 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_compile)
NOTE: recipe python3-babel-2.18.0-r0: task do_compile: Started
NOTE: recipe python3-imagesize-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 2797 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_install)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2798 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb:do_install)
NOTE: recipe python3-docutils-0.22.4-r0: task do_install: Started
NOTE: recipe fribidi-1.0.16-r0: task do_compile: Succeeded
NOTE: Running task 2799 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_install)
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_install: Started
NOTE: recipe fribidi-1.0.16-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2800 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_install)
NOTE: recipe python3-imagesize-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2801 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_install)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_install: Started
NOTE: recipe python3-sphinx-9.1.0-r0: task do_install: Succeeded
NOTE: Running task 2802 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-9.1.0-r0: task do_package: Started
NOTE: Running task 2803 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb:do_packagedata)
NOTE: recipe python3-requests-2.32.5-r0: task do_compile: Succeeded
NOTE: Running task 2804 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_install)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2805 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_install)
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_install: Succeeded
NOTE: Running task 2806 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_install)
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_install: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_install: Started
NOTE: recipe fribidi-1.0.16-r0: task do_install: Succeeded
NOTE: Running task 2807 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_install: Succeeded
NOTE: Running task 2808 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_package)
NOTE: Running task 2809 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_install)
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.16-r0: task do_package: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_install: Started
NOTE: recipe python3-docutils-0.22.4-r0: task do_install: Succeeded
NOTE: Running task 2811 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2813 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_install: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_install: Succeeded
NOTE: Running task 2814 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.0.bb:do_install)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 2826 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package)
NOTE: recipe python3-imagesize-2.0.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 2827 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_package)
NOTE: recipe icu-78.2-r0: task do_configure: Succeeded
NOTE: Running task 2828 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_configure_ptest_base)
NOTE: recipe python3-requests-2.32.5-r0: task do_install: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2829 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_install)
NOTE: recipe python3-docutils-0.22.4-r0: task do_package: Started
NOTE: Running task 2830 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb:do_package)
NOTE: recipe icu-78.2-r0: task do_configure_ptest_base: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2831 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_install: Started
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Succeeded
NOTE: Running task 2832 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package)
NOTE: recipe icu-78.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package: Started
NOTE: Running task 2833 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Succeeded
NOTE: recipe icu-78.2-r0: task do_compile: Started
NOTE: Running task 2834 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_install)
NOTE: recipe python3-imagesize-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 2835 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package)
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_install: Succeeded
NOTE: Running task 2836 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_populate_sysroot)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_install: Succeeded
NOTE: Running task 2837 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_package)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-babel-2.18.0-r0: task do_compile: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_package: Started
NOTE: Running task 2838 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.18.0.bb:do_install)
NOTE: recipe python3-babel-2.18.0-r0: task do_install: Started
NOTE: recipe fribidi-1.0.16-r0: task do_package: Succeeded
NOTE: Running task 2839 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata)
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2840 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata: Succeeded
NOTE: Running task 2841 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package: Started
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_package: Succeeded
NOTE: Running task 2842 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_package)
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Succeeded
NOTE: Running task 2843 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot)
NOTE: recipe python3-requests-2.32.5-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package: Succeeded
NOTE: Running task 2844 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.18.0-r0: task do_install: Succeeded
NOTE: Running task 2846 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package)
NOTE: Running task 2848 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_package)
NOTE: Running task 2849 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.18.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package: Started
NOTE: recipe python3-babel-2.18.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_configure: Succeeded
NOTE: Running task 2850 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.0.bb:do_package)
NOTE: Running task 2851 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_compile)
NOTE: recipe python3-docutils-0.22.4-r0: task do_package: Succeeded
NOTE: Running task 2861 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_packagedata)
NOTE: recipe python3-imagesize-2.0.0-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_packagedata: Started
NOTE: Running task 2862 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package: Succeeded
NOTE: Running task 2863 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.22.4-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_package: Succeeded
NOTE: Running task 2864 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2865 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb:do_packagedata)
NOTE: recipe python3-sphinx-9.1.0-r0: task do_package: Succeeded
NOTE: Running task 2866 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_packagedata)
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-docutils-0.22.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2867 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_packagedata)
NOTE: recipe python3-sphinx-9.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_package: Succeeded
NOTE: Running task 2868 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_packagedata: Started
NOTE: Running task 2869 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2870 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package: Succeeded
NOTE: Running task 2871 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Succeeded
NOTE: Running task 2872 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_packagedata)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_compile: Succeeded
NOTE: recipe python3-roman-numerals-4.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2873 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_install)
NOTE: recipe python3-sphinx-9.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2874 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2876 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata)
NOTE: Running task 2886 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_configure)
NOTE: Running task 2887 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb:do_populate_sysroot)
NOTE: recipe libxft-1_2.3.9-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-requests-2.32.5-r0: task do_packagedata: Started
NOTE: Running task 2890 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb:do_collect_spdx_deps)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_populate_sysroot: Started
NOTE: Running task 2892 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package: Succeeded
NOTE: Running task 2893 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: Running task 2894 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_compile)
NOTE: recipe python3-imagesize-2.0.0-r0: task do_package: Succeeded
NOTE: recipe icu-78.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2895 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_2.0.0.bb:do_packagedata)
NOTE: recipe vala-0.56.18-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2896 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_compile)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_packagedata: Started
NOTE: Running task 2899 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_collect_spdx_deps)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe python3-imagesize-2.0.0-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.18-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Running task 2900 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_install)
NOTE: recipe icu-78.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2901 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_collect_spdx_deps)
NOTE: Running task 2902 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_install: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_install: Started
NOTE: Running task 2903 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_collect_spdx_deps)
NOTE: recipe fribidi-1.0.16-r0: task do_collect_spdx_deps: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2904 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_populate_sysroot)
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2905 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_package)
NOTE: recipe libxft-1_2.3.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2906 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb:do_create_spdx)
NOTE: Running task 2909 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_collect_spdx_deps)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2911 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_collect_spdx_deps)
NOTE: recipe shared-mime-info-2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe fribidi-1.0.16-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot: Started
NOTE: Running task 2912 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_create_spdx)
NOTE: recipe libxft-1_2.3.9-r0: task do_package: Started
NOTE: Running task 2913 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_create_spdx)
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_create_spdx: Started
NOTE: recipe vala-0.56.18-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-imagesize-2.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2914 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_populate_sysroot)
NOTE: recipe python3-sphinx-9.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_spdx: Started
NOTE: Running task 2915 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe python3-sphinx-9.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-sphinx-9.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_populate_sysroot unihash changed to 51778725f194616169f7bd986fe6a210102aab443a45fbba5c1fe4f7017cc1bc
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-sphinx-9.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2920 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_create_spdx)
NOTE: recipe python3-sphinx-9.1.0-r0: task do_create_spdx: Started
NOTE: recipe python3-babel-2.18.0-r0: task do_package: Succeeded
NOTE: Running task 2921 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.18.0.bb:do_packagedata)
NOTE: recipe python3-babel-2.18.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-9.1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-babel-2.18.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2922 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_package_write_ipk)
NOTE: Running task 2923 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_package_write_deb)
NOTE: Running task 2924 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_package_write_rpm)
NOTE: Running task 2925 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_package_qa)
NOTE: recipe python3-sphinx-9.1.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-sphinx-9.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinx-9.1.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-sphinx-9.1.0-r0: task do_package_qa: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_configure: Succeeded
NOTE: Running task 2926 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_configure_ptest_base)
NOTE: recipe libxft-1_2.3.9-r0: task do_package: Succeeded
NOTE: Running task 2927 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_configure_ptest_base: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2928 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_compile: Started
NOTE: recipe python3-sphinx-9.1.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinx-9.1.0-r0: task do_package_qa: Succeeded
NOTE: Running task 2929 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_create_spdx)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_package_qa unihash changed to b9f262ea0c7da46136ebeac82b4a5d502fff17a8eb9fef71ee1fa3dd4610310b
NOTE: recipe libxft-1_2.3.9-r0: task do_create_spdx: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_create_spdx: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Succeeded
NOTE: Running task 2930 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-9.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2931 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx)
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2932 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_collect_spdx_deps)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-sphinx-9.1.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_compile: Succeeded
NOTE: Running task 2933 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2934 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_install)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_install: Succeeded
NOTE: Running task 2935 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2936 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_populate_sysroot)
NOTE: Running task 2937 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_package)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package: Succeeded
NOTE: Running task 2938 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2939 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_create_spdx: Started
NOTE: recipe vala-0.56.18-r0: task do_compile: Succeeded
NOTE: Running task 2940 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_install)
NOTE: recipe vala-0.56.18-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_create_spdx: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_install: Succeeded
NOTE: Running task 2941 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_populate_sysroot)
NOTE: Running task 2942 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_package)
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.18-r0: task do_package: Started
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_package: Succeeded
NOTE: Running task 2943 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_packagedata)
NOTE: recipe vala-0.56.18-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2944 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_create_spdx)
NOTE: recipe vala-0.56.18-r0: task do_create_spdx: Started
NOTE: recipe vala-0.56.18-r0: task do_create_spdx: Succeeded
NOTE: recipe icu-78.2-r0: task do_compile: Succeeded
NOTE: Running task 2945 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_compile_ptest_base)
NOTE: recipe icu-78.2-r0: task do_compile_ptest_base: Started
NOTE: recipe librsvg-2.61.3-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2946 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_unpack)
NOTE: recipe librsvg-2.61.3-r0: task do_unpack: Started
NOTE: recipe librsvg-2.61.3-r0: task do_unpack: Succeeded
NOTE: Running task 2947 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_patch)
NOTE: recipe librsvg-2.61.3-r0: task do_patch: Started
NOTE: recipe librsvg-2.61.3-r0: task do_patch: Succeeded
NOTE: Running task 2948 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2949 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_rust_gen_targets)
NOTE: recipe librsvg-2.61.3-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.61.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.61.3-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_deploy_source_date_epoch unihash changed to daa1e36eda1a128a569fc10d594fd3a9626a9a488e507d5daba9ea6b7607ec07
NOTE: Setscene tasks completed
NOTE: recipe icu-78.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2950 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_install)
NOTE: recipe icu-78.2-r0: task do_install: Started
NOTE: recipe icu-78.2-r0: task do_install: Succeeded
NOTE: Running task 2951 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_install_ptest_base)
NOTE: recipe icu-78.2-r0: task do_install_ptest_base: Started
NOTE: recipe icu-78.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2952 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_populate_sysroot)
NOTE: Running task 2953 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_package)
NOTE: recipe icu-78.2-r0: task do_populate_sysroot: Started
NOTE: recipe icu-78.2-r0: task do_package: Started
NOTE: recipe icu-78.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2954 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-12.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2955 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_configure)
NOTE: recipe harfbuzz-12.3.2-r0: task do_configure: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_configure: Succeeded
NOTE: Running task 2956 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_compile)
NOTE: recipe harfbuzz-12.3.2-r0: task do_compile: Started
NOTE: recipe icu-78.2-r0: task do_package: Succeeded
NOTE: Running task 2957 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_packagedata)
NOTE: recipe icu-78.2-r0: task do_packagedata: Started
NOTE: recipe icu-78.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2958 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_create_spdx)
NOTE: recipe icu-78.2-r0: task do_create_spdx: Started
NOTE: recipe icu-78.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2959 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_collect_spdx_deps)
NOTE: recipe harfbuzz-12.3.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_compile: Succeeded
NOTE: Running task 2960 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_install)
NOTE: recipe harfbuzz-12.3.2-r0: task do_install: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_install: Succeeded
NOTE: Running task 2961 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_populate_sysroot)
NOTE: Running task 2962 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_package)
NOTE: recipe harfbuzz-12.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_package: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2963 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.57.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.57.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2964 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_configure)
NOTE: recipe pango-1.57.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_package: Succeeded
NOTE: Running task 2965 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_packagedata)
NOTE: recipe harfbuzz-12.3.2-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2966 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_create_spdx)
NOTE: recipe harfbuzz-12.3.2-r0: task do_create_spdx: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2967 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_collect_spdx_deps)
NOTE: recipe pango-1.57.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe pango-1.57.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_configure: Succeeded
NOTE: Running task 2968 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_compile)
NOTE: recipe pango-1.57.0-r0: task do_compile: Started
NOTE: recipe pango-1.57.0-r0: task do_compile: Succeeded
NOTE: Running task 2969 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_install)
NOTE: recipe pango-1.57.0-r0: task do_install: Started
NOTE: recipe pango-1.57.0-r0: task do_install: Succeeded
NOTE: Running task 2970 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_populate_sysroot)
NOTE: Running task 2971 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_package)
NOTE: recipe pango-1.57.0-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.57.0-r0: task do_package: Started
NOTE: recipe pango-1.57.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2972 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.61.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.61.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2973 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.61.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.61.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2974 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_configure)
NOTE: recipe librsvg-2.61.3-r0: task do_configure: Started
NOTE: recipe pango-1.57.0-r0: task do_package: Succeeded
NOTE: Running task 2975 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_packagedata)
NOTE: recipe pango-1.57.0-r0: task do_packagedata: Started
NOTE: recipe pango-1.57.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2976 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_create_spdx)
NOTE: recipe pango-1.57.0-r0: task do_create_spdx: Started
NOTE: recipe pango-1.57.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2977 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.61.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe librsvg-2.61.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_configure: Succeeded
NOTE: Running task 2978 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_configure_ptest_base)
NOTE: recipe librsvg-2.61.3-r0: task do_configure_ptest_base: Started
NOTE: recipe librsvg-2.61.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2979 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_compile)
NOTE: recipe librsvg-2.61.3-r0: task do_compile: Started
NOTE: recipe librsvg-2.61.3-r0: task do_compile: Succeeded
NOTE: Running task 2980 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_compile_ptest_cargo)
NOTE: recipe librsvg-2.61.3-r0: task do_compile_ptest_cargo: Started
NOTE: recipe librsvg-2.61.3-r0: task do_compile_ptest_cargo: Succeeded
NOTE: Running task 2981 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_compile_ptest_base)
NOTE: recipe librsvg-2.61.3-r0: task do_compile_ptest_base: Started
NOTE: recipe librsvg-2.61.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2982 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_install)
NOTE: recipe librsvg-2.61.3-r0: task do_install: Started
NOTE: recipe librsvg-2.61.3-r0: task do_install: Succeeded
NOTE: Running task 2983 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_install_ptest_base)
NOTE: recipe librsvg-2.61.3-r0: task do_install_ptest_base: Started
NOTE: recipe librsvg-2.61.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2984 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_install_ptest_cargo)
NOTE: Running task 2985 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_populate_sysroot)
NOTE: recipe librsvg-2.61.3-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.61.3-r0: task do_install_ptest_cargo: Started
NOTE: recipe librsvg-2.61.3-r0: task do_install_ptest_cargo: Succeeded
NOTE: Running task 2986 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_package)
NOTE: recipe librsvg-2.61.3-r0: task do_package: Started
NOTE: recipe librsvg-2.61.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_package: Succeeded
NOTE: Running task 2987 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_packagedata)
NOTE: recipe librsvg-2.61.3-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.61.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2988 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_create_spdx)
NOTE: Running task 2989 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_package_write_ipk)
NOTE: Running task 2990 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_package_write_deb)
NOTE: Running task 2991 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_package_write_rpm)
NOTE: Running task 2992 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_package_qa)
NOTE: Running task 2993 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb:do_package_write_ipk)
NOTE: Running task 2994 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb:do_package_write_deb)
NOTE: Running task 2995 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb:do_package_write_rpm)
NOTE: recipe librsvg-2.61.3-r0: task do_create_spdx: Started
NOTE: Running task 2996 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb:do_package_qa)
NOTE: recipe librsvg-2.61.3-r0: task do_package_write_ipk: Started
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_package_write_ipk: Started
NOTE: recipe librsvg-2.61.3-r0: task do_package_write_deb: Started
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe librsvg-2.61.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_package_qa: Started
NOTE: recipe librsvg-2.61.3-r0: task do_package_qa: Started
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2997 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb:do_create_package_spdx)
NOTE: recipe librsvg-2.61.3-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_create_package_spdx: Started
NOTE: recipe librsvg-2.61.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-sphinxcontrib-svg2pdfconverter-2.1.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 2998 of 2998 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2998 tasks of which 2638 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-82.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-src went backwards which would break package feeds (from 0:82.0.1-r0 to 0:82.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-82.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dbg went backwards which would break package feeds (from 0:82.0.1-r0 to 0:82.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-82.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-staticdev went backwards which would break package feeds (from 0:82.0.1-r0 to 0:82.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-82.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dev went backwards which would break package feeds (from 0:82.0.1-r0 to 0:82.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-82.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-doc went backwards which would break package feeds (from 0:82.0.1-r0 to 0:82.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-82.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-locale went backwards which would break package feeds (from 0:82.0.1-r0 to 0:82.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-82.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools went backwards which would break package feeds (from 0:82.0.1-r0 to 0:82.0.0-r0) [version-going-backwards]
ERROR: python3-setuptools-82.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1122338726205376732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-sphinxcontrib-svg2pdfconverter/python3-sphinxcontrib-svg2pdfconverter: FILELIST: directory renamed /usr/lib/python3.14/site-packages/sphinxcontrib_svg2pdfconverter-2.0.0.dist-info -> /usr/lib/python3.14/site-packages/sphinxcontrib_svg2pdfconverter-2.1.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/sphinxcontrib_svg2pdfconverter-2.0.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/sphinxcontrib_svg2pdfconverter-2.1.0.dist-info/licenses, removed "/usr/lib/python3.14/site-packages/sphinxcontrib/__pycache__/rsvgconverter.cpython-314.pyc /usr/lib/python3.14/site-packages/sphinxcontrib/__init__.py /usr/lib/python3.14/site-packages/sphinxcontrib/__pycache__/inkscapeconverter.cpython-314.pyc /usr/lib/python3.14/site-packages/sphinxcontrib/cairosvgconverter.py /usr/lib/python3.14/site-packages/sphinxcontrib/inkscapeconverter.py /usr/lib/python3.14/site-packages/sphinxcontrib/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.
 14/site-packages/sphinxcontrib/__pycache__/cairosvgconverter.cpython-314.pyc /usr/lib/python3.14/site-packages/sphinxcontrib/rsvgconverter.py", added "/usr/lib/python3.14/site-packages/sphinxcontrib/cairosvgconverter/__pycache__/cairosvgconverter.cpython-314.pyc /usr/lib/python3.14/site-packages/sphinxcontrib/inkscapeconverter/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/sphinxcontrib/inkscapeconverter/__init__.py /usr/lib/python3.14/site-packages/sphinxcontrib/rsvgconverter/__pycache__/rsvgconverter.cpython-314.pyc /usr/lib/python3.14/site-packages/sphinxcontrib/inkscapeconverter/inkscapeconverter.py /usr/lib/python3.14/site-packages/sphinxcontrib/rsvgconverter/rsvgconverter.py /usr/lib/python3.14/site-packages/sphinxcontrib/rsvgconverter/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/sphinxcontrib/inkscapeconverter/__pycache__/inkscapeconverter.cpython-314.pyc /usr/lib/python3.14/site-packages/sphinxcontrib/cairosvgconverter/cairos
 vgconverter.py /usr/lib/python3.14/site-packages/sphinxcontrib/cairosvgconverter/__init__.py /usr/lib/python3.14/site-packages/sphinxcontrib/cairosvgconverter/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/sphinxcontrib/rsvgconverter/__init__.py"
Changes to packages/x86-64-v3-poky-linux/python3-sphinxcontrib-svg2pdfconverter (sysroot):
  /usr/lib/python3.14/site-packages/sphinxcontrib_svg2pdfconverter-2.0.0.dist-info moved to /usr/lib/python3.14/site-packages/sphinxcontrib_svg2pdfconverter-2.1.0.dist-info
  /usr/lib/python3.14/site-packages/sphinxcontrib/cairosvgconverter was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/cairosvgconverter/cairosvgconverter.py was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/cairosvgconverter/__init__.py was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/cairosvgconverter/__pycache__ was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/cairosvgconverter/__pycache__/cairosvgconverter.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/cairosvgconverter/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/inkscapeconverter was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/inkscapeconverter/__init__.py was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/inkscapeconverter/inkscapeconverter.py was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/inkscapeconverter/__pycache__ was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/inkscapeconverter/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/inkscapeconverter/__pycache__/inkscapeconverter.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/rsvgconverter was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/rsvgconverter/__init__.py was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/rsvgconverter/__pycache__ was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/rsvgconverter/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/rsvgconverter/__pycache__/rsvgconverter.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/rsvgconverter/rsvgconverter.py was added
  /usr/lib/python3.14/site-packages/sphinxcontrib/cairosvgconverter.py was removed
  /usr/lib/python3.14/site-packages/sphinxcontrib/__init__.py was removed
  /usr/lib/python3.14/site-packages/sphinxcontrib/inkscapeconverter.py was removed
  /usr/lib/python3.14/site-packages/sphinxcontrib/__pycache__ was removed
  /usr/lib/python3.14/site-packages/sphinxcontrib/__pycache__/cairosvgconverter.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/sphinxcontrib/__pycache__/__init__.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/sphinxcontrib/__pycache__/inkscapeconverter.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/sphinxcontrib/__pycache__/rsvgconverter.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/sphinxcontrib/rsvgconverter.py was removed

--===============1122338726205376732==--

