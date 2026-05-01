Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 678EBCD4841
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:57 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15609.1777645532270387654
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=BfvLtJo2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=2RsnFiXw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019de3ee5921-60475bc8-4a01-44fa-b5f5-e4576e34e8d7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7vLmMrhLa8teBMGPUKEtuco8wQ9Z072f6Sj6fOYStG4=;
	b=BfvLtJo2OiisF5PAJTm6UzAkzdO59Pk6CZ3gTvQ1dWBl2c7n2hpfO3mVBzEMyrCO
	7cfT/kw/jDxObJDSwxhyJib3UhdgNN12m4IVUjUA+PGfZJU8m0h+t61tNSyTqiecoOX
	0P8gYFpO0aWHgk3G/DS3a/88zF2fkrhMgHagqQu0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7vLmMrhLa8teBMGPUKEtuco8wQ9Z072f6Sj6fOYStG4=;
	b=2RsnFiXwUxo8TnE3uyBoMJWu6L75qO5EaeFRu6ypvBV7kWoIpA59O55Bt7Q1qy2V
	fmeVQyMuu4U++YPcwnjIrIWmhkQRD4orpTLlmCYn0kv54Ge++CQYqBedsWq/v0qyRe0
	Xza+FYo37kMPPPxOdIKRDmBP868ltTiPEb6pgIcg=
Content-Type: multipart/mixed; boundary="===============5090404927056697635=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pathspec: upgrading to 1.1.1 SUCCEEDED
Message-ID: <0101019de3ee5921-60475bc8-4a01-44fa-b5f5-e4576e34e8d7-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236242

--===============5090404927056697635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pathspec* to *1.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pathspec-upgrade-1.0.4-1.1.1.patch
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
From 1f3df9a2aa65a00124dc2447fc98eb6aa66d8e86 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 08:56:47 +0000
Subject: [PATCH] python3-pathspec: upgrade 1.0.4 -> 1.1.1

---
 .../{python3-pathspec_1.0.4.bb => python3-pathspec_1.1.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pathspec_1.0.4.bb => python3-pathspec_1.1.1.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pathspec_1.0.4.bb b/meta/recipes-devtools/python/python3-pathspec_1.1.1.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pathspec_1.0.4.bb
rename to meta/recipes-devtools/python/python3-pathspec_1.1.1.bb
index bcdc04dfb0..df8c0d6621 100644
--- a/meta/recipes-devtools/python/python3-pathspec_1.0.4.bb
+++ b/meta/recipes-devtools/python/python3-pathspec_1.1.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 
-SRC_URI[sha256sum] = "0210e2ae8a21a9137c0d470578cb0e595af87edaa6ebf12ff176f14a02e0e645"
+SRC_URI[sha256sum] = "17db5ecd524104a120e173814c90367a96a98d07c45b2e10c2f3919fff91bf5a"
 
 inherit pypi python_flit_core
 
-- 
2.47.1


--===============5090404927056697635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pathspec-1.0.4.dist-info -> /usr/lib/python3.14/site-packages/pathspec-1.1.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/pathspec-1.0.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/pathspec-1.1.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pathspec (sysroot):
  /usr/lib/python3.14/site-packages/pathspec-1.0.4.dist-info moved to /usr/lib/python3.14/site-packages/pathspec-1.1.1.dist-info
Changes to packages/x86_64-linux/python3-packaging-native (sysroot):
  /usr/lib/python3.14/site-packages/packaging-26.2.dist-info moved to /usr/lib/python3.14/site-packages/packaging-26.0.dist-info
  /usr/lib/python3.14/site-packages/packaging/dependency_groups.py was removed
  /usr/lib/python3.14/site-packages/packaging/direct_url.py was removed
  /usr/lib/python3.14/site-packages/packaging/errors.py was removed
  /usr/lib/python3.14/site-packages/packaging/__pycache__/dependency_groups.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/packaging/__pycache__/direct_url.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/packaging/__pycache__/errors.cpython-314.pyc was removed

--===============5090404927056697635==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pathspec-upgrade-1.0.4-1.1.1.patch"

RnJvbSAxZjNkZjlhMmFhNjVhMDAxMjRkYzI0NDdmYzk4ZWI2YWE2NmQ4ZTg2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwODo1Njo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGF0aHNwZWM6IHVwZ3JhZGUgMS4wLjQgLT4gMS4xLjEKCi0tLQogLi4uL3tweXRob24z
LXBhdGhzcGVjXzEuMC40LmJiID0+IHB5dGhvbjMtcGF0aHNwZWNfMS4xLjEuYmJ9ICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wYXRoc3BlY18xLjAuNC5iYiA9
PiBweXRob24zLXBhdGhzcGVjXzEuMS4xLmJifSAoODAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYXRoc3BlY18xLjAuNC5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYXRoc3BlY18xLjEuMS5iYgpzaW1pbGFyaXR5
IGluZGV4IDgwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcGF0aHNwZWNfMS4wLjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1wYXRoc3BlY18xLjEuMS5iYgppbmRleCBiY2RjMDRkZmIwLi5kZjhjMGQ2NjIx
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGF0aHNw
ZWNfMS4wLjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBh
dGhzcGVjXzEuMS4xLmJiCkBAIC00LDcgKzQsNyBAQCBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIK
IExJQ0VOU0UgPSAiTVBMLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7
bWQ1PTgxNWNhNTk5YzlkZjI0N2EwYzdmNjE5YmFiMTIzZGFkIgogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMDIxMGUyYWU4YTIxYTkxMzdjMGQ0NzA1NzhjYjBlNTk1YWY4N2VkYWE2ZWJmMTJmZjE3
NmYxNGEwMmUwZTY0NSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxN2RiNWVjZDUyNDEwNGExMjBl
MTczODE0YzkwMzY3YTk2YTk4ZDA3YzQ1YjJlMTBjMmYzOTE5ZmZmOTFiZjVhIgogCiBpbmhlcml0
IHB5cGkgcHl0aG9uX2ZsaXRfY29yZQogCi0tIAoyLjQ3LjEKCg==

--===============5090404927056697635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pathspec: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pathspec/pathspec-1.0.4.tar.gz;downloadfilename=pathspec-1.0.4.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pathspec/pathspec-1.1.1.tar.gz;downloadfilename=pathspec-1.1.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-pathspec: PV changed from "1.0.4" to "1.1.1"
packages/x86-64-v3-poky-linux/python3-pathspec: PKGV changed from 1.0.4 [default] to 1.1.1 [default]
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-dbg: PV changed from "1.0.4" to "1.1.1"
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-dbg: PKGV changed from 1.0.4 [default] to 1.1.1 [default]
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-dev: PV changed from "1.0.4" to "1.1.1"
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-dev: PKGV changed from 1.0.4 [default] to 1.1.1 [default]
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-doc: PV changed from "1.0.4" to "1.1.1"
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-doc: PKGV changed from 1.0.4 [default] to 1.1.1 [default]
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-locale: PV changed from "1.0.4" to "1.1.1"
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-locale: PKGV changed from 1.0.4 [default] to 1.1.1 [default]
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-src: PV changed from "1.0.4" to "1.1.1"
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-src: PKGV changed from 1.0.4 [default] to 1.1.1 [default]
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-staticdev: PV changed from "1.0.4" to "1.1.1"
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec-staticdev: PKGV changed from 1.0.4 [default] to 1.1.1 [default]
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec: PV changed from "1.0.4" to "1.1.1"
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec: PKGSIZE changed from 306953 to 319382 (+4%)
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec: PKGV changed from 1.0.4 [default] to 1.1.1 [default]
packages/x86-64-v3-poky-linux/python3-pathspec/python3-pathspec: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pathspec-1.0.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/pathspec-1.1.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pathspec-1.0.4.dist-info -> /usr/lib/python3.14/site-packages/pathspec-1.1.1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pathspec (sysroot):
  /usr/lib/python3.14/site-packages/pathspec-1.0.4.dist-info moved to /usr/lib/python3.14/site-packages/pathspec-1.1.1.dist-info
Changes to packages/x86_64-linux/python3-packaging-native (sysroot):
  /usr/lib/python3.14/site-packages/packaging-26.2.dist-info moved to /usr/lib/python3.14/site-packages/packaging-26.0.dist-info
  /usr/lib/python3.14/site-packages/packaging/dependency_groups.py was removed
  /usr/lib/python3.14/site-packages/packaging/direct_url.py was removed
  /usr/lib/python3.14/site-packages/packaging/errors.py was removed
  /usr/lib/python3.14/site-packages/packaging/__pycache__/dependency_groups.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/packaging/__pycache__/direct_url.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/packaging/__pycache__/errors.cpython-314.pyc was removed

--===============5090404927056697635==--

