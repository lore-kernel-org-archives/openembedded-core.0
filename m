Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B7AC3ABC3
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:44 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.1794.1746113620574514882
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Vck2Fw+J;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Y6FRoQtH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101968c7b680b-c4dd49cd-09f1-4e60-855c-c1bacdadd5de-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113620;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=idVyFoZKnMrGKJ0P7oJKqEbJ4AdSYSe6gM17enUTcHU=;
	b=Vck2Fw+JnyO122ppBmBMpixrDtEzI6T6Y0ksliQzD1alygKueQJt7rBp/9ZXeEig
	KrLBCkwgS38AJJHQEgoXGxeMNhz0S+gCh2+THEWhUpmAnMcjozOBT1bFPEdT3AwJayu
	ahkiYeqL3IGHiRSZyu2VQjAERqRwcpNzZ6pqHN/8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113620;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=idVyFoZKnMrGKJ0P7oJKqEbJ4AdSYSe6gM17enUTcHU=;
	b=Y6FRoQtHOyxc6udFlYhaWWN1g3qJvG/LG7OG9yKcaLyLnSRCAs0zY1w/0e4aR05t
	/+02RunqEverPHsuRnT8UkktoMnWmqQtPPLefjEVc6mJ93+7ZR+s+JyPiGQvgCoOT/U
	ww3D6rVn3tUgi4gd3h7UFlS5EP0Z7ako8YUCcp9g=
Content-Type: multipart/mixed; boundary="===============6682662503211892160=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-markdown: upgrading to 3.8 SUCCEEDED
Message-ID: <010101968c7b680b-c4dd49cd-09f1-4e60-855c-c1bacdadd5de-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215819

--===============6682662503211892160==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-markdown* to *3.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-markdown-upgrade-3.7-3.8.patch
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
From a46ff47c2631a4ab0cc40af3b54d171ae555fc6f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 09:04:10 +0000
Subject: [PATCH] python3-markdown: upgrade 3.7 -> 3.8

---
 .../python/{python3-markdown_3.7.bb => python3-markdown_3.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markdown_3.7.bb => python3-markdown_3.8.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.7.bb b/meta/recipes-devtools/python/python3-markdown_3.8.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-markdown_3.7.bb
rename to meta/recipes-devtools/python/python3-markdown_3.8.bb
index 6a2ab36494..09c2f3435b 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.7.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.8.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ec58cdf7cfed06a21f7a9362627a5480"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "2ae2471477cfd02dbbf038d5d9bc226d40def84b4fe2986e49b59b6b472bbed2"
+SRC_URI[sha256sum] = "7df81e63f0df5c4b24b7d156eb81e4690595239b7d70937d0409f1b0de319c6f"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.1


--===============6682662503211892160==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-markdown-upgrade-3.7-3.8.patch"

RnJvbSBhNDZmZjQ3YzI2MzFhNGFiMGNjNDBhZjNiNTRkMTcxYWU1NTVmYzZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAwOTowNDoxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbWFya2Rvd246IHVwZ3JhZGUgMy43IC0+IDMuOAoKLS0tCiAuLi4vcHl0aG9uL3tweXRo
b24zLW1hcmtkb3duXzMuNy5iYiA9PiBweXRob24zLW1hcmtkb3duXzMuOC5iYn0gfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLW1hcmtkb3duXzMuNy5iYiA9PiBweXRo
b24zLW1hcmtkb3duXzMuOC5iYn0gKDc5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFya2Rvd25fMy43LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLW1hcmtkb3duXzMuOC5iYgpzaW1pbGFyaXR5IGluZGV4IDc5JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFya2Rvd25f
My43LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFy
a2Rvd25fMy44LmJiCmluZGV4IDZhMmFiMzY0OTQuLjA5YzJmMzQzNWIgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXJrZG93bl8zLjcuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hcmtkb3duXzMuOC5iYgpAQCAt
NSw3ICs1LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5tZDttZDU9ZWM1
OGNkZjdjZmVkMDZhMjFmN2E5MzYyNjI3YTU0ODAiCiAKIGluaGVyaXQgcHlwaSBweXRob25fc2V0
dXB0b29sc19idWlsZF9tZXRhCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyYWUyNDcxNDc3Y2Zk
MDJkYmJmMDM4ZDVkOWJjMjI2ZDQwZGVmODRiNGZlMjk4NmU0OWI1OWI2YjQ3MmJiZWQyIgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjdkZjgxZTYzZjBkZjVjNGIyNGI3ZDE1NmViODFlNDY5MDU5NTIz
OWI3ZDcwOTM3ZDA0MDlmMWIwZGUzMTljNmYiCiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5h
dGl2ZXNkayIKIAotLSAKMi40Ny4xCgo=

--===============6682662503211892160==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-markdown: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/markdown/markdown-3.7.tar.gz;downloadfilename=markdown-3.7.tar.gz" to "https://files.pythonhosted.org/packages/source/m/markdown/markdown-3.8.tar.gz;downloadfilename=markdown-3.8.tar.gz"
packages/core2-64-poky-linux/python3-markdown: PV changed from "3.7" to "3.8"
packages/core2-64-poky-linux/python3-markdown: PKGV changed from 3.7 [default] to 3.8 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown-dbg: PV changed from "3.7" to "3.8"
packages/core2-64-poky-linux/python3-markdown/python3-markdown-dbg: PKGV changed from 3.7 [default] to 3.8 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown-dev: PV changed from "3.7" to "3.8"
packages/core2-64-poky-linux/python3-markdown/python3-markdown-dev: PKGV changed from 3.7 [default] to 3.8 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown-doc: PV changed from "3.7" to "3.8"
packages/core2-64-poky-linux/python3-markdown/python3-markdown-doc: PKGV changed from 3.7 [default] to 3.8 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown-locale: PV changed from "3.7" to "3.8"
packages/core2-64-poky-linux/python3-markdown/python3-markdown-locale: PKGV changed from 3.7 [default] to 3.8 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown-src: PV changed from "3.7" to "3.8"
packages/core2-64-poky-linux/python3-markdown/python3-markdown-src: PKGV changed from 3.7 [default] to 3.8 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown-staticdev: PV changed from "3.7" to "3.8"
packages/core2-64-poky-linux/python3-markdown/python3-markdown-staticdev: PKGV changed from 3.7 [default] to 3.8 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown: PV changed from "3.7" to "3.8"
packages/core2-64-poky-linux/python3-markdown/python3-markdown: PKGV changed from 3.7 [default] to 3.8 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown: PKGSIZE changed from 681360 to 685153 (+1%)
Changes to packages/core2-64-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.13/site-packages/markdown-3.7.dist-info moved to /usr/lib/python3.13/site-packages/markdown-3.8.dist-info

--===============6682662503211892160==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.13/site-packages/markdown-3.7.dist-info moved to /usr/lib/python3.13/site-packages/markdown-3.8.dist-info

--===============6682662503211892160==--

