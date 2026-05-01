Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19ECBCD37AF
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:42 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15605.1777645529519892126
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=N6kHqKBL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=uGfErF5C;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019de3ee4b28-26e741b8-3785-4f35-953a-c445566b2be8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645538;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Fs1YAFPsOVU1WhDj+nG8y3cK9+E04iLJ6AJh6FeOtU4=;
	b=N6kHqKBLGf4MXAZyMe4Lyw/vPYp6zEuzXuw4KhnW4Q+IgbFd96LHt9vbW3LUCo1x
	nhlUyNAeFzladwHr3/sIq939acQYJmmilVE+HYMLt95KwHvsGp1gW5Furt7YHlA+23d
	/9Wt/RNnj8tYIGSJF2ASq8+yBwAH52u1JcGGg4bI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645538;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Fs1YAFPsOVU1WhDj+nG8y3cK9+E04iLJ6AJh6FeOtU4=;
	b=uGfErF5CZXL+eBBcHgiRMQJ8F6OJyr07wXzbLmzcZzzL34cyyufih3uqR9VnUA2r
	oXi3ZbHmJS1kTwbY9IeHWEOPvx/Fs5fLjV8FDXmQ4zyES0FQ/vRV5R1i97BCI+azZSb
	P+NSlvzWOrXK6lH+hftJot71IZe5tXdpIW6LVl2s=
Content-Type: multipart/mixed; boundary="===============1316356088529484030=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-certifi: upgrading to 2026.4.22 SUCCEEDED
Message-ID: <0101019de3ee4b28-26e741b8-3785-4f35-953a-c445566b2be8-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236229

--===============1316356088529484030==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-certifi* to *2026.4.22* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-certifi-upgrade-2026.2.25-2026.4.22.patch
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
From f124e5c23747ac23807c8ab234c5e04a0cae9165 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 08:07:25 +0000
Subject: [PATCH] python3-certifi: upgrade 2026.2.25 -> 2026.4.22

---
 ...ython3-certifi_2026.2.25.bb => python3-certifi_2026.4.22.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2026.2.25.bb => python3-certifi_2026.4.22.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb b/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2026.2.25.bb
rename to meta/recipes-devtools/python/python3-certifi_2026.4.22.bb
index 7034f7a6f1..990e37d801 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "e887ab5cee78ea814d3472169153c2d12cd43b14bd03329a39a9c6e2e80bfba7"
+SRC_URI[sha256sum] = "8d455352a37b71bf76a79caa83a3d6c25afee4a385d632127b6afb3963f1c580"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.1


--===============1316356088529484030==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-certifi-upgrade-2026.2.25-2026.4.22.patch"

RnJvbSBmMTI0ZTVjMjM3NDdhYzIzODA3YzhhYjIzNGM1ZTA0YTBjYWU5MTY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwODowNzoyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY2VydGlmaTogdXBncmFkZSAyMDI2LjIuMjUgLT4gMjAyNi40LjIyCgotLS0KIC4uLnl0
aG9uMy1jZXJ0aWZpXzIwMjYuMi4yNS5iYiA9PiBweXRob24zLWNlcnRpZmlfMjAyNi40LjIyLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtY2VydGlmaV8yMDI2
LjIuMjUuYmIgPT4gcHl0aG9uMy1jZXJ0aWZpXzIwMjYuNC4yMi5iYn0gKDg3JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDI2LjIu
MjUuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDI2
LjQuMjIuYmIKc2ltaWxhcml0eSBpbmRleCA4NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyNi4yLjI1LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDI2LjQuMjIuYmIKaW5k
ZXggNzAzNGY3YTZmMS4uOTkwZTM3ZDgwMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyNi4yLjI1LmJiCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjYuNC4yMi5iYgpAQCAtNyw3ICs3
LDcgQEAgSE9NRVBBR0UgPSAiIGh0dHA6Ly9jZXJ0aWZpLmlvLyIKIExJQ0VOU0UgPSAiSVNDIgog
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MTE2MThjYjZhOTc1OTQ4Njc5
Mjg2YjEyMTFiZDU3M2MiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJlODg3YWI1Y2VlNzhlYTgx
NGQzNDcyMTY5MTUzYzJkMTJjZDQzYjE0YmQwMzMyOWEzOWE5YzZlMmU4MGJmYmE3IgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjhkNDU1MzUyYTM3YjcxYmY3NmE3OWNhYTgzYTNkNmMyNWFmZWU0YTM4
NWQ2MzIxMjdiNmFmYjM5NjNmMWM1ODAiCiAKIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29s
c19idWlsZF9tZXRhCiAKLS0gCjIuNDcuMQoK

--===============1316356088529484030==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: FILELIST: directory renamed /usr/lib/python3.14/site-packages/certifi-2026.2.25.dist-info -> /usr/lib/python3.14/site-packages/certifi-2026.4.22.dist-info, directory renamed /usr/lib/python3.14/site-packages/certifi-2026.2.25.dist-info/licenses -> /usr/lib/python3.14/site-packages/certifi-2026.4.22.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: PKGSIZE changed from 283309 to 249509 (-12%)
Changes to packages/x86-64-v3-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.14/site-packages/certifi-2026.2.25.dist-info moved to /usr/lib/python3.14/site-packages/certifi-2026.4.22.dist-info
Changes to packages/x86_64-linux/python3-build-native (sysroot):
  /usr/lib/python3.14/site-packages/build-1.5.0.dist-info moved to /usr/lib/python3.14/site-packages/build-1.4.3.dist-info

--===============1316356088529484030==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-certifi: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2026.2.25.tar.gz;downloadfilename=certifi-2026.2.25.tar.gz" to "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2026.4.22.tar.gz;downloadfilename=certifi-2026.4.22.tar.gz"
packages/x86-64-v3-poky-linux/python3-certifi: PKGV changed from 2026.2.25 [default] to 2026.4.22 [default]
packages/x86-64-v3-poky-linux/python3-certifi: PV changed from "2026.2.25" to "2026.4.22"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dbg: PKGV changed from 2026.2.25 [default] to 2026.4.22 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dbg: PV changed from "2026.2.25" to "2026.4.22"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dev: PKGV changed from 2026.2.25 [default] to 2026.4.22 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-dev: PV changed from "2026.2.25" to "2026.4.22"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-doc: PKGV changed from 2026.2.25 [default] to 2026.4.22 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-doc: PV changed from "2026.2.25" to "2026.4.22"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-locale: PKGV changed from 2026.2.25 [default] to 2026.4.22 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-locale: PV changed from "2026.2.25" to "2026.4.22"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-src: PKGV changed from 2026.2.25 [default] to 2026.4.22 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-src: PV changed from "2026.2.25" to "2026.4.22"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-staticdev: PKGV changed from 2026.2.25 [default] to 2026.4.22 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi-staticdev: PV changed from "2026.2.25" to "2026.4.22"
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: FILELIST: directory renamed /usr/lib/python3.14/site-packages/certifi-2026.2.25.dist-info -> /usr/lib/python3.14/site-packages/certifi-2026.4.22.dist-info, directory renamed /usr/lib/python3.14/site-packages/certifi-2026.2.25.dist-info/licenses -> /usr/lib/python3.14/site-packages/certifi-2026.4.22.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: PKGV changed from 2026.2.25 [default] to 2026.4.22 [default]
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: PKGSIZE changed from 283309 to 249509 (-12%)
packages/x86-64-v3-poky-linux/python3-certifi/python3-certifi: PV changed from "2026.2.25" to "2026.4.22"
Changes to packages/x86-64-v3-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.14/site-packages/certifi-2026.2.25.dist-info moved to /usr/lib/python3.14/site-packages/certifi-2026.4.22.dist-info
Changes to packages/x86_64-linux/python3-build-native (sysroot):
  /usr/lib/python3.14/site-packages/build-1.5.0.dist-info moved to /usr/lib/python3.14/site-packages/build-1.4.3.dist-info

--===============1316356088529484030==--

