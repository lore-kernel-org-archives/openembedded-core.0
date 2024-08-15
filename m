Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED7BC5474E
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:04 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.131436.1723748335047085334
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=FkW4Ut7y;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=FZLsQkIG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019157683947-3e4d1fa8-8c1e-47e2-8942-330d50fec72a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yO9MV5lgRvhhmlJ8mgXlciFX/rH2iHECy5vJ2DPTg0w=;
	b=FkW4Ut7yW6xhiRlXuEGHqbACwS5lSLeMIMgF7hHxFnsZu7iwGrWYiTyGtOD2M2J9
	HT9tFevPP+bo8DKYFfnUhcQ5qcxRd4IZ6PIjE71PCf2hhl8KnbZea+Mphv50IlI0L7l
	YHvuuGJd9+5Pwj/FGmKJSTQtgs/m1AKn2BeRCnWQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yO9MV5lgRvhhmlJ8mgXlciFX/rH2iHECy5vJ2DPTg0w=;
	b=FZLsQkIGFQ2k23RXI0Q6agsp+zMUzXW62tO600xh9goUcO+uRcvlLgKDQl949XnZ
	s4ewsDX+Apg1BC61mIN2g1ppV5Ucb7WVyxucVMA8CNjMOmT7/UvUGsLdafrCowP+vVo
	VBE17BRuIhTQfITIUWJiOXKEEQwOSrn9SQYyWGug=
Content-Type: multipart/mixed; boundary="===============5376744597432482402=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-alabaster: upgrading to 1.0.0 SUCCEEDED
Message-ID: <0101019157683947-3e4d1fa8-8c1e-47e2-8942-330d50fec72a-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203401

--===============5376744597432482402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-alabaster* to *1.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-alabaster-upgrade-0.7.16-1.0.0.patch
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
From c28be0ad94267963d5dfea7f7b264f0d7622ca66 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 11:09:43 +0000
Subject: [PATCH] python3-alabaster: upgrade 0.7.16 -> 1.0.0

---
 .../{python3-alabaster_0.7.16.bb => python3-alabaster_1.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-alabaster_0.7.16.bb => python3-alabaster_1.0.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-alabaster_0.7.16.bb b/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-alabaster_0.7.16.bb
rename to meta/recipes-devtools/python/python3-alabaster_1.0.0.bb
index c61fce454f..40be6039eb 100644
--- a/meta/recipes-devtools/python/python3-alabaster_0.7.16.bb
+++ b/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=21860fdb805bf4e0bfaf94b566b747fa"
 
-SRC_URI[sha256sum] = "75a8b99c28a5dad50dd7f8ccdd447a121ddb3892da9e53d1ca5cca3106d58d65"
+SRC_URI[sha256sum] = "c00dca57bca26fa62a6d7d0a9fcce65f3e026e9bfe33e9c538fd3fbb2144fd9e"
 
 inherit python_flit_core pypi
 
-- 
2.44.0


--===============5376744597432482402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-alabaster/python3-alabaster: FILELIST: directory renamed /usr/lib/python3.12/site-packages/alabaster-0.7.16.dist-info -> /usr/lib/python3.12/site-packages/alabaster-1.0.0.dist-info, added "/usr/lib/python3.12/site-packages/alabaster/static/github-banner.svg"
Changes to packages/core2-64-poky-linux/python3-alabaster (sysroot):
  /usr/lib/python3.12/site-packages/alabaster-1.0.0.dist-info was added
  /usr/lib/python3.12/site-packages/alabaster-1.0.0.dist-info/entry_points.txt was added
  /usr/lib/python3.12/site-packages/alabaster-1.0.0.dist-info/LICENSE.rst was added
  /usr/lib/python3.12/site-packages/alabaster-1.0.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/alabaster-1.0.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/alabaster-1.0.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/alabaster/static/github-banner.svg was added
  /usr/lib/python3.12/site-packages/alabaster-0.7.16.dist-info was removed
  /usr/lib/python3.12/site-packages/alabaster-0.7.16.dist-info/entry_points.txt was removed
  /usr/lib/python3.12/site-packages/alabaster-0.7.16.dist-info/LICENSE.rst was removed
  /usr/lib/python3.12/site-packages/alabaster-0.7.16.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/alabaster-0.7.16.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/alabaster-0.7.16.dist-info/WHEEL was removed

--===============5376744597432482402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-alabaster: PKGV changed from 0.7.16 [default] to 1.0.0 [default]
packages/core2-64-poky-linux/python3-alabaster: PV changed from "0.7.16" to "1.0.0"
packages/core2-64-poky-linux/python3-alabaster: SRC_URI changed from "https://files.pythonhosted.org/packages/source/a/alabaster/alabaster-0.7.16.tar.gz;downloadfilename=alabaster-0.7.16.tar.gz" to "https://files.pythonhosted.org/packages/source/a/alabaster/alabaster-1.0.0.tar.gz;downloadfilename=alabaster-1.0.0.tar.gz"
packages/core2-64-poky-linux/python3-alabaster/python3-alabaster-dbg: PKGV changed from 0.7.16 [default] to 1.0.0 [default]
packages/core2-64-poky-linux/python3-alabaster/python3-alabaster-dbg: PV changed from "0.7.16" to "1.0.0"
packages/core2-64-poky-linux/python3-alabaster/python3-alabaster-dev: PKGV changed from 0.7.16 [default] to 1.0.0 [default]
packages/core2-64-poky-linux/python3-alabaster/python3-alabaster-dev: PV changed from "0.7.16" to "1.0.0"
packages/core2-64-poky-linux/python3-alabaster/python3-alabaster-doc: PKGV changed from 0.7.16 [default] to 1.0.0 [default]
packages/core2-64-poky-linux/python3-alabaster/python3-alabaster-doc: PV changed from "0.7.16" to "1.0.0"
packages/core2-64-poky-linux/python3-alabaster/python3-alabaster-locale: PKGV changed from 0.7.16 [default] to 1.0.0 [default]
packages/core2-64-poky-linux/python3-alabaster/python3-alabaster-locale: PV changed from "0.7.16" to "1.0.0"
packages/core2-64-poky-linux/python3-alabaster/python3-alabaster-src: PKGV changed from 0.7.16 [default] to 1.0.0 [default]
packages/core2-64-poky-linux/python3-alabaster/python3-alabaster-src: PV changed from "0.7.16" to "1.0.0"
packages/core2-64-poky-linux/python3-alabaster/python3-alabaster-staticdev: PKGV changed from 0.7.16 [default] to 1.0.0 [default]
packages/core2-64-poky-linux/python3-alabaster/python3-alabaster-staticdev: PV changed from "0.7.16" to "1.0.0"
packages/core2-64-poky-linux/python3-alabaster/python3-alabaster: PKGV changed from 0.7.16 [default] to 1.0.0 [default]
packages/core2-64-poky-linux/python3-alabaster/python3-alabaster: PV changed from "0.7.16" to "1.0.0"
packages/core2-64-poky-linux/python3-alabaster/python3-alabaster: PKGSIZE changed from 42751 to 43118 (+1%)
packages/core2-64-poky-linux/python3-alabaster/python3-alabaster: FILELIST: directory renamed /usr/lib/python3.12/site-packages/alabaster-0.7.16.dist-info -> /usr/lib/python3.12/site-packages/alabaster-1.0.0.dist-info, added "/usr/lib/python3.12/site-packages/alabaster/static/github-banner.svg"
Changes to packages/core2-64-poky-linux/python3-alabaster (sysroot):
  /usr/lib/python3.12/site-packages/alabaster-1.0.0.dist-info was added
  /usr/lib/python3.12/site-packages/alabaster-1.0.0.dist-info/entry_points.txt was added
  /usr/lib/python3.12/site-packages/alabaster-1.0.0.dist-info/LICENSE.rst was added
  /usr/lib/python3.12/site-packages/alabaster-1.0.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/alabaster-1.0.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/alabaster-1.0.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/alabaster/static/github-banner.svg was added
  /usr/lib/python3.12/site-packages/alabaster-0.7.16.dist-info was removed
  /usr/lib/python3.12/site-packages/alabaster-0.7.16.dist-info/entry_points.txt was removed
  /usr/lib/python3.12/site-packages/alabaster-0.7.16.dist-info/LICENSE.rst was removed
  /usr/lib/python3.12/site-packages/alabaster-0.7.16.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/alabaster-0.7.16.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/alabaster-0.7.16.dist-info/WHEEL was removed

--===============5376744597432482402==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-alabaster-upgrade-0.7.16-1.0.0.patch"

RnJvbSBjMjhiZTBhZDk0MjY3OTYzZDVkZmVhN2Y3YjI2NGYwZDc2MjJjYTY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTE6MDk6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWFsYWJhc3RlcjogdXBncmFkZSAwLjcuMTYgLT4gMS4wLjAKCi0tLQogLi4uL3tweXRo
b24zLWFsYWJhc3Rlcl8wLjcuMTYuYmIgPT4gcHl0aG9uMy1hbGFiYXN0ZXJfMS4wLjAuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1hbGFiYXN0ZXJfMC43LjE2
LmJiID0+IHB5dGhvbjMtYWxhYmFzdGVyXzEuMC4wLmJifSAoODIlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1hbGFiYXN0ZXJfMC43LjE2LmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWFsYWJhc3Rlcl8xLjAuMC5iYgpz
aW1pbGFyaXR5IGluZGV4IDgyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtYWxhYmFzdGVyXzAuNy4xNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWFsYWJhc3Rlcl8xLjAuMC5iYgppbmRleCBjNjFmY2U0NTRm
Li40MGJlNjAzOWViIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtYWxhYmFzdGVyXzAuNy4xNi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtYWxhYmFzdGVyXzEuMC4wLmJiCkBAIC01LDcgKzUsNyBAQCBTRUNUSU9OID0g
ImRldmVsL3B5dGhvbiIKIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vTElDRU5TRS5yc3Q7bWQ1PTIxODYwZmRiODA1YmY0ZTBiZmFmOTRiNTY2Yjc0
N2ZhIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzVhOGI5OWMyOGE1ZGFkNTBkZDdmOGNjZGQ0
NDdhMTIxZGRiMzg5MmRhOWU1M2QxY2E1Y2NhMzEwNmQ1OGQ2NSIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICJjMDBkY2E1N2JjYTI2ZmE2MmE2ZDdkMGE5ZmNjZTY1ZjNlMDI2ZTliZmUzM2U5YzUzOGZk
M2ZiYjIxNDRmZDllIgogCiBpbmhlcml0IHB5dGhvbl9mbGl0X2NvcmUgcHlwaQogCi0tIAoyLjQ0
LjAKCg==

--===============5376744597432482402==--

