Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C76E5F428C6
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:40 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19821.1776261880313926298
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=CEvzDEEc;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pCvjuIFO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019d917557cc-b01510a2-1409-4579-bff2-aa990d444029-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261879;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0Z1JeT2AALGuATdkSVtM2pYGk9NRWYvaEDT/LQDFLUo=;
	b=CEvzDEEcWjjL4XbbF9eBk1a0MBw2+iYbx46Lg7xllBAF+z/JnjbpWalPXZfoKLhm
	47/yerDyZgcvb7hjXX9A2xItQxuTgOMizk9sEH1zJbii2XYtQAj0gGLqzqsnbrKQPTQ
	4H5FKqEj+ZQHMk3tEpifOTAvDg0nVSwq5W+i4KIA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261879;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0Z1JeT2AALGuATdkSVtM2pYGk9NRWYvaEDT/LQDFLUo=;
	b=pCvjuIFO2z7cohr//NO1dtDisoYLpOCUcoCnXVP3jP3AT1Nv+ymHI5QsXIJt0zmh
	8rAxfprmYpaIysOzxWqxjLqQJIvWjgTWZNXhgWp5i6qMDEuGwzXqkjSwiYYBcsSzylM
	0BOETFwrL0OGzCzbnQ15fEfPCoQRzetUgpbupur4=
Content-Type: multipart/mixed; boundary="===============0987832457028873383=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm-backend: upgrading to 2.4.8 SUCCEEDED
Message-ID: <0101019d917557cc-b01510a2-1409-4579-bff2-aa990d444029-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235241

--===============0987832457028873383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm-backend* to *2.4.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-backend-upgrade-2.4.7-2.4.8.patch
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
From b5dbac8cd5951736a4871432da8c2d68d5886066 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 08:30:11 +0000
Subject: [PATCH] python3-pdm-backend: upgrade 2.4.7 -> 2.4.8

---
 ...ython3-pdm-backend_2.4.7.bb => python3-pdm-backend_2.4.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm-backend_2.4.7.bb => python3-pdm-backend_2.4.8.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-pdm-backend_2.4.7.bb b/meta/recipes-devtools/python/python3-pdm-backend_2.4.8.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-pdm-backend_2.4.7.bb
rename to meta/recipes-devtools/python/python3-pdm-backend_2.4.8.bb
index 94d40ac528..5833bb717b 100644
--- a/meta/recipes-devtools/python/python3-pdm-backend_2.4.7.bb
+++ b/meta/recipes-devtools/python/python3-pdm-backend_2.4.8.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a564297b3c5b629a528b92fd8ff61ea"
 
-SRC_URI[sha256sum] = "a509d083850378ce919d41e7a2faddfc57a1764d376913c66731125d6b14110f"
+SRC_URI[sha256sum] = "d8ef85d2c4306ee67195412d701fae9983e84ec6574598e26798ae26b7b3c7e0"
 
 inherit pypi python_pep517
 
-- 
2.47.1


--===============0987832457028873383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm_backend-2.4.7.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm_backend-2.4.8.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pdm_backend-2.4.7.dist-info -> /usr/lib/python3.14/site-packages/pdm_backend-2.4.8.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pdm-backend (sysroot):
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.7.dist-info moved to /usr/lib/python3.14/site-packages/pdm_backend-2.4.8.dist-info
Changes to packages/x86_64-linux/python3-packaging-native (sysroot):
  /usr/lib/python3.14/site-packages/packaging-26.1.dist-info moved to /usr/lib/python3.14/site-packages/packaging-26.0.dist-info
  /usr/lib/python3.14/site-packages/packaging/__pycache__/_structures.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/_structures.py was added
  /usr/lib/python3.14/site-packages/packaging/dependency_groups.py was removed
  /usr/lib/python3.14/site-packages/packaging/direct_url.py was removed
  /usr/lib/python3.14/site-packages/packaging/errors.py was removed
  /usr/lib/python3.14/site-packages/packaging/__pycache__/dependency_groups.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/packaging/__pycache__/direct_url.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/packaging/__pycache__/errors.cpython-314.pyc was removed

--===============0987832457028873383==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-backend-upgrade-2.4.7-2.4.8.patch"

RnJvbSBiNWRiYWM4Y2Q1OTUxNzM2YTQ4NzE0MzJkYThjMmQ2OGQ1ODg2MDY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDg6MzA6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBkbS1iYWNrZW5kOiB1cGdyYWRlIDIuNC43IC0+IDIuNC44CgotLS0KIC4uLnl0aG9u
My1wZG0tYmFja2VuZF8yLjQuNy5iYiA9PiBweXRob24zLXBkbS1iYWNrZW5kXzIuNC44LmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcGRtLWJhY2tlbmRfMi40
LjcuYmIgPT4gcHl0aG9uMy1wZG0tYmFja2VuZF8yLjQuOC5iYn0gKDc5JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtLWJhY2tlbmRfMi40Ljcu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtLWJhY2tlbmRfMi40
LjguYmIKc2ltaWxhcml0eSBpbmRleCA3OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBkbS1iYWNrZW5kXzIuNC43LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtLWJhY2tlbmRfMi40LjguYmIKaW5kZXgg
OTRkNDBhYzUyOC4uNTgzM2JiNzE3YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXBkbS1iYWNrZW5kXzIuNC43LmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1wZG0tYmFja2VuZF8yLjQuOC5iYgpAQCAtNCw3ICs0LDcg
QEAgTElDRU5TRSA9ICJNSVQiCiBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIKIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTRhNTY0Mjk3YjNjNWI2MjlhNTI4YjkyZmQ4ZmY2
MWVhIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTUwOWQwODM4NTAzNzhjZTkxOWQ0MWU3YTJm
YWRkZmM1N2ExNzY0ZDM3NjkxM2M2NjczMTEyNWQ2YjE0MTEwZiIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICJkOGVmODVkMmM0MzA2ZWU2NzE5NTQxMmQ3MDFmYWU5OTgzZTg0ZWM2NTc0NTk4ZTI2Nzk4
YWUyNmI3YjNjN2UwIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3BlcDUxNwogCi0tIAoyLjQ3LjEK
Cg==

--===============0987832457028873383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pdm-backend: PV changed from "2.4.7" to "2.4.8"
packages/x86-64-v3-poky-linux/python3-pdm-backend: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm_backend/pdm_backend-2.4.7.tar.gz;downloadfilename=pdm_backend-2.4.7.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm_backend/pdm_backend-2.4.8.tar.gz;downloadfilename=pdm_backend-2.4.8.tar.gz"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-dbg: PV changed from "2.4.7" to "2.4.8"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-dbg: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-dev: PV changed from "2.4.7" to "2.4.8"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-dev: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-doc: PV changed from "2.4.7" to "2.4.8"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-doc: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-locale: PV changed from "2.4.7" to "2.4.8"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-locale: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-src: PV changed from "2.4.7" to "2.4.8"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-src: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-staticdev: PV changed from "2.4.7" to "2.4.8"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend-staticdev: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend: PV changed from "2.4.7" to "2.4.8"
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend: PKGSIZE changed from 837610 to 839551 (+0%)
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/x86-64-v3-poky-linux/python3-pdm-backend/python3-pdm-backend: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm_backend-2.4.7.dist-info -> /usr/lib/python3.14/site-packages/pdm_backend-2.4.8.dist-info, directory renamed /usr/lib/python3.14/site-packages/pdm_backend-2.4.7.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm_backend-2.4.8.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pdm-backend (sysroot):
  /usr/lib/python3.14/site-packages/pdm_backend-2.4.7.dist-info moved to /usr/lib/python3.14/site-packages/pdm_backend-2.4.8.dist-info
Changes to packages/x86_64-linux/python3-packaging-native (sysroot):
  /usr/lib/python3.14/site-packages/packaging-26.1.dist-info moved to /usr/lib/python3.14/site-packages/packaging-26.0.dist-info
  /usr/lib/python3.14/site-packages/packaging/__pycache__/_structures.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/_structures.py was added
  /usr/lib/python3.14/site-packages/packaging/dependency_groups.py was removed
  /usr/lib/python3.14/site-packages/packaging/direct_url.py was removed
  /usr/lib/python3.14/site-packages/packaging/errors.py was removed
  /usr/lib/python3.14/site-packages/packaging/__pycache__/dependency_groups.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/packaging/__pycache__/direct_url.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/packaging/__pycache__/errors.cpython-314.pyc was removed

--===============0987832457028873383==--

