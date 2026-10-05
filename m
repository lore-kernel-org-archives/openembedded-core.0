Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1276CA5FFE
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 05:28:51 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13636.1791178118269409156
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Oct 2026 22:28:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HKTRA1C/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=fpSxbmVh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a10a891128-69d0d92b-b987-44ba-a241-d0c5d782eef6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791178117;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=82rneQPef5vH1PTo3GUKtrB/jCLlQhUx/W6K2YzRIZU=;
	b=HKTRA1C/rbFvT+Q0MhjMP6BlSZZfGz0uafnye+Yp/HuonGqAcsEAmgZAitE+reoM
	BY89PlBBgPb2Fw7Tk+sYfYCWI6Er5+ugxwbCXdOknJ7+zB48/+yOAd9ueo6ViHSUv+D
	ZhPCf0XKJ/0TA8OOH2FsxT39C29MNtfhi9YNdqLk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791178117;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=82rneQPef5vH1PTo3GUKtrB/jCLlQhUx/W6K2YzRIZU=;
	b=fpSxbmVhLiFmMtYVud3XQQbQ3GZ8OF9odQOMjSSHdII6WjhvEr8+au7wJzRl/6QI
	8mYPt9CmRY/tXoWzUFYh/z1JipChG0TggVWk4ZZVn7xwlpHUHtaxE5UFHQVOBEh/D7c
	7zsPjyktNfmH4MZyR+8aEZWnYiNS5jCsAK9V9nE4=
Content-Type: multipart/mixed; boundary="===============0303259237975828828=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-wcwidth: upgrading to 0.9.2 SUCCEEDED
Message-ID: <010101a10a891128-69d0d92b-b987-44ba-a241-d0c5d782eef6-000000@us-west-2.amazonses.com>
Date: Mon, 5 Oct 2026 05:28:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.05-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 05:28:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247210

--===============0303259237975828828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-wcwidth* to *0.9.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-wcwidth-upgrade-0.9.1-0.9.2.patch
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
From b3938b696c4518540edef43e21cc0a7d683f6774 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 5 Oct 2026 05:28:30 +0000
Subject: [PATCH] python3-wcwidth: upgrade 0.9.1 -> 0.9.2

0.9.2 *2026-10-04*
---
 .../{python3-wcwidth_0.9.1.bb => python3-wcwidth_0.9.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.9.1.bb => python3-wcwidth_0.9.2.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.9.1.bb b/meta/recipes-devtools/python/python3-wcwidth_0.9.2.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-wcwidth_0.9.1.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.9.2.bb
index e7156a79ee..452456ca51 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.9.1.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.9.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "5823209b0d43af322ce698c689380d7c15ca31fa8e6e3be8459f27031bef0af5"
+SRC_URI[sha256sum] = "ae0ef90b90f6af38b54f1fe6d58662ec33b3cb4b8391958a62416d654231727b"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.47.1


--===============0303259237975828828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: FILELIST: directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.9.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/wcwidth-0.9.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.9.1.dist-info -> /usr/lib/python3.14/site-packages/wcwidth-0.9.2.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.14/site-packages/wcwidth-0.9.1.dist-info moved to /usr/lib/python3.14/site-packages/wcwidth-0.9.2.dist-info

--===============0303259237975828828==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-wcwidth-upgrade-0.9.1-0.9.2.patch"

RnJvbSBiMzkzOGI2OTZjNDUxODU0MGVkZWY0M2UyMWNjMGE3ZDY4M2Y2Nzc0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgNSBPY3QgMjAyNiAwNToyODozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtd2N3aWR0aDogdXBncmFkZSAwLjkuMSAtPiAwLjkuMgoKMC45LjIgKjIwMjYtMTAtMDQq
Ci0tLQogLi4uL3tweXRob24zLXdjd2lkdGhfMC45LjEuYmIgPT4gcHl0aG9uMy13Y3dpZHRoXzAu
OS4yLmJifSAgICAgIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy13
Y3dpZHRoXzAuOS4xLmJiID0+IHB5dGhvbjMtd2N3aWR0aF8wLjkuMi5iYn0gKDg4JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2N3aWR0aF8wLjku
MS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13Y3dpZHRoXzAuOS4y
LmJiCnNpbWlsYXJpdHkgaW5kZXggODglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy13Y3dpZHRoXzAuOS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2N3aWR0aF8wLjkuMi5iYgppbmRleCBlNzE1NmE3OWVl
Li40NTI0NTZjYTUxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtd2N3aWR0aF8wLjkuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtd2N3aWR0aF8wLjkuMi5iYgpAQCAtNCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0
cHM6Ly9naXRodWIuY29tL2pxdWFzdC93Y3dpZHRoIgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1iMTU5NzljMzlhMjU0Mzg5MmZjYThjZDg2
YjRiNTJjYiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU4MjMyMDliMGQ0M2FmMzIyY2U2OThj
Njg5MzgwZDdjMTVjYTMxZmE4ZTZlM2JlODQ1OWYyNzAzMWJlZjBhZjUiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiYWUwZWY5MGI5MGY2YWYzOGI1NGYxZmU2ZDU4NjYyZWMzM2IzY2I0YjgzOTE5NThh
NjI0MTZkNjU0MjMxNzI3YiIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9oYXRjaGxpbmcgcHRlc3Qt
cHl0aG9uLXB5dGVzdAogCi0tIAoyLjQ3LjEKCg==

--===============0303259237975828828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-wcwidth: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.9.1.tar.gz" to "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.9.2.tar.gz"
packages/x86-64-v3-poky-linux/python3-wcwidth: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/python3-wcwidth: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PKGSIZE changed from 1604928 to 1606400 (+0%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dev: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dev: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-doc: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-doc: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-locale: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-locale: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGSIZE changed from 3834969 to 3841149 (+0%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: PKGSIZE changed from 3534102 to 3535297 (+0%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: FILELIST: directory renamed /usr/src/debug/python3-wcwidth/0.9.1/wcwidth -> /usr/src/debug/python3-wcwidth/0.9.2/wcwidth, directory renamed /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/include/wcwidth -> /usr/src/debug/python3-wcwidth/0.9.2/libwcwidth/include/wcwidth, directory renamed /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src -> /usr/src/debug/python3-wcwidth/0.9.2/libwcwidth/src, directory renamed /usr/src/debug/python3-wcwidth/0.9.1/libwcwidth/src/tables -> /usr/src/debug/python3-wcwidth/0.9.2/libwcwidth/src/tables
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PKGSIZE changed from 5343493 to 5351488 (+0%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: FILELIST: directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.9.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/wcwidth-0.9.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.9.1.dist-info -> /usr/lib/python3.14/site-packages/wcwidth-0.9.2.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.14/site-packages/wcwidth-0.9.1.dist-info moved to /usr/lib/python3.14/site-packages/wcwidth-0.9.2.dist-info

--===============0303259237975828828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-wcwidth-changelog.txt"

0.9.2 *2026-10-04*

--===============0303259237975828828==--

