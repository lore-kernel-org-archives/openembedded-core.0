Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DFE1C43602
	for <webhook@archiver.kernel.org>; Sat,  4 Jul 2026 05:19:56 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.106542.1783142386827123922
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 22:19:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=d8dayn9s;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DShetqY2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019f2b9188a5-75c7f624-6aec-43aa-97e2-caad1f2d8250-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783142385;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=drfYa5NsQUyZXK8UIfKyUd9IdgPC6YaJ9Veepl8rs+0=;
	b=d8dayn9syVql25awTSAozfLREB70gbQxYUArZNpdVs6G7rzD95kH1tXUiaDk2noR
	0ELumyB/TgpGK4gKQUr6DjgXk3hpgylhgm4Ghs8fLXeY212YWGhXCXzqip8uPFQ8/XC
	DxHm+gsqNp7t3sfQBREHOahD2kQNmNIZ+uwnM5fA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783142385;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=drfYa5NsQUyZXK8UIfKyUd9IdgPC6YaJ9Veepl8rs+0=;
	b=DShetqY2nYGpJ6BLnZz/j1dvgyJSRTmHE87DwTAGhoJT6Ga9Db33/8P02OXj7hMi
	Do6U7gD0lPZaUItiS/xpgULv2OwZ6MVuZKIN5mGZgRFcJwA17bw/X5gdAkt/Cw3Az2t
	mfVGeD/XXUkBRxpGDgca6eKpvda99YYqPWdtKuvU=
Content-Type: multipart/mixed; boundary="===============7728099534318293314=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyproject-metadata: upgrading to 0.12.1 SUCCEEDED
Message-ID: <0101019f2b9188a5-75c7f624-6aec-43aa-97e2-caad1f2d8250-000000@us-west-2.amazonses.com>
Date: Sat, 4 Jul 2026 05:19:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.04-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jul 2026 05:19:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240129

--===============7728099534318293314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyproject-metadata* to *0.12.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyproject-metadata-upgrade-0.11.0-0.12.1.patch
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
From 7796eed4cfd49d7e24d3481fd147b9bfe9b046dc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 4 Jul 2026 05:17:57 +0000
Subject: [PATCH] python3-pyproject-metadata: upgrade 0.11.0 -> 0.12.1

---
 ...-metadata_0.11.0.bb => python3-pyproject-metadata_0.12.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyproject-metadata_0.11.0.bb => python3-pyproject-metadata_0.12.1.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-pyproject-metadata_0.11.0.bb b/meta/recipes-devtools/python/python3-pyproject-metadata_0.12.1.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-pyproject-metadata_0.11.0.bb
rename to meta/recipes-devtools/python/python3-pyproject-metadata_0.12.1.bb
index 1e485df338..9918cae075 100644
--- a/meta/recipes-devtools/python/python3-pyproject-metadata_0.11.0.bb
+++ b/meta/recipes-devtools/python/python3-pyproject-metadata_0.12.1.bb
@@ -16,7 +16,7 @@ PYPI_PACKAGE = "pyproject_metadata"
 
 inherit pypi python_flit_core
 
-SRC_URI[sha256sum] = "c72fa49418bb7c5a10f25e050c418009898d1c051721d19f98a6fb6da59a66cf"
+SRC_URI[sha256sum] = "8809a4df6fe08279b39a8890669506ed3158e0617855ac9aff098fcbe772ae4c"
 
 RDEPENDS:${PN} += " \
     python3-logging \
-- 
2.47.1


--===============7728099534318293314==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyproject-metadata-upgrade-0.11.0-0.12.1.patch"

RnJvbSA3Nzk2ZWVkNGNmZDQ5ZDdlMjRkMzQ4MWZkMTQ3YjliZmU5YjA0NmRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNCBKdWwgMjAyNiAwNToxNzo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHlwcm9qZWN0LW1ldGFkYXRhOiB1cGdyYWRlIDAuMTEuMCAtPiAwLjEyLjEKCi0tLQog
Li4uLW1ldGFkYXRhXzAuMTEuMC5iYiA9PiBweXRob24zLXB5cHJvamVjdC1tZXRhZGF0YV8wLjEy
LjEuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weXByb2pl
Y3QtbWV0YWRhdGFfMC4xMS4wLmJiID0+IHB5dGhvbjMtcHlwcm9qZWN0LW1ldGFkYXRhXzAuMTIu
MS5iYn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtcHlwcm9qZWN0LW1ldGFkYXRhXzAuMTEuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1weXByb2plY3QtbWV0YWRhdGFfMC4xMi4xLmJiCnNpbWlsYXJpdHkg
aW5kZXggODklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1weXByb2plY3QtbWV0YWRhdGFfMC4xMS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlwcm9qZWN0LW1ldGFkYXRhXzAuMTIuMS5iYgppbmRleCAx
ZTQ4NWRmMzM4Li45OTE4Y2FlMDc1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcHlwcm9qZWN0LW1ldGFkYXRhXzAuMTEuMC5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlwcm9qZWN0LW1ldGFkYXRhXzAuMTIuMS5i
YgpAQCAtMTYsNyArMTYsNyBAQCBQWVBJX1BBQ0tBR0UgPSAicHlwcm9qZWN0X21ldGFkYXRhIgog
CiBpbmhlcml0IHB5cGkgcHl0aG9uX2ZsaXRfY29yZQogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
YzcyZmE0OTQxOGJiN2M1YTEwZjI1ZTA1MGM0MTgwMDk4OThkMWMwNTE3MjFkMTlmOThhNmZiNmRh
NTlhNjZjZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4ODA5YTRkZjZmZTA4Mjc5YjM5YTg4OTA2
Njk1MDZlZDMxNThlMDYxNzg1NWFjOWFmZjA5OGZjYmU3NzJhZTRjIgogCiBSREVQRU5EUzoke1BO
fSArPSAiIFwKICAgICBweXRob24zLWxvZ2dpbmcgXAotLSAKMi40Ny4xCgo=

--===============7728099534318293314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pyproject-metadata: PV changed from "0.11.0" to "0.12.1"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyproject_metadata/pyproject_metadata-0.11.0.tar.gz;downloadfilename=pyproject_metadata-0.11.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyproject_metadata/pyproject_metadata-0.12.1.tar.gz;downloadfilename=pyproject_metadata-0.12.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata: PKGV changed from 0.11.0 [default] to 0.12.1 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-dbg: PV changed from "0.11.0" to "0.12.1"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-dbg: PKGV changed from 0.11.0 [default] to 0.12.1 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-dev: PV changed from "0.11.0" to "0.12.1"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-dev: PKGV changed from 0.11.0 [default] to 0.12.1 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-doc: PV changed from "0.11.0" to "0.12.1"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-doc: PKGV changed from 0.11.0 [default] to 0.12.1 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-locale: PV changed from "0.11.0" to "0.12.1"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-locale: PKGV changed from 0.11.0 [default] to 0.12.1 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-src: PV changed from "0.11.0" to "0.12.1"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-src: PKGV changed from 0.11.0 [default] to 0.12.1 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-staticdev: PV changed from "0.11.0" to "0.12.1"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata-staticdev: PKGV changed from 0.11.0 [default] to 0.12.1 [default]
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata: PV changed from "0.11.0" to "0.12.1"
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata: PKGSIZE changed from 166428 to 176342 (+6%)
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pyproject_metadata-0.11.0.dist-info -> /usr/lib/python3.14/site-packages/pyproject_metadata-0.12.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/pyproject_metadata-0.11.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pyproject_metadata-0.12.1.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata: PKGV changed from 0.11.0 [default] to 0.12.1 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pyproject-metadata (sysroot):
  /usr/lib/python3.14/site-packages/pyproject_metadata-0.11.0.dist-info moved to /usr/lib/python3.14/site-packages/pyproject_metadata-0.12.1.dist-info

--===============7728099534318293314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pyproject-metadata/python3-pyproject-metadata: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pyproject_metadata-0.11.0.dist-info -> /usr/lib/python3.14/site-packages/pyproject_metadata-0.12.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/pyproject_metadata-0.11.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pyproject_metadata-0.12.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pyproject-metadata (sysroot):
  /usr/lib/python3.14/site-packages/pyproject_metadata-0.11.0.dist-info moved to /usr/lib/python3.14/site-packages/pyproject_metadata-0.12.1.dist-info

--===============7728099534318293314==--

