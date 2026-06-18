Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2EB1CD98F6
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 05:53:31 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13247.1781762008992808593
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 22:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=oHJI2E6h;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=f0tuu3pw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019ed94aa42f-e55ca5ae-11e3-450a-a887-a8444d5d74f3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781762008;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=P8E4u73IH5AqG0/U2y7RgqfzWNGuC76ODYyVsmU85Uw=;
	b=oHJI2E6h0NGSsBhABjNrH+6G7ecUupSok6HzS12bj5LlljQFyfc5DKVVqzwnIM0w
	1zLBXK+GbPvbbC//kJ21L5MVcN4nLIQxQ4m50TLTeiO7yRTiTWYj0PlnTkIiMK00fvz
	u2B1uV69dO31Dj5YLIL2nprUoBZY96oc37Hceu7c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781762008;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=P8E4u73IH5AqG0/U2y7RgqfzWNGuC76ODYyVsmU85Uw=;
	b=f0tuu3pwBwm5X1C5jtKIb6D2b2Z6yal1OPrcwAKDaFEp72KnXJElJBRcVt9r3bxq
	739plTxE7z4mR+x0DCkHAJp7yrSHEmFSV2D3UjUIclMVhl4+T+uGBhKFluMgyXP4rly
	bFJDwi7Z846BwaQIfIcvIC/++Fq5XCtpKH7kiVNo=
Content-Type: multipart/mixed; boundary="===============9148127468973692572=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-certifi: upgrading to 2026.6.17 SUCCEEDED
Message-ID: <0101019ed94aa42f-e55ca5ae-11e3-450a-a887-a8444d5d74f3-000000@us-west-2.amazonses.com>
Date: Thu, 18 Jun 2026 05:53:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.18-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 05:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239050

--===============9148127468973692572==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-certifi* to *2026.6.17* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-certifi-upgrade-2026.5.20-2026.6.17.patch
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
From a7c2a72d3be01759ab2f6c53d8c6b82e8e9fbbd6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 18 Jun 2026 05:35:58 +0000
Subject: [PATCH] python3-certifi: upgrade 2026.5.20 -> 2026.6.17

---
 ...ython3-certifi_2026.5.20.bb => python3-certifi_2026.6.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2026.5.20.bb => python3-certifi_2026.6.17.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.5.20.bb b/meta/recipes-devtools/python/python3-certifi_2026.6.17.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2026.5.20.bb
rename to meta/recipes-devtools/python/python3-certifi_2026.6.17.bb
index bfeaeb965b..db78aaea0c 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.5.20.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.6.17.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "69dea482ab64caa7b9f6aba1c6bf48bb6a5448d1c0f1b17ab42ad8c763a5344d"
+SRC_URI[sha256sum] = "024c88eeec92ca068db80f02b8b07c9cef7b9fe261d1d535abfd5abd6f6af432"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.1


--===============9148127468973692572==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-certifi-upgrade-2026.5.20-2026.6.17.patch"

RnJvbSBhN2MyYTcyZDNiZTAxNzU5YWIyZjZjNTNkOGM2YjgyZThlOWZiYmQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTggSnVuIDIwMjYgMDU6MzU6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNlcnRpZmk6IHVwZ3JhZGUgMjAyNi41LjIwIC0+IDIwMjYuNi4xNwoKLS0tCiAuLi55
dGhvbjMtY2VydGlmaV8yMDI2LjUuMjAuYmIgPT4gcHl0aG9uMy1jZXJ0aWZpXzIwMjYuNi4xNy5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWNlcnRpZmlfMjAy
Ni41LjIwLmJiID0+IHB5dGhvbjMtY2VydGlmaV8yMDI2LjYuMTcuYmJ9ICg4NyUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyNi41
LjIwLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAy
Ni42LjE3LmJiCnNpbWlsYXJpdHkgaW5kZXggODclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjYuNS4yMC5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyNi42LjE3LmJiCmlu
ZGV4IGJmZWFlYjk2NWIuLmRiNzhhYWVhMGMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjYuNS4yMC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDI2LjYuMTcuYmIKQEAgLTcsNyAr
Nyw3IEBAIEhPTUVQQUdFID0gIiBodHRwOi8vY2VydGlmaS5pby8iCiBMSUNFTlNFID0gIklTQyIK
IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTExNjE4Y2I2YTk3NTk0ODY3
OTI4NmIxMjExYmQ1NzNjIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjlkZWE0ODJhYjY0Y2Fh
N2I5ZjZhYmExYzZiZjQ4YmI2YTU0NDhkMWMwZjFiMTdhYjQyYWQ4Yzc2M2E1MzQ0ZCIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICIwMjRjODhlZWVjOTJjYTA2OGRiODBmMDJiOGIwN2M5Y2VmN2I5ZmUy
NjFkMWQ1MzVhYmZkNWFiZDZmNmFmNDMyIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9v
bHNfYnVpbGRfbWV0YQogCi0tIAoyLjQ3LjEKCg==

--===============9148127468973692572==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-certifi: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2026.5.20.tar.gz;downloadfilename=certifi-2026.5.20.tar.gz" to "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2026.6.17.tar.gz;downloadfilename=certifi-2026.6.17.tar.gz"
packages/x86-64-v3-poky-linux/python3-certifi: PKGV changed from 2026.5.20 [default] to 2026.6.17 [default]
packages/x86-64-v3-poky-linux/python3-certifi: PV changed from "2026.5.20" to "2026.6.17"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dbg: PKGV changed from 2026.5.20 [default] to 2026.6.17 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dbg: PV changed from "2026.5.20" to "2026.6.17"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dev: PKGV changed from 2026.5.20 [default] to 2026.6.17 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dev: PV changed from "2026.5.20" to "2026.6.17"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-doc: PKGV changed from 2026.5.20 [default] to 2026.6.17 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-doc: PV changed from "2026.5.20" to "2026.6.17"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-locale: PKGV changed from 2026.5.20 [default] to 2026.6.17 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-locale: PV changed from "2026.5.20" to "2026.6.17"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-src: PKGV changed from 2026.5.20 [default] to 2026.6.17 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-src: PV changed from "2026.5.20" to "2026.6.17"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-staticdev: PKGV changed from 2026.5.20 [default] to 2026.6.17 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-staticdev: PV changed from "2026.5.20" to "2026.6.17"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: PKGSIZE changed from 246963 to 245222 (-1%)
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: PKGV changed from 2026.5.20 [default] to 2026.6.17 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: PV changed from "2026.5.20" to "2026.6.17"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: FILELIST: directory renamed /usr/lib/python3.14/site-packages/certifi-2026.5.20.dist-info/licenses -> /usr/lib/python3.14/site-packages/certifi-2026.6.17.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/certifi-2026.5.20.dist-info -> /usr/lib/python3.14/site-packages/certifi-2026.6.17.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.14/site-packages/certifi-2026.5.20.dist-info moved to /usr/lib/python3.14/site-packages/certifi-2026.6.17.dist-info

--===============9148127468973692572==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: FILELIST: directory renamed /usr/lib/python3.14/site-packages/certifi-2026.5.20.dist-info -> /usr/lib/python3.14/site-packages/certifi-2026.6.17.dist-info, directory renamed /usr/lib/python3.14/site-packages/certifi-2026.5.20.dist-info/licenses -> /usr/lib/python3.14/site-packages/certifi-2026.6.17.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.14/site-packages/certifi-2026.5.20.dist-info moved to /usr/lib/python3.14/site-packages/certifi-2026.6.17.dist-info

--===============9148127468973692572==--

