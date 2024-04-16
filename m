Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9683C2BBCA
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:11 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.13427.1713248038174058471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:13:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eGsIyCMo;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=DBSuZouR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018ee58a6d6b-c85c9b16-062d-49dc-a633-21650f375217-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tL9wP2oPe7Ek09PWzMRDxBe5Mk9FF4FNlRJEDHASO8U=;
	b=eGsIyCMoOFq8J3gsPU/6QjEto/G4Dnjrc8qh9AiUrvbmH//oz/joiHPckDbPTo5D
	IeIQPEQMxAx+QYN6W4NsHDWHB25Th9Rc2c+6YdrOHgZBMQZc6Jig7dCUPbkccut9zvy
	tM8kFPxH/TyLnW43iowURl0pS3Kgxq+ZcDvNC9FE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tL9wP2oPe7Ek09PWzMRDxBe5Mk9FF4FNlRJEDHASO8U=;
	b=DBSuZouRBYVnwBHP/SaVkCEsxKly8ek/kxO3aTSsiEHvep2lSVca4Sl+NaEnqcwl
	PjS6yt8sy/Fmj7sGzY0TAcvK+iu3KcYT/6xLzEYH4tA5DOP6ew3hE4U+CsCwOyT7+tz
	GKQ9PSzhEzy3OYXu0pB072Tkec3ywHLv0Et7MNzg=
Content-Type: multipart/mixed; boundary="===============0245220479769734552=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-build: upgrading to 1.2.1 SUCCEEDED
Message-ID: <0101018ee58a6d6b-c85c9b16-062d-49dc-a633-21650f375217-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198271

--===============0245220479769734552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-build* to *1.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-build-upgrade-1.1.1-1.2.1.patch
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
From e9e92fd61fb0f3ac8f6af6f93b8e61984f66cf8a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 18:56:29 +0000
Subject: [PATCH] python3-build: upgrade 1.1.1 -> 1.2.1

---
 .../python/{python3-build_1.1.1.bb => python3-build_1.2.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-build_1.1.1.bb => python3-build_1.2.1.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-build_1.1.1.bb b/meta/recipes-devtools/python/python3-build_1.2.1.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-build_1.1.1.bb
rename to meta/recipes-devtools/python/python3-build_1.2.1.bb
index 7fc3eef91b..0156861201 100644
--- a/meta/recipes-devtools/python/python3-build_1.1.1.bb
+++ b/meta/recipes-devtools/python/python3-build_1.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/build"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=310439af287b0fb4780b2ad6907c256c"
 
-SRC_URI[sha256sum] = "8eea65bb45b1aac2e734ba2cc8dad3a6d97d97901a395bd0ed3e7b46953d2a31"
+SRC_URI[sha256sum] = "526263f4870c26f26c433545579475377b2b7588b6f1eac76a001e873ae3e19d"
 
 inherit pypi python_flit_core
 
-- 
2.42.0


--===============0245220479769734552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-build/python3-build: PKGSIZE changed from 118075 to 131439 (+11%)
packages/core2-64-poky-linux/python3-build/python3-build: FILELIST: directory renamed /usr/lib/python3.12/site-packages/build-1.1.1.dist-info -> /usr/lib/python3.12/site-packages/build-1.2.1.dist-info, added "/usr/lib/python3.12/site-packages/build/__pycache__/_builder.cpython-312.pyc /usr/lib/python3.12/site-packages/build/_ctx.py /usr/lib/python3.12/site-packages/build/_builder.py /usr/lib/python3.12/site-packages/build/__pycache__/_types.cpython-312.pyc /usr/lib/python3.12/site-packages/build/__pycache__/_ctx.cpython-312.pyc /usr/lib/python3.12/site-packages/build/_types.py"
Changes to packages/core2-64-poky-linux/python3-build (sysroot):
  /usr/lib/python3.12/site-packages/build-1.1.1.dist-info moved to /usr/lib/python3.12/site-packages/build-1.2.1.dist-info
  /usr/lib/python3.12/site-packages/build/_builder.py was added
  /usr/lib/python3.12/site-packages/build/_ctx.py was added
  /usr/lib/python3.12/site-packages/build/__pycache__/_builder.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/__pycache__/_ctx.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/__pycache__/_types.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/_types.py was added

--===============0245220479769734552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-build: PV changed from "1.1.1" to "1.2.1"
packages/core2-64-poky-linux/python3-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/b/build/build-1.1.1.tar.gz;downloadfilename=build-1.1.1.tar.gz" to "https://files.pythonhosted.org/packages/source/b/build/build-1.2.1.tar.gz;downloadfilename=build-1.2.1.tar.gz"
packages/core2-64-poky-linux/python3-build: PKGV changed from 1.1.1 [default] to 1.2.1 [default]
packages/core2-64-poky-linux/python3-build/python3-build-dbg: PV changed from "1.1.1" to "1.2.1"
packages/core2-64-poky-linux/python3-build/python3-build-dbg: PKGV changed from 1.1.1 [default] to 1.2.1 [default]
packages/core2-64-poky-linux/python3-build/python3-build-dev: PV changed from "1.1.1" to "1.2.1"
packages/core2-64-poky-linux/python3-build/python3-build-dev: PKGV changed from 1.1.1 [default] to 1.2.1 [default]
packages/core2-64-poky-linux/python3-build/python3-build-doc: PV changed from "1.1.1" to "1.2.1"
packages/core2-64-poky-linux/python3-build/python3-build-doc: PKGV changed from 1.1.1 [default] to 1.2.1 [default]
packages/core2-64-poky-linux/python3-build/python3-build-locale: PV changed from "1.1.1" to "1.2.1"
packages/core2-64-poky-linux/python3-build/python3-build-locale: PKGV changed from 1.1.1 [default] to 1.2.1 [default]
packages/core2-64-poky-linux/python3-build/python3-build-src: PV changed from "1.1.1" to "1.2.1"
packages/core2-64-poky-linux/python3-build/python3-build-src: PKGV changed from 1.1.1 [default] to 1.2.1 [default]
packages/core2-64-poky-linux/python3-build/python3-build-staticdev: PV changed from "1.1.1" to "1.2.1"
packages/core2-64-poky-linux/python3-build/python3-build-staticdev: PKGV changed from 1.1.1 [default] to 1.2.1 [default]
packages/core2-64-poky-linux/python3-build/python3-build: PKGSIZE changed from 118075 to 131439 (+11%)
packages/core2-64-poky-linux/python3-build/python3-build: PV changed from "1.1.1" to "1.2.1"
packages/core2-64-poky-linux/python3-build/python3-build: PKGV changed from 1.1.1 [default] to 1.2.1 [default]
packages/core2-64-poky-linux/python3-build/python3-build: FILELIST: directory renamed /usr/lib/python3.12/site-packages/build-1.1.1.dist-info -> /usr/lib/python3.12/site-packages/build-1.2.1.dist-info, added "/usr/lib/python3.12/site-packages/build/__pycache__/_ctx.cpython-312.pyc /usr/lib/python3.12/site-packages/build/_builder.py /usr/lib/python3.12/site-packages/build/_types.py /usr/lib/python3.12/site-packages/build/__pycache__/_types.cpython-312.pyc /usr/lib/python3.12/site-packages/build/__pycache__/_builder.cpython-312.pyc /usr/lib/python3.12/site-packages/build/_ctx.py"
Changes to packages/core2-64-poky-linux/python3-build (sysroot):
  /usr/lib/python3.12/site-packages/build-1.1.1.dist-info moved to /usr/lib/python3.12/site-packages/build-1.2.1.dist-info
  /usr/lib/python3.12/site-packages/build/_builder.py was added
  /usr/lib/python3.12/site-packages/build/_ctx.py was added
  /usr/lib/python3.12/site-packages/build/__pycache__/_builder.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/__pycache__/_ctx.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/__pycache__/_types.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/build/_types.py was added

--===============0245220479769734552==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-build-upgrade-1.1.1-1.2.1.patch"

RnJvbSBlOWU5MmZkNjFmYjBmM2FjOGY2YWY2ZjkzYjhlNjE5ODRmNjZjZjhhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMTg6NTY6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWJ1aWxkOiB1cGdyYWRlIDEuMS4xIC0+IDEuMi4xCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtYnVpbGRfMS4xLjEuYmIgPT4gcHl0aG9uMy1idWlsZF8xLjIuMS5iYn0gICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtYnVpbGRfMS4xLjEuYmIgPT4gcHl0
aG9uMy1idWlsZF8xLjIuMS5iYn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtYnVpbGRfMS4xLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtYnVpbGRfMS4yLjEuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJ1aWxkXzEuMS4x
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYnVpbGRf
MS4yLjEuYmIKaW5kZXggN2ZjM2VlZjkxYi4uMDE1Njg2MTIwMSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJ1aWxkXzEuMS4xLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1idWlsZF8xLjIuMS5iYgpAQCAtMyw3ICsz
LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3B5cGEvYnVpbGQiCiBMSUNFTlNF
ID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTMxMDQzOWFm
Mjg3YjBmYjQ3ODBiMmFkNjkwN2MyNTZjIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGVlYTY1
YmI0NWIxYWFjMmU3MzRiYTJjYzhkYWQzYTZkOTdkOTc5MDFhMzk1YmQwZWQzZTdiNDY5NTNkMmEz
MSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI1MjYyNjNmNDg3MGMyNmYyNmM0MzM1NDU1Nzk0NzUz
NzdiMmI3NTg4YjZmMWVhYzc2YTAwMWU4NzNhZTNlMTlkIgogCiBpbmhlcml0IHB5cGkgcHl0aG9u
X2ZsaXRfY29yZQogCi0tIAoyLjQyLjAKCg==

--===============0245220479769734552==--

