Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12835C44533
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 05:50:11 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41697.1784699401116349749
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 22:50:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BtzKz4pW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=o8tYdQ/2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019f885faefc-8b083505-63df-448a-a727-21486a683698-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784699400;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9u/nLN+o6BK4mhp1Rx4ivbZITqNlgWE1ASxuKHkfBBU=;
	b=BtzKz4pWj1sfnH2v6pzR+YCGRWYXUNBD061nSthCjRiWCgDdqA7qF/gfe3kbW0kj
	Iwn493Oocox+jvH5y8YxnC9ueyrM5EtgFGrNKH51qzid/Xliq/jJu/g58jx48bsi7Wd
	AXPvVSJ/E9+YqBJdJmiuXOR6bdBl0lletnlXZTAI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784699400;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9u/nLN+o6BK4mhp1Rx4ivbZITqNlgWE1ASxuKHkfBBU=;
	b=o8tYdQ/2bZ9AKzEhAICMj0lu3d795DAjak8YbfWOCOH89WtHUW659ojYM9gIssRv
	4M+mWIn4d3BR3SD185boiGxhaFRxQeLQSdHzLrxCBWbHHLNNYKZY0oGru6tJZrg/fhV
	vBfd8gK5m40HkTE8eiERLs8mBUGT/p7KSn1EB87w=
Content-Type: multipart/mixed; boundary="===============4149769399382220215=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-scm: upgrading to 10.2.1 SUCCEEDED
Message-ID: <0101019f885faefc-8b083505-63df-448a-a727-21486a683698-000000@us-west-2.amazonses.com>
Date: Wed, 22 Jul 2026 05:49:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.22-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 05:50:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241590

--===============4149769399382220215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools-scm* to *10.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-scm-upgrade-10.2.0-10.2.1.patch
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
From 19e3d88e0e8967925cf9db56ff5e91e50b1ac063 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 22 Jul 2026 05:42:11 +0000
Subject: [PATCH] python3-setuptools-scm: upgrade 10.2.0 -> 10.2.1

Source: CHANGELOG.md

## 10.2.1 (2026-07-21)

### Fixed

- Omit ``scm_version.json`` and ``scm_file_list.json`` from wheel ``.dist-info``
  while still including them in sdists for fallback discovery. ([#1473](https://github.com/pypa/setuptools-scm/issues/1473))

### Fixed

- Pass `project_root` from egg_info to the workdir so file discovery is correctly scoped in monorepo setups. ([#1440](https://github.com/pypa/setuptools-scm/issues/1440))
---
 ...etuptools-scm_10.2.0.bb => python3-setuptools-scm_10.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_10.2.0.bb => python3-setuptools-scm_10.2.1.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb b/meta/recipes-devtools/python/python3-setuptools-scm_10.2.1.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_10.2.1.bb
index d3ff181ad6..608c0ba47f 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_10.2.1.bb
@@ -6,7 +6,7 @@ argument or in a SCM managed file."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 
-SRC_URI[sha256sum] = "ec8ea1738b92e42146a46e29a0e9de9ad462744c63cf9778677b95dfd605adde"
+SRC_URI[sha256sum] = "4fa7dd82cf8c800df59c9a288c90299b1657ff1ecfc3f5cc00287c5dbf5e27a9"
 
 PYPI_PACKAGE = "setuptools_scm"
 
-- 
2.47.1


--===============4149769399382220215==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-scm-upgrade-10.2.0-10.2.1.patch"

RnJvbSAxOWUzZDg4ZTBlODk2NzkyNWNmOWRiNTZmZjVlOTFlNTBiMWFjMDYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjIgSnVsIDIwMjYgMDU6NDI6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHMtc2NtOiB1cGdyYWRlIDEwLjIuMCAtPiAxMC4yLjEKClNvdXJjZTog
Q0hBTkdFTE9HLm1kCgojIyAxMC4yLjEgKDIwMjYtMDctMjEpCgojIyMgRml4ZWQKCi0gT21pdCBg
YHNjbV92ZXJzaW9uLmpzb25gYCBhbmQgYGBzY21fZmlsZV9saXN0Lmpzb25gYCBmcm9tIHdoZWVs
IGBgLmRpc3QtaW5mb2BgCiAgd2hpbGUgc3RpbGwgaW5jbHVkaW5nIHRoZW0gaW4gc2Rpc3RzIGZv
ciBmYWxsYmFjayBkaXNjb3ZlcnkuIChbIzE0NzNdKGh0dHBzOi8vZ2l0aHViLmNvbS9weXBhL3Nl
dHVwdG9vbHMtc2NtL2lzc3Vlcy8xNDczKSkKCiMjIyBGaXhlZAoKLSBQYXNzIGBwcm9qZWN0X3Jv
b3RgIGZyb20gZWdnX2luZm8gdG8gdGhlIHdvcmtkaXIgc28gZmlsZSBkaXNjb3ZlcnkgaXMgY29y
cmVjdGx5IHNjb3BlZCBpbiBtb25vcmVwbyBzZXR1cHMuIChbIzE0NDBdKGh0dHBzOi8vZ2l0aHVi
LmNvbS9weXBhL3NldHVwdG9vbHMtc2NtL2lzc3Vlcy8xNDQwKSkKLS0tCiAuLi5ldHVwdG9vbHMt
c2NtXzEwLjIuMC5iYiA9PiBweXRob24zLXNldHVwdG9vbHMtc2NtXzEwLjIuMS5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXNldHVwdG9vbHMtc2NtXzEwLjIu
MC5iYiA9PiBweXRob24zLXNldHVwdG9vbHMtc2NtXzEwLjIuMS5iYn0gKDg5JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy1zY21f
MTAuMi4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9v
bHMtc2NtXzEwLjIuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDg5JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy1zY21fMTAuMi4wLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy1z
Y21fMTAuMi4xLmJiCmluZGV4IGQzZmYxODFhZDYuLjYwOGMwYmE0N2YgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLXNjbV8xMC4yLjAu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMt
c2NtXzEwLjIuMS5iYgpAQCAtNiw3ICs2LDcgQEAgYXJndW1lbnQgb3IgaW4gYSBTQ00gbWFuYWdl
ZCBmaWxlLiIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElD
RU5TRTttZDU9ODM4YzM2NmY2OWI3MmM1ZGYwNWM5NmRmZjc5YjM1ZjIiCiAKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICJlYzhlYTE3MzhiOTJlNDIxNDZhNDZlMjlhMGU5ZGU5YWQ0NjI3NDRjNjNjZjk3
Nzg2NzdiOTVkZmQ2MDVhZGRlIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjRmYTdkZDgyY2Y4Yzgw
MGRmNTljOWEyODhjOTAyOTliMTY1N2ZmMWVjZmMzZjVjYzAwMjg3YzVkYmY1ZTI3YTkiCiAKIFBZ
UElfUEFDS0FHRSA9ICJzZXR1cHRvb2xzX3NjbSIKIAotLSAKMi40Ny4xCgo=

--===============4149769399382220215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-setuptools-scm: PKGV changed from 10.2.0 [default] to 10.2.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-scm: PV changed from "10.2.0" to "10.2.1"
packages/x86-64-v3-poky-linux/python3-setuptools-scm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools_scm/setuptools_scm-10.2.0.tar.gz;downloadfilename=setuptools_scm-10.2.0.tar.gz" to "https://files.pythonhosted.org/packages/source/s/setuptools_scm/setuptools_scm-10.2.1.tar.gz;downloadfilename=setuptools_scm-10.2.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dbg: PKGV changed from 10.2.0 [default] to 10.2.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dbg: PV changed from "10.2.0" to "10.2.1"
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dev: PKGV changed from 10.2.0 [default] to 10.2.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dev: PV changed from "10.2.0" to "10.2.1"
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-doc: PKGV changed from 10.2.0 [default] to 10.2.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-doc: PV changed from "10.2.0" to "10.2.1"
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-locale: PKGV changed from 10.2.0 [default] to 10.2.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-locale: PV changed from "10.2.0" to "10.2.1"
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-src: PKGV changed from 10.2.0 [default] to 10.2.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-src: PV changed from "10.2.0" to "10.2.1"
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-staticdev: PKGV changed from 10.2.0 [default] to 10.2.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm-staticdev: PV changed from "10.2.0" to "10.2.1"
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PKGSIZE changed from 146137 to 154736 (+6%)
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PKGV changed from 10.2.0 [default] to 10.2.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PV changed from "10.2.0" to "10.2.1"
packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/setuptools_scm-10.2.0.dist-info -> /usr/lib/python3.14/site-packages/setuptools_scm-10.2.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/setuptools_scm-10.2.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/setuptools_scm-10.2.1.dist-info/licenses, added "/usr/lib/python3.14/site-packages/setuptools_scm/_integration/__pycache__/bdist_wheel.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools_scm/_integration/bdist_wheel.py"
Changes to packages/x86-64-v3-poky-linux/python3-setuptools-scm (sysroot):
  /usr/lib/python3.14/site-packages/setuptools_scm-10.2.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools_scm-10.2.1.dist-info
  /usr/lib/python3.14/site-packages/setuptools_scm/_integration/bdist_wheel.py was added
  /usr/lib/python3.14/site-packages/setuptools_scm/_integration/__pycache__/bdist_wheel.cpython-314.pyc was added

--===============4149769399382220215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-setuptools-scm/python3-setuptools-scm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/setuptools_scm-10.2.0.dist-info -> /usr/lib/python3.14/site-packages/setuptools_scm-10.2.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/setuptools_scm-10.2.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/setuptools_scm-10.2.1.dist-info/licenses, added "/usr/lib/python3.14/site-packages/setuptools_scm/_integration/__pycache__/bdist_wheel.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools_scm/_integration/bdist_wheel.py"
Changes to packages/x86-64-v3-poky-linux/python3-setuptools-scm (sysroot):
  /usr/lib/python3.14/site-packages/setuptools_scm-10.2.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools_scm-10.2.1.dist-info
  /usr/lib/python3.14/site-packages/setuptools_scm/_integration/bdist_wheel.py was added
  /usr/lib/python3.14/site-packages/setuptools_scm/_integration/__pycache__/bdist_wheel.cpython-314.pyc was added

--===============4149769399382220215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="python3-setuptools-scm-changelog.txt"

Changelog for python3-setuptools-scm: 10.2.0 -> 10.2.1
Source: CHANGELOG.md

## 10.2.1 (2026-07-21)

### Fixed

- Omit ``scm_version.json`` and ``scm_file_list.json`` from wheel ``.dist-info``
  while still including them in sdists for fallback discovery. ([#1473](https://github.com/pypa/setuptools-scm/issues/1473))

### Fixed

- Pass `project_root` from egg_info to the workdir so file discovery is correctly scoped in monorepo setups. ([#1440](https://github.com/pypa/setuptools-scm/issues/1440))

--===============4149769399382220215==--

