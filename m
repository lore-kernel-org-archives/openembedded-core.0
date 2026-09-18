Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C0F9C982DA
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 05:47:17 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4957.1789710435783771220
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 22:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=rNRQ6UDF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZF4u1Tuw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a0b30e02a0-bc8154e0-4dd2-4765-bffc-f75cdde0665c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789710435;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bIs0Meo3TIQX13fXI33ZgBwy9cPqD9o90A459+wIvXA=;
	b=rNRQ6UDFBfEHCLaJBp88tM/lsIB6QoPK/y1lM13Rn+8JhQXz5eZMecUgAdR2ToKv
	/A26xpR7AhNwu7nqFUJdScypKXnxDlk+WEsTtLZ+V0rqvfjRSSnUAS5hailmwKnGIpB
	l752O5PQglaTtromagaCqrTY4GaLPWjydzbboX58=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789710435;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bIs0Meo3TIQX13fXI33ZgBwy9cPqD9o90A459+wIvXA=;
	b=ZF4u1Tuw4m7vJNwGxO8WlNMqhUQXLC3NPeZo0Sp00ZOO6peLbKJXrrK+8foFGKEL
	0weIV5TqAI4CW955lqYWxbNFICLpXkJACn8i8eRBor8gbJ5d/DwwrP868VgcsCsGECX
	L8CXAwxs95gt25MfJEnRfOfHGbqUwgMI1UTGFNcg=
Content-Type: multipart/mixed; boundary="===============5744107275685973849=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-idna: upgrading to 3.20 SUCCEEDED
Message-ID: <010101a0b30e02a0-bc8154e0-4dd2-4765-bffc-f75cdde0665c-000000@us-west-2.amazonses.com>
Date: Fri, 18 Sep 2026 05:47:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.18-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 05:47:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246182

--===============5744107275685973849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-idna* to *3.20* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-idna-upgrade-3.19-3.20.patch
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
From 5858c9b4a180eace3791fb0299955b0a6062b84e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 18 Sep 2026 05:27:14 +0000
Subject: [PATCH] python3-idna: upgrade 3.19 -> 3.20

Source: HISTORY.md

## 3.20 (2026-09-17)

- Update to Unicode 18.0.0.
- Better enforcement of the domain length limit in the incremental
  codec.
- Add support for Python 3.15.

## 3.19 (2026-08-18)
---
 .../python/{python3-idna_3.19.bb => python3-idna_3.20.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-idna_3.19.bb => python3-idna_3.20.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-idna_3.19.bb b/meta/recipes-devtools/python/python3-idna_3.20.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-idna_3.19.bb
rename to meta/recipes-devtools/python/python3-idna_3.20.bb
index 92bbda59d5..1baa2f1c26 100644
--- a/meta/recipes-devtools/python/python3-idna_3.19.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.20.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause AND Python-2.0 AND Unicode-TOU"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=9a6c29079fc90c29d80332f44d2625f2"
 
-SRC_URI[sha256sum] = "5e0811a4383b21dc5838069f801c4fb62113b7447663d2530d2bd6e77b49bf15"
+SRC_URI[sha256sum] = "a7db850025b95ded1eae8a46181a1a6c56c92c96f0e2b005d9ff8dc0210cab44"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-- 
2.47.1


--===============5744107275685973849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-idna/python3-idna: FILELIST: directory renamed /usr/lib/python3.14/site-packages/idna-3.19.dist-info/licenses -> /usr/lib/python3.14/site-packages/idna-3.20.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/idna-3.19.dist-info -> /usr/lib/python3.14/site-packages/idna-3.20.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-idna (sysroot):
  /usr/lib/python3.14/site-packages/idna-3.19.dist-info moved to /usr/lib/python3.14/site-packages/idna-3.20.dist-info

--===============5744107275685973849==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-idna-upgrade-3.19-3.20.patch"

RnJvbSA1ODU4YzliNGExODBlYWNlMzc5MWZiMDI5OTk1NWIwYTYwNjJiODRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTggU2VwIDIwMjYgMDU6Mjc6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWlkbmE6IHVwZ3JhZGUgMy4xOSAtPiAzLjIwCgpTb3VyY2U6IEhJU1RPUlkubWQKCiMj
IDMuMjAgKDIwMjYtMDktMTcpCgotIFVwZGF0ZSB0byBVbmljb2RlIDE4LjAuMC4KLSBCZXR0ZXIg
ZW5mb3JjZW1lbnQgb2YgdGhlIGRvbWFpbiBsZW5ndGggbGltaXQgaW4gdGhlIGluY3JlbWVudGFs
CiAgY29kZWMuCi0gQWRkIHN1cHBvcnQgZm9yIFB5dGhvbiAzLjE1LgoKIyMgMy4xOSAoMjAyNi0w
OC0xOCkKLS0tCiAuLi4vcHl0aG9uL3tweXRob24zLWlkbmFfMy4xOS5iYiA9PiBweXRob24zLWlk
bmFfMy4yMC5iYn0gICAgICAgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRo
b24zLWlkbmFfMy4xOS5iYiA9PiBweXRob24zLWlkbmFfMy4yMC5iYn0gKDg0JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaWRuYV8zLjE5LmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWlkbmFfMy4yMC5iYgpzaW1pbGFy
aXR5IGluZGV4IDg0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtaWRuYV8zLjE5LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtaWRuYV8zLjIwLmJiCmluZGV4IDkyYmJkYTU5ZDUuLjFiYWEyZjFjMjYgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pZG5hXzMuMTkuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWlkbmFfMy4yMC5iYgpA
QCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL2tqZC9pZG5hIgog
TElDRU5TRSA9ICJCU0QtMy1DbGF1c2UgQU5EIFB5dGhvbi0yLjAgQU5EIFVuaWNvZGUtVE9VIgog
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5tZDttZDU9OWE2YzI5MDc5ZmM5MGMy
OWQ4MDMzMmY0NGQyNjI1ZjIiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1ZTA4MTFhNDM4M2Iy
MWRjNTgzODA2OWY4MDFjNGZiNjIxMTNiNzQ0NzY2M2QyNTMwZDJiZDZlNzdiNDliZjE1IgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gImE3ZGI4NTAwMjViOTVkZWQxZWFlOGE0NjE4MWExYTZjNTZjOTJj
OTZmMGUyYjAwNWQ5ZmY4ZGMwMjEwY2FiNDQiCiAKIGluaGVyaXQgcHlwaSBweXRob25fZmxpdF9j
b3JlIHB0ZXN0LXB5dGhvbi1weXRlc3QKIAotLSAKMi40Ny4xCgo=

--===============5744107275685973849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-idna: PKGV changed from 3.19 [default] to 3.20 [default]
packages/x86-64-v3-poky-linux/python3-idna: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/idna/idna-3.19.tar.gz" to "https://files.pythonhosted.org/packages/source/i/idna/idna-3.20.tar.gz"
packages/x86-64-v3-poky-linux/python3-idna: PV changed from "3.19" to "3.20"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-dbg: PKGV changed from 3.19 [default] to 3.20 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-dbg: PV changed from "3.19" to "3.20"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-dev: PKGV changed from 3.19 [default] to 3.20 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-dev: PV changed from "3.19" to "3.20"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-doc: PKGV changed from 3.19 [default] to 3.20 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-doc: PV changed from "3.19" to "3.20"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-locale: PKGV changed from 3.19 [default] to 3.20 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-locale: PV changed from "3.19" to "3.20"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-ptest: PKGV changed from 3.19 [default] to 3.20 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-ptest: PV changed from "3.19" to "3.20"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-ptest: PKGSIZE changed from 1545330 to 1547573 (+0%)
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-src: PKGV changed from 3.19 [default] to 3.20 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-src: PV changed from "3.19" to "3.20"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-staticdev: PKGV changed from 3.19 [default] to 3.20 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-staticdev: PV changed from "3.19" to "3.20"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna: PKGV changed from 3.19 [default] to 3.20 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna: PV changed from "3.19" to "3.20"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna: PKGSIZE changed from 513794 to 524895 (+2%)
packages/x86-64-v3-poky-linux/python3-idna/python3-idna: FILELIST: directory renamed /usr/lib/python3.14/site-packages/idna-3.19.dist-info/licenses -> /usr/lib/python3.14/site-packages/idna-3.20.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/idna-3.19.dist-info -> /usr/lib/python3.14/site-packages/idna-3.20.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-idna (sysroot):
  /usr/lib/python3.14/site-packages/idna-3.19.dist-info moved to /usr/lib/python3.14/site-packages/idna-3.20.dist-info

--===============5744107275685973849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-idna-changelog.txt"

Changelog for python3-idna: 3.19 -> 3.20
Source: HISTORY.md

## 3.20 (2026-09-17)

- Update to Unicode 18.0.0.
- Better enforcement of the domain length limit in the incremental
  codec.
- Add support for Python 3.15.

## 3.19 (2026-08-18)

--===============5744107275685973849==--

