Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8087CD6E6B
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:39 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1569.1780328137833093025
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Mt5FG+4b;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=nabiKbBk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019e83d38220-a88b8889-b8eb-42a3-9ef5-baa19852db0c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328137;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6TihL5syFJxEvLtPcFQlov9bnPrt1RKCgMGFdAN1czc=;
	b=Mt5FG+4bzwnpS3H5ZQ+sql1oV+pCS0v3IwWm50oocOOea3aTl7zG0Y++Kb84Ga9v
	siWIoHBZcPHdWNL5FpVY38ZNH2nqTepUSGp70hEukZMklXt3zZDf12YbTJKxWDgiHFc
	OOs8OAaIU1O5lYScyEQaB4qP9Wy3c95CPLBIOnGM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328137;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6TihL5syFJxEvLtPcFQlov9bnPrt1RKCgMGFdAN1czc=;
	b=nabiKbBkuwnuxSdFZ6UV0I7PfRDHUgSuXi2qd+0omyL2klPKz1wjHHSPh72JnOPm
	+gQMaZus/KynmJHqK868t4Ed0h7vD6i/a24D661RFPiiFeP3yJW01gVnqYtJ1sDl6b9
	hHEL5mChIqolBmJ0JfjxV1EE3EMlthRxoAXXDjiQ=
Content-Type: multipart/mixed; boundary="===============5746996628934635988=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-click: upgrading to 8.4.1 SUCCEEDED
Message-ID: <0101019e83d38220-a88b8889-b8eb-42a3-9ef5-baa19852db0c-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237876

--===============5746996628934635988==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-click* to *8.4.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-click-upgrade-8.3.3-8.4.1.patch
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
From dd51a03b3b34cb2a288158b38789b7d1d5407edd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 08:14:29 +0000
Subject: [PATCH] python3-click: upgrade 8.3.3 -> 8.4.1

---
 .../python/{python3-click_8.3.3.bb => python3-click_8.4.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-click_8.3.3.bb => python3-click_8.4.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-click_8.3.3.bb b/meta/recipes-devtools/python/python3-click_8.4.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-click_8.3.3.bb
rename to meta/recipes-devtools/python/python3-click_8.4.1.bb
index 12fd3cbfbd..0669cc6510 100644
--- a/meta/recipes-devtools/python/python3-click_8.3.3.bb
+++ b/meta/recipes-devtools/python/python3-click_8.4.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI[sha256sum] = "398329ad4837b2ff7cbe1dd166a4c0f8900c3ca3a218de04466f38f6497f18a2"
+SRC_URI[sha256sum] = "918b5633eddf6b41c32d4f454bf0de810065c74e3f7dbf8ee5452f8be88d3e96"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-- 
2.47.1


--===============5746996628934635988==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: PKGSIZE changed from 537604 to 622798 (+16%)
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: FILELIST: removed "/usr/lib/python3-click/ptest/docs/changes.rst /usr/lib/python3-click/ptest/docs/index.rst", added "/usr/lib/python3-click/ptest/docs/index.md /usr/lib/python3-click/ptest/docs/changes.md"
packages/x86-64-v3-poky-linux/python3-click/python3-click: FILELIST: directory renamed /usr/lib/python3.14/site-packages/click-8.3.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/click-8.4.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/click-8.3.3.dist-info -> /usr/lib/python3.14/site-packages/click-8.4.1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-click (sysroot):
  /usr/lib/python3.14/site-packages/click-8.3.3.dist-info moved to /usr/lib/python3.14/site-packages/click-8.4.1.dist-info

--===============5746996628934635988==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-click-upgrade-8.3.3-8.4.1.patch"

RnJvbSBkZDUxYTAzYjNiMzRjYjJhMjg4MTU4YjM4Nzg5YjdkMWQ1NDA3ZWRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwODoxNDoyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY2xpY2s6IHVwZ3JhZGUgOC4zLjMgLT4gOC40LjEKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1jbGlja184LjMuMy5iYiA9PiBweXRob24zLWNsaWNrXzguNC4xLmJifSAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1jbGlja184LjMuMy5iYiA9PiBweXRo
b24zLWNsaWNrXzguNC4xLmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1jbGlja184LjMuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1jbGlja184LjQuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2xpY2tfOC4zLjMu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jbGlja184
LjQuMS5iYgppbmRleCAxMmZkM2NiZmJkLi4wNjY5Y2M2NTEwIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2xpY2tfOC4zLjMuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNsaWNrXzguNC4xLmJiCkBAIC04LDcgKzgs
NyBAQCBIT01FUEFHRSA9ICJodHRwOi8vY2xpY2sucG9jb28ub3JnLyIKIExJQ0VOU0UgPSAiQlNE
LTMtQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PTFm
YTk4MjMyZmQ2NDU2MDg5MzdhMGZkYzgyZTk5OWI4IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
Mzk4MzI5YWQ0ODM3YjJmZjdjYmUxZGQxNjZhNGMwZjg5MDBjM2NhM2EyMThkZTA0NDY2ZjM4ZjY0
OTdmMThhMiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5MThiNTYzM2VkZGY2YjQxYzMyZDRmNDU0
YmYwZGU4MTAwNjVjNzRlM2Y3ZGJmOGVlNTQ1MmY4YmU4OGQzZTk2IgogCiBpbmhlcml0IHB5cGkg
cHl0aG9uX2ZsaXRfY29yZSBwdGVzdC1weXRob24tcHl0ZXN0CiAKLS0gCjIuNDcuMQoK

--===============5746996628934635988==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-click: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/click/click-8.3.3.tar.gz;downloadfilename=click-8.3.3.tar.gz" to "https://files.pythonhosted.org/packages/source/c/click/click-8.4.1.tar.gz;downloadfilename=click-8.4.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-click: PKGV changed from 8.3.3 [default] to 8.4.1 [default]
packages/x86-64-v3-poky-linux/python3-click: PV changed from "8.3.3" to "8.4.1"
packages/x86-64-v3-poky-linux/python3-click/python3-click-dbg: PKGV changed from 8.3.3 [default] to 8.4.1 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-dbg: PV changed from "8.3.3" to "8.4.1"
packages/x86-64-v3-poky-linux/python3-click/python3-click-dev: PKGV changed from 8.3.3 [default] to 8.4.1 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-dev: PV changed from "8.3.3" to "8.4.1"
packages/x86-64-v3-poky-linux/python3-click/python3-click-doc: PKGV changed from 8.3.3 [default] to 8.4.1 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-doc: PV changed from "8.3.3" to "8.4.1"
packages/x86-64-v3-poky-linux/python3-click/python3-click-locale: PKGV changed from 8.3.3 [default] to 8.4.1 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-locale: PV changed from "8.3.3" to "8.4.1"
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: PKGSIZE changed from 537604 to 622798 (+16%)
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: FILELIST: removed "/usr/lib/python3-click/ptest/docs/index.rst /usr/lib/python3-click/ptest/docs/changes.rst", added "/usr/lib/python3-click/ptest/docs/index.md /usr/lib/python3-click/ptest/docs/changes.md"
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: PKGV changed from 8.3.3 [default] to 8.4.1 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: PV changed from "8.3.3" to "8.4.1"
packages/x86-64-v3-poky-linux/python3-click/python3-click-src: PKGV changed from 8.3.3 [default] to 8.4.1 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-src: PV changed from "8.3.3" to "8.4.1"
packages/x86-64-v3-poky-linux/python3-click/python3-click-staticdev: PKGV changed from 8.3.3 [default] to 8.4.1 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-staticdev: PV changed from "8.3.3" to "8.4.1"
packages/x86-64-v3-poky-linux/python3-click/python3-click: PKGSIZE changed from 921506 to 972354 (+6%)
packages/x86-64-v3-poky-linux/python3-click/python3-click: FILELIST: directory renamed /usr/lib/python3.14/site-packages/click-8.3.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/click-8.4.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/click-8.3.3.dist-info -> /usr/lib/python3.14/site-packages/click-8.4.1.dist-info
packages/x86-64-v3-poky-linux/python3-click/python3-click: PKGV changed from 8.3.3 [default] to 8.4.1 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click: PV changed from "8.3.3" to "8.4.1"
Changes to packages/x86-64-v3-poky-linux/python3-click (sysroot):
  /usr/lib/python3.14/site-packages/click-8.3.3.dist-info moved to /usr/lib/python3.14/site-packages/click-8.4.1.dist-info

--===============5746996628934635988==--

