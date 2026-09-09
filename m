Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E26AC79FB7
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 05:42:34 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5154.1788932548112431192
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 22:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=P/5I1GPg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=2fuomvj4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a084b0606e-28ea74d0-f91e-49b1-83f7-7400c6ad8384-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788932547;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xv1mUPJTxkjIr/9tvHUzI3osgEM46R6WdoFofZCsCDk=;
	b=P/5I1GPgxK09XEHkz0oSeWkrIrhWRUPN8GwI9PSEkGssSoVfi99049zjdp/51w53
	obqAumhgMsZUBjh0qBoSh4C+BImQ6NBlemho18i8RE7Bt1aw95ty2wha0XbBrU7uiHk
	8uRzj6KPdv//tKxKEAfdt8dwBqgecQgSRF+eWKVA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788932547;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xv1mUPJTxkjIr/9tvHUzI3osgEM46R6WdoFofZCsCDk=;
	b=2fuomvj4gBCiRD+tHW0ALBy1vCQgk9Q/OO2TRWFJD/wTuewcjOyEO6FWsnDrDYy6
	lnBdKhedkoEDdpsMqzxtGRTKhQKbn7exFSzt+E8mUWy7t74v2S0TVez5cq9gk2d33wN
	LMp3NgNWBEKAiw/VpYJ3dUz4vv1EMYudp8Lv0C1U=
Content-Type: multipart/mixed; boundary="===============3650295947839553257=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Daniel Turull <daniel.turull@ericsson.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-kirk: upgrading to 4.2.0 SUCCEEDED
Message-ID: <010101a084b0606e-28ea74d0-f91e-49b1-83f7-7400c6ad8384-000000@us-west-2.amazonses.com>
Date: Wed, 9 Sep 2026 05:42:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.09-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 05:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245399

--===============3650295947839553257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-kirk* to *4.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-kirk-upgrade-4.1.0-4.2.0.patch
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
From 8d7359f85c75ae85b106b4a8057de4d8232429c0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 9 Sep 2026 05:33:22 +0000
Subject: [PATCH] python3-kirk: upgrade 4.1.0 -> 4.2.0

---
 .../{python3-kirk_4.1.0.bb => python3-kirk_4.2.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/python3-kirk/{python3-kirk_4.1.0.bb => python3-kirk_4.2.0.bb} (85%)

diff --git a/meta/recipes-extended/python3-kirk/python3-kirk_4.1.0.bb b/meta/recipes-extended/python3-kirk/python3-kirk_4.2.0.bb
similarity index 85%
rename from meta/recipes-extended/python3-kirk/python3-kirk_4.1.0.bb
rename to meta/recipes-extended/python3-kirk/python3-kirk_4.2.0.bb
index f9b478ca8d..d612829255 100644
--- a/meta/recipes-extended/python3-kirk/python3-kirk_4.1.0.bb
+++ b/meta/recipes-extended/python3-kirk/python3-kirk_4.2.0.bb
@@ -7,7 +7,7 @@ SECTION = "console/utils"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0"
 
-SRC_URI[sha256sum] = "dc4dc4fa8994b14565a3d4f31bb79d6d27102ecbbd4feaef4ebc1e10e9cbace3"
+SRC_URI[sha256sum] = "92007f840a2a0af387b6f0d88f51f5c710853238ff3bd9d2b91a34f731739c06"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.1


--===============3650295947839553257==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-kirk-upgrade-4.1.0-4.2.0.patch"

RnJvbSA4ZDczNTlmODVjNzVhZTg1YjEwNmI0YTgwNTdkZTRkODIzMjQyOWMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgOSBTZXAgMjAyNiAwNTozMzoyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMta2lyazogdXBncmFkZSA0LjEuMCAtPiA0LjIuMAoKLS0tCiAuLi4ve3B5dGhvbjMta2ly
a180LjEuMC5iYiA9PiBweXRob24zLWtpcmtfNC4yLjAuYmJ9ICAgICAgICAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvcHl0aG9uMy1raXJrL3tweXRob24zLWtpcmtfNC4xLjAuYmIgPT4g
cHl0aG9uMy1raXJrXzQuMi4wLmJifSAoODUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9weXRob24zLWtpcmsvcHl0aG9uMy1raXJrXzQuMS4wLmJiIGIvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL3B5dGhvbjMta2lyay9weXRob24zLWtpcmtfNC4yLjAuYmIKc2ltaWxhcml0eSBp
bmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3B5dGhvbjMta2lyay9w
eXRob24zLWtpcmtfNC4xLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9weXRo
b24zLWtpcmsvcHl0aG9uMy1raXJrXzQuMi4wLmJiCmluZGV4IGY5YjQ3OGNhOGQuLmQ2MTI4Mjky
NTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9weXRob24zLWtpcmsvcHl0aG9u
My1raXJrXzQuMS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9weXRob24zLWtpcmsv
cHl0aG9uMy1raXJrXzQuMi4wLmJiCkBAIC03LDcgKzcsNyBAQCBTRUNUSU9OID0gImNvbnNvbGUv
dXRpbHMiCiBMSUNFTlNFID0gIkdQTC0yLjAtb25seSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0xJQ0VOU0U7bWQ1PTM5YmJhN2QyY2YwYmExMDM2ZjJhNmUyYmU1MmZlM2YwIgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiZGM0ZGM0ZmE4OTk0YjE0NTY1YTNkNGYzMWJiNzlkNmQyNzEwMmVj
YmJkNGZlYWVmNGViYzFlMTBlOWNiYWNlMyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5MjAwN2Y4
NDBhMmEwYWYzODdiNmYwZDg4ZjUxZjVjNzEwODUzMjM4ZmYzYmQ5ZDJiOTFhMzRmNzMxNzM5YzA2
IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogCi0tIAoyLjQ3
LjEKCg==

--===============3650295947839553257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk: FILELIST: directory renamed /usr/lib/python3.14/site-packages/kirk-4.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/kirk-4.2.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/kirk-4.1.0.dist-info -> /usr/lib/python3.14/site-packages/kirk-4.2.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-kirk (sysroot):
  /usr/lib/python3.14/site-packages/kirk-4.1.0.dist-info moved to /usr/lib/python3.14/site-packages/kirk-4.2.0.dist-info

--===============3650295947839553257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-kirk: SRC_URI changed from "https://files.pythonhosted.org/packages/source/k/kirk/kirk-4.1.0.tar.gz" to "https://files.pythonhosted.org/packages/source/k/kirk/kirk-4.2.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-kirk: PKGV changed from 4.1.0 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/python3-kirk: PV changed from "4.1.0" to "4.2.0"
packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk-dbg: PKGV changed from 4.1.0 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk-dbg: PV changed from "4.1.0" to "4.2.0"
packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk-dev: PKGV changed from 4.1.0 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk-dev: PV changed from "4.1.0" to "4.2.0"
packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk-doc: PKGV changed from 4.1.0 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk-doc: PV changed from "4.1.0" to "4.2.0"
packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk-locale: PKGV changed from 4.1.0 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk-locale: PV changed from "4.1.0" to "4.2.0"
packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk-src: PKGV changed from 4.1.0 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk-src: PV changed from "4.1.0" to "4.2.0"
packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk-staticdev: PKGV changed from 4.1.0 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk-staticdev: PV changed from "4.1.0" to "4.2.0"
packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk: PKGV changed from 4.1.0 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk: PKGSIZE changed from 665187 to 675811 (+2%)
packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk: PV changed from "4.1.0" to "4.2.0"
packages/x86-64-v3-poky-linux/python3-kirk/python3-kirk: FILELIST: directory renamed /usr/lib/python3.14/site-packages/kirk-4.1.0.dist-info -> /usr/lib/python3.14/site-packages/kirk-4.2.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/kirk-4.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/kirk-4.2.0.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-kirk (sysroot):
  /usr/lib/python3.14/site-packages/kirk-4.1.0.dist-info moved to /usr/lib/python3.14/site-packages/kirk-4.2.0.dist-info

--===============3650295947839553257==--

