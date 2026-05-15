Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48302CD4F4A
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:33 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34762.1778851231560523614
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=iSPv1/yG;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=SaODF92y;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019e2bcbb4ba-7a5d5879-1dea-4e15-af86-296ae04b4729-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851231;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=h6v9ekyLf9Mrvvd20ejBXOAVkQqDzplBYMfxCI8FN7c=;
	b=iSPv1/yGbAOfhJitdmp83ysO9LJ2mi6M4xRGqbz7pUxkAxKBijZhFab9Lhn8xkSp
	dDwb4HEMTHhdESG+zUsTpSPWObthN+6ICn+qj6vfibWfEfPKDbGmURNf123KxtmuQ6D
	0IxCpDgUcUDT39Zr8mIPklrOrY6q4qJBXKl2DffA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851231;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=h6v9ekyLf9Mrvvd20ejBXOAVkQqDzplBYMfxCI8FN7c=;
	b=SaODF92ymN9Kr/B/mLFqYLsNe8CSwN5MZ7msvddzVQ0h/9fhk65/G2BrGXLYltNv
	tz4ajzShRqFQoVPBp4pLBN3FNPEG8ELfjAt8aB5XDzbwo4kSMuk7oNG1+a+phQ7OTKz
	w0BFfbnUxRXJyYWbF+UlIOdKx3aOlp8ZfYs+JFNA=
Content-Type: multipart/mixed; boundary="===============6163226177358301298=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm: upgrading to 2.26.9 SUCCEEDED
Message-ID: <0101019e2bcbb4ba-7a5d5879-1dea-4e15-af86-296ae04b4729-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237115

--===============6163226177358301298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm* to *2.26.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-upgrade-2.26.8-2.26.9.patch
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
From e0b544c5a733ca9d72a81895dd248b415ebe7157 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 08:42:32 +0000
Subject: [PATCH] python3-pdm: upgrade 2.26.8 -> 2.26.9

---
 .../python/{python3-pdm_2.26.8.bb => python3-pdm_2.26.9.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.26.8.bb => python3-pdm_2.26.9.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.26.8.bb b/meta/recipes-devtools/python/python3-pdm_2.26.9.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.26.8.bb
rename to meta/recipes-devtools/python/python3-pdm_2.26.9.bb
index 91fcc6a5af..51f9284a92 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.26.8.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.26.9.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "f53a20b4b6beaa88da577a7413ebbb51bee534441339b006dba2260edbc81757"
+SRC_URI[sha256sum] = "6f7279b5e54b2948db3dcc1495197e9d0b2c8643e8159cc835e22d8f9af083b5"
 
 inherit pypi python_pdm
 
-- 
2.47.1


--===============6163226177358301298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pdm: PKGV changed from 2.26.8 [default] to 2.26.9 [default]
packages/x86-64-v3-poky-linux/python3-pdm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.26.8.tar.gz;downloadfilename=pdm-2.26.8.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.26.9.tar.gz;downloadfilename=pdm-2.26.9.tar.gz"
packages/x86-64-v3-poky-linux/python3-pdm: PV changed from "2.26.8" to "2.26.9"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PV changed from "2.26.8" to "2.26.9"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PKGV changed from 2.26.8 [default] to 2.26.9 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PV changed from "2.26.8" to "2.26.9"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PKGV changed from 2.26.8 [default] to 2.26.9 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PV changed from "2.26.8" to "2.26.9"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PKGV changed from 2.26.8 [default] to 2.26.9 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PV changed from "2.26.8" to "2.26.9"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PKGV changed from 2.26.8 [default] to 2.26.9 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PV changed from "2.26.8" to "2.26.9"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PKGV changed from 2.26.8 [default] to 2.26.9 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PV changed from "2.26.8" to "2.26.9"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PKGV changed from 2.26.8 [default] to 2.26.9 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PV changed from "2.26.8" to "2.26.9"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGSIZE changed from 2500151 to 2503106 (+0%)
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm-2.26.8.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm-2.26.9.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pdm-2.26.8.dist-info -> /usr/lib/python3.14/site-packages/pdm-2.26.9.dist-info
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGV changed from 2.26.8 [default] to 2.26.9 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.14/site-packages/pdm-2.26.8.dist-info moved to /usr/lib/python3.14/site-packages/pdm-2.26.9.dist-info
Changes to packages/x86_64-linux/python3-packaging-native (sysroot):
  /usr/lib/python3.14/site-packages/packaging-26.2.dist-info moved to /usr/lib/python3.14/site-packages/packaging-26.0.dist-info
  /usr/lib/python3.14/site-packages/packaging/dependency_groups.py was removed
  /usr/lib/python3.14/site-packages/packaging/direct_url.py was removed
  /usr/lib/python3.14/site-packages/packaging/errors.py was removed
  /usr/lib/python3.14/site-packages/packaging/__pycache__/dependency_groups.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/packaging/__pycache__/direct_url.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/packaging/__pycache__/errors.cpython-314.pyc was removed

--===============6163226177358301298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm-2.26.8.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm-2.26.9.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pdm-2.26.8.dist-info -> /usr/lib/python3.14/site-packages/pdm-2.26.9.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.14/site-packages/pdm-2.26.8.dist-info moved to /usr/lib/python3.14/site-packages/pdm-2.26.9.dist-info
Changes to packages/x86_64-linux/python3-packaging-native (sysroot):
  /usr/lib/python3.14/site-packages/packaging-26.2.dist-info moved to /usr/lib/python3.14/site-packages/packaging-26.0.dist-info
  /usr/lib/python3.14/site-packages/packaging/dependency_groups.py was removed
  /usr/lib/python3.14/site-packages/packaging/direct_url.py was removed
  /usr/lib/python3.14/site-packages/packaging/errors.py was removed
  /usr/lib/python3.14/site-packages/packaging/__pycache__/dependency_groups.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/packaging/__pycache__/direct_url.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/packaging/__pycache__/errors.cpython-314.pyc was removed

--===============6163226177358301298==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-upgrade-2.26.8-2.26.9.patch"

RnJvbSBlMGI1NDRjNWE3MzNjYTlkNzJhODE4OTVkZDI0OGI0MTVlYmU3MTU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMDg6NDI6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBkbTogdXBncmFkZSAyLjI2LjggLT4gMi4yNi45CgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtcGRtXzIuMjYuOC5iYiA9PiBweXRob24zLXBkbV8yLjI2LjkuYmJ9ICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcGRtXzIuMjYuOC5iYiA9PiBweXRo
b24zLXBkbV8yLjI2LjkuYmJ9ICg4MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI2LjguYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcGRtXzIuMjYuOS5iYgpzaW1pbGFyaXR5IGluZGV4IDgwJQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjYuOC5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI2Ljku
YmIKaW5kZXggOTFmY2M2YTVhZi4uNTFmOTI4NGE5MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI2LjguYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI2LjkuYmIKQEAgLTQsNyArNCw3IEBAIExJ
Q0VOU0UgPSAiTUlUIgogU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT0yZWIzMWEyY2MxYTc1OGMzNGI0OTlmMjg3ZGQwNGVmMiIK
IAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImY1M2EyMGI0YjZiZWFhODhkYTU3N2E3NDEzZWJiYjUx
YmVlNTM0NDQxMzM5YjAwNmRiYTIyNjBlZGJjODE3NTciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
NmY3Mjc5YjVlNTRiMjk0OGRiM2RjYzE0OTUxOTdlOWQwYjJjODY0M2U4MTU5Y2M4MzVlMjJkOGY5
YWYwODNiNSIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9wZG0KIAotLSAKMi40Ny4xCgo=

--===============6163226177358301298==--

