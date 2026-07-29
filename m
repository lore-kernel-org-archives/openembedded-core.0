Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E878C54FD4
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 07:24:34 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6124.1785309868981147809
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 00:24:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TF3hzueq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=034Be1xg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019facc2b07d-9f148ae5-10e6-4d14-941a-c0a036d662ef-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785309868;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aSxKZpJtfUjDunxILqF355OYgDNdsqxDlRIEYkkQdNE=;
	b=TF3hzueqlwEubqrz7MYI4k6Nti2nFLjbLlDzaqBlPjGG/Y5AIFsl7/ZsuZM1yYHP
	0Wrf6MjCdepKDKIWoCXA6m+kQOttYg2lR5AQZMnI03O4XoKD4VTOm+s4mRUGTJYFEII
	IveuUgsUo2ioF2bqBJ4KSQK1GRZj1mpXY4izNUHk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785309868;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aSxKZpJtfUjDunxILqF355OYgDNdsqxDlRIEYkkQdNE=;
	b=034Be1xgbtCNyJT1nkiGZgDP7OCQ6Rj/cDdRv461UPTubgAxo2WD+N5klDJ0NiHR
	3sRODJyKh0QjoiOuxzUnitnTJlfhtuydxF0ovKS3z++z4v1pHjxMsl5PlenVxwDdKSS
	PjKMBikSawSmNieEtmipjeAdosMWrYDhCesU8av8=
Content-Type: multipart/mixed; boundary="===============4580479277510703915=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-vcs-versioning: upgrading to 2.2.3 SUCCEEDED
Message-ID: <0101019facc2b07d-9f148ae5-10e6-4d14-941a-c0a036d662ef-000000@us-west-2.amazonses.com>
Date: Wed, 29 Jul 2026 07:24:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.29-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 07:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242241

--===============4580479277510703915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-vcs-versioning* to *2.2.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-vcs-versioning-upgrade-2.2.2-2.2.3.patch
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
From 8097641161f903c8192ef03847b9b5fc5c98e735 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 29 Jul 2026 05:59:09 +0000
Subject: [PATCH] python3-vcs-versioning: upgrade 2.2.2 -> 2.2.3

Source: CHANGELOG.md

## 2.2.3 (2026-07-28)

### Fixed

- Fix `ValueError` when parsing `.git_archival.txt` of a tagged commit whose tag contains more than one dash (e.g. `llvmorg-23.1.0-rc2`) - the `git describe` suffix is now matched precisely instead of splitting on the last two dashes. ([#1481](https://github.com/pypa/setuptools-scm/issues/1481))
---
 ...-vcs-versioning_2.2.2.bb => python3-vcs-versioning_2.2.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-vcs-versioning_2.2.2.bb => python3-vcs-versioning_2.2.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb b/meta/recipes-devtools/python/python3-vcs-versioning_2.2.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb
rename to meta/recipes-devtools/python/python3-vcs-versioning_2.2.3.bb
index 300284e4c0..eb81e4d4d3 100644
--- a/meta/recipes-devtools/python/python3-vcs-versioning_2.2.2.bb
+++ b/meta/recipes-devtools/python/python3-vcs-versioning_2.2.3.bb
@@ -5,7 +5,7 @@ library that can be used independently of setuptools."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c9b06ad2ebd7e2e82d34b3caf353e7d5"
 
-SRC_URI[sha256sum] = "4ac4ded78720cdb4d0291ae58ace87e1e9201912e1023f3029c6cce5c9152cfb"
+SRC_URI[sha256sum] = "c21e284aa98c8269996791a19d6173baf953cf9996ef42ec3ebcbdc151e18b9b"
 
 SRC_URI += "\
     file://run-ptest \
-- 
2.47.1


--===============4580479277510703915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: FILELIST: directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.2.2.dist-info -> /usr/lib/python3.14/site-packages/vcs_versioning-2.2.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.2.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/vcs_versioning-2.2.3.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-vcs-versioning (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.2.2.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.2.3.dist-info
Changes to packages/x86_64-linux/python3-vcs-versioning-native (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.2.2.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.2.3.dist-info

--===============4580479277510703915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-vcs-versioning: PV changed from "2.2.2" to "2.2.3"
packages/x86-64-v3-poky-linux/python3-vcs-versioning: SRC_URI changed from "https://files.pythonhosted.org/packages/source/v/vcs_versioning/vcs_versioning-2.2.2.tar.gz;downloadfilename=vcs_versioning-2.2.2.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/v/vcs_versioning/vcs_versioning-2.2.3.tar.gz;downloadfilename=vcs_versioning-2.2.3.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/python3-vcs-versioning: PKGV changed from 2.2.2 [default] to 2.2.3 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dbg: PV changed from "2.2.2" to "2.2.3"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dbg: PKGV changed from 2.2.2 [default] to 2.2.3 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dev: PV changed from "2.2.2" to "2.2.3"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dev: PKGV changed from 2.2.2 [default] to 2.2.3 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-doc: PV changed from "2.2.2" to "2.2.3"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-doc: PKGV changed from 2.2.2 [default] to 2.2.3 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-locale: PV changed from "2.2.2" to "2.2.3"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-locale: PKGV changed from 2.2.2 [default] to 2.2.3 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: PV changed from "2.2.2" to "2.2.3"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: PKGV changed from 2.2.2 [default] to 2.2.3 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: PKGSIZE changed from 245635 to 246443 (+0%)
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-src: PV changed from "2.2.2" to "2.2.3"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-src: PKGV changed from 2.2.2 [default] to 2.2.3 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-staticdev: PV changed from "2.2.2" to "2.2.3"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-staticdev: PKGV changed from 2.2.2 [default] to 2.2.3 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: PV changed from "2.2.2" to "2.2.3"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: PKGV changed from 2.2.2 [default] to 2.2.3 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: FILELIST: directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.2.2.dist-info -> /usr/lib/python3.14/site-packages/vcs_versioning-2.2.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.2.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/vcs_versioning-2.2.3.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: PKGSIZE changed from 732125 to 732655 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-vcs-versioning (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.2.2.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.2.3.dist-info
Changes to packages/x86_64-linux/python3-vcs-versioning-native (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.2.2.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.2.3.dist-info

--===============4580479277510703915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="python3-vcs-versioning-changelog.txt"

Changelog for python3-vcs-versioning: 2.2.2 -> 2.2.3
Source: CHANGELOG.md

## 2.2.3 (2026-07-28)

### Fixed

- Fix `ValueError` when parsing `.git_archival.txt` of a tagged commit whose tag contains more than one dash (e.g. `llvmorg-23.1.0-rc2`) - the `git describe` suffix is now matched precisely instead of splitting on the last two dashes. ([#1481](https://github.com/pypa/setuptools-scm/issues/1481))

--===============4580479277510703915==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-vcs-versioning-upgrade-2.2.2-2.2.3.patch"

RnJvbSA4MDk3NjQxMTYxZjkwM2M4MTkyZWYwMzg0N2I5YjVmYzVjOThlNzM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjkgSnVsIDIwMjYgMDU6NTk6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXZjcy12ZXJzaW9uaW5nOiB1cGdyYWRlIDIuMi4yIC0+IDIuMi4zCgpTb3VyY2U6IENI
QU5HRUxPRy5tZAoKIyMgMi4yLjMgKDIwMjYtMDctMjgpCgojIyMgRml4ZWQKCi0gRml4IGBWYWx1
ZUVycm9yYCB3aGVuIHBhcnNpbmcgYC5naXRfYXJjaGl2YWwudHh0YCBvZiBhIHRhZ2dlZCBjb21t
aXQgd2hvc2UgdGFnIGNvbnRhaW5zIG1vcmUgdGhhbiBvbmUgZGFzaCAoZS5nLiBgbGx2bW9yZy0y
My4xLjAtcmMyYCkgLSB0aGUgYGdpdCBkZXNjcmliZWAgc3VmZml4IGlzIG5vdyBtYXRjaGVkIHBy
ZWNpc2VseSBpbnN0ZWFkIG9mIHNwbGl0dGluZyBvbiB0aGUgbGFzdCB0d28gZGFzaGVzLiAoWyMx
NDgxXShodHRwczovL2dpdGh1Yi5jb20vcHlwYS9zZXR1cHRvb2xzLXNjbS9pc3N1ZXMvMTQ4MSkp
Ci0tLQogLi4uLXZjcy12ZXJzaW9uaW5nXzIuMi4yLmJiID0+IHB5dGhvbjMtdmNzLXZlcnNpb25p
bmdfMi4yLjMuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy12
Y3MtdmVyc2lvbmluZ18yLjIuMi5iYiA9PiBweXRob24zLXZjcy12ZXJzaW9uaW5nXzIuMi4zLmJi
fSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My12Y3MtdmVyc2lvbmluZ18yLjIuMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy12Y3MtdmVyc2lvbmluZ18yLjIuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdmNzLXZlcnNpb25p
bmdfMi4yLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My12Y3MtdmVyc2lvbmluZ18yLjIuMy5iYgppbmRleCAzMDAyODRlNGMwLi5lYjgxZTRkNGQzIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdmNzLXZlcnNp
b25pbmdfMi4yLjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXZjcy12ZXJzaW9uaW5nXzIuMi4zLmJiCkBAIC01LDcgKzUsNyBAQCBsaWJyYXJ5IHRoYXQgY2Fu
IGJlIHVzZWQgaW5kZXBlbmRlbnRseSBvZiBzZXR1cHRvb2xzLiIKIExJQ0VOU0UgPSAiTUlUIgog
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PWM5YjA2YWQyZWJkN2Uy
ZTgyZDM0YjNjYWYzNTNlN2Q1IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNGFjNGRlZDc4NzIw
Y2RiNGQwMjkxYWU1OGFjZTg3ZTFlOTIwMTkxMmUxMDIzZjMwMjljNmNjZTVjOTE1MmNmYiIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICJjMjFlMjg0YWE5OGM4MjY5OTk2NzkxYTE5ZDYxNzNiYWY5NTNj
Zjk5OTZlZjQyZWMzZWJjYmRjMTUxZTE4YjliIgogCiBTUkNfVVJJICs9ICJcCiAgICAgZmlsZTov
L3J1bi1wdGVzdCBcCi0tIAoyLjQ3LjEKCg==

--===============4580479277510703915==--

