Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E80DD5CC80
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:27 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17403.1765872146646309370
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=14tTW3NM;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=BKMc3cxH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019b262e9686-28f7db00-970e-47e8-a19d-1ea9723f1e5e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EG3tUUpXuq9kjrBFmh9PQTkMsPxz3uK/N4cxnpfSZVw=;
	b=14tTW3NMXTMPu0LE3J6PLxEfXYeMegX40AFEEN8FnesfT7jlXpRi7BU4ZkAQWNmb
	X/kfU9cAWdIArJSlrJzI89hU6HBPkJfJmrt3iKELKkCfAKJy/D99rDEOGG3jEdK9h5h
	NjTpiTlIkGtKOz9PxWwe/GavnrUxF4XLCbSLIPA0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EG3tUUpXuq9kjrBFmh9PQTkMsPxz3uK/N4cxnpfSZVw=;
	b=BKMc3cxHz+SIUmuN8cJOGXf89A6gVdv4ez86af54rFlUYtO7v9dt5ajlE0ynrvLh
	Oz/FXabb++appMuytA0O3klCLBa/Su2nfrzZziystCooYRuNZFKdHTqGgncueXqrP5e
	ABG7/F8encGIfVJx1QJ91mVOxA5IgJdKmtc41Gvw=
Content-Type: multipart/mixed; boundary="===============1202865860147042284=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytest-subtests: upgrading to 0.15.0 SUCCEEDED
Message-ID: <0101019b262e9686-28f7db00-970e-47e8-a19d-1ea9723f1e5e-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227820

--===============1202865860147042284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pytest-subtests* to *0.15.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytest-subtests-upgrade-0.14.2-0.15.0.patch
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
From 97835a536c2d5997fa954e964c8c8c7d53f12612 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 01:03:35 +0000
Subject: [PATCH] python3-pytest-subtests: upgrade 0.14.2 -> 0.15.0

---
 ...est-subtests_0.14.2.bb => python3-pytest-subtests_0.15.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest-subtests_0.14.2.bb => python3-pytest-subtests_0.15.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb b/meta/recipes-devtools/python/python3-pytest-subtests_0.15.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb
rename to meta/recipes-devtools/python/python3-pytest-subtests_0.15.0.bb
index 58212bfb1c..01d2332732 100644
--- a/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb
+++ b/meta/recipes-devtools/python/python3-pytest-subtests_0.15.0.bb
@@ -7,7 +7,7 @@ BUGTRACKER = "https://github.com/pytest-dev/pytest-subtests/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=242b4e17fa287dcf7aef372f6bc3dcb1"
 
-SRC_URI[sha256sum] = "7154a8665fd528ee70a76d00216a44d139dc3c9c83521a0f779f7b0ad4f800de"
+SRC_URI[sha256sum] = "cb495bde05551b784b8f0b8adfaa27edb4131469a27c339b80fd8d6ba33f887c"
 
 PYPI_PACKAGE = "pytest_subtests"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.47.1


--===============1202865860147042284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pytest-subtests/python3-pytest-subtests: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pytest_subtests-0.14.2.dist-info -> /usr/lib/python3.13/site-packages/pytest_subtests-0.15.0.dist-info, directory renamed /usr/lib/python3.13/site-packages/pytest_subtests-0.14.2.dist-info/licenses -> /usr/lib/python3.13/site-packages/pytest_subtests-0.15.0.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pytest-subtests (sysroot):
  /usr/lib/python3.13/site-packages/pytest_subtests-0.14.2.dist-info moved to /usr/lib/python3.13/site-packages/pytest_subtests-0.15.0.dist-info

--===============1202865860147042284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pytest-subtests: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytest_subtests/pytest_subtests-0.14.2.tar.gz;downloadfilename=pytest_subtests-0.14.2.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pytest_subtests/pytest_subtests-0.15.0.tar.gz;downloadfilename=pytest_subtests-0.15.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-pytest-subtests: PKGV changed from 0.14.2 [default] to 0.15.0 [default]
packages/x86-64-v3-poky-linux/python3-pytest-subtests: PV changed from "0.14.2" to "0.15.0"
packages/x86-64-v3-poky-linux/python3-pytest-subtests/python3-pytest-subtests-dbg: PKGV changed from 0.14.2 [default] to 0.15.0 [default]
packages/x86-64-v3-poky-linux/python3-pytest-subtests/python3-pytest-subtests-dbg: PV changed from "0.14.2" to "0.15.0"
packages/x86-64-v3-poky-linux/python3-pytest-subtests/python3-pytest-subtests-dev: PKGV changed from 0.14.2 [default] to 0.15.0 [default]
packages/x86-64-v3-poky-linux/python3-pytest-subtests/python3-pytest-subtests-dev: PV changed from "0.14.2" to "0.15.0"
packages/x86-64-v3-poky-linux/python3-pytest-subtests/python3-pytest-subtests-doc: PKGV changed from 0.14.2 [default] to 0.15.0 [default]
packages/x86-64-v3-poky-linux/python3-pytest-subtests/python3-pytest-subtests-doc: PV changed from "0.14.2" to "0.15.0"
packages/x86-64-v3-poky-linux/python3-pytest-subtests/python3-pytest-subtests-locale: PKGV changed from 0.14.2 [default] to 0.15.0 [default]
packages/x86-64-v3-poky-linux/python3-pytest-subtests/python3-pytest-subtests-locale: PV changed from "0.14.2" to "0.15.0"
packages/x86-64-v3-poky-linux/python3-pytest-subtests/python3-pytest-subtests-src: PKGV changed from 0.14.2 [default] to 0.15.0 [default]
packages/x86-64-v3-poky-linux/python3-pytest-subtests/python3-pytest-subtests-src: PV changed from "0.14.2" to "0.15.0"
packages/x86-64-v3-poky-linux/python3-pytest-subtests/python3-pytest-subtests-staticdev: PKGV changed from 0.14.2 [default] to 0.15.0 [default]
packages/x86-64-v3-poky-linux/python3-pytest-subtests/python3-pytest-subtests-staticdev: PV changed from "0.14.2" to "0.15.0"
packages/x86-64-v3-poky-linux/python3-pytest-subtests/python3-pytest-subtests: PKGV changed from 0.14.2 [default] to 0.15.0 [default]
packages/x86-64-v3-poky-linux/python3-pytest-subtests/python3-pytest-subtests: PKGSIZE changed from 48292 to 49167 (+2%)
packages/x86-64-v3-poky-linux/python3-pytest-subtests/python3-pytest-subtests: PV changed from "0.14.2" to "0.15.0"
packages/x86-64-v3-poky-linux/python3-pytest-subtests/python3-pytest-subtests: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pytest_subtests-0.14.2.dist-info/licenses -> /usr/lib/python3.13/site-packages/pytest_subtests-0.15.0.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/pytest_subtests-0.14.2.dist-info -> /usr/lib/python3.13/site-packages/pytest_subtests-0.15.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pytest-subtests (sysroot):
  /usr/lib/python3.13/site-packages/pytest_subtests-0.14.2.dist-info moved to /usr/lib/python3.13/site-packages/pytest_subtests-0.15.0.dist-info

--===============1202865860147042284==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pytest-subtests-upgrade-0.14.2-0.15.0.patch"

RnJvbSA5NzgzNWE1MzZjMmQ1OTk3ZmE5NTRlOTY0YzhjOGM3ZDUzZjEyNjEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDE6MDM6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5dGVzdC1zdWJ0ZXN0czogdXBncmFkZSAwLjE0LjIgLT4gMC4xNS4wCgotLS0KIC4u
LmVzdC1zdWJ0ZXN0c18wLjE0LjIuYmIgPT4gcHl0aG9uMy1weXRlc3Qtc3VidGVzdHNfMC4xNS4w
LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHl0ZXN0LXN1
YnRlc3RzXzAuMTQuMi5iYiA9PiBweXRob24zLXB5dGVzdC1zdWJ0ZXN0c18wLjE1LjAuYmJ9ICg4
OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5
dGVzdC1zdWJ0ZXN0c18wLjE0LjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtcHl0ZXN0LXN1YnRlc3RzXzAuMTUuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg4JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0ZXN0LXN1YnRl
c3RzXzAuMTQuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXB5dGVzdC1zdWJ0ZXN0c18wLjE1LjAuYmIKaW5kZXggNTgyMTJiZmIxYy4uMDFkMjMzMjcz
MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dGVz
dC1zdWJ0ZXN0c18wLjE0LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXB5dGVzdC1zdWJ0ZXN0c18wLjE1LjAuYmIKQEAgLTcsNyArNyw3IEBAIEJVR1RSQUNL
RVIgPSAiaHR0cHM6Ly9naXRodWIuY29tL3B5dGVzdC1kZXYvcHl0ZXN0LXN1YnRlc3RzL2lzc3Vl
cyIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTtt
ZDU9MjQyYjRlMTdmYTI4N2RjZjdhZWYzNzJmNmJjM2RjYjEiCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICI3MTU0YTg2NjVmZDUyOGVlNzBhNzZkMDAyMTZhNDRkMTM5ZGMzYzljODM1MjFhMGY3Nzlm
N2IwYWQ0ZjgwMGRlIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImNiNDk1YmRlMDU1NTFiNzg0Yjhm
MGI4YWRmYWEyN2VkYjQxMzE0NjlhMjdjMzM5YjgwZmQ4ZDZiYTMzZjg4N2MiCiAKIFBZUElfUEFD
S0FHRSA9ICJweXRlc3Rfc3VidGVzdHMiCiBVUFNUUkVBTV9DSEVDS19QWVBJX1BBQ0tBR0UgPSAi
JHtQWVBJX1BBQ0tBR0V9IgotLSAKMi40Ny4xCgo=

--===============1202865860147042284==--

