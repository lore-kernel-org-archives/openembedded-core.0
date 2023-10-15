Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33611C04FD0
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:24 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.102668.1697399114317080484
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=H5NiV8+S;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bQ/u/ws+;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.33, mailfrom: 0101018b34df081c-c87ae605-7c5d-440a-b37f-42b9debc4d4d-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oA5MH/7pV3A8leqN3FFUY+R0nm34kOyW1Xxbl9S08eY=;
	b=H5NiV8+Sbuo99t8ACOFIatfH85M74ZrjgKhc4tE8yMk5OPBjVvlYfwLKtnA2csc5
	vpKpCtVvbbx49O4RZVZl8o4uTaUVM/EXkMpZGqtYnxnOy5S2+ekyxHTd17bTBOJjb72
	fiTjNB91BvbpOepob2VIOIw8BMXtZIi08trNqCeA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oA5MH/7pV3A8leqN3FFUY+R0nm34kOyW1Xxbl9S08eY=;
	b=bQ/u/ws+HdiB3o4Aw4vDJUomIpAJ5n8WOwHWNls6scZUsDnJWL39J6GpdZgWrl4J
	B2ELA0dhzcJgw4DJX1kibEyLLRKWmvbHKLi+JZTqq9CP5lPsLgzH3nUFYteOD6awe8T
	4Bvz87EdHHzUnrUaNgUYIc0aRCo3Zb9spDqTqd8w=
Content-Type: multipart/mixed; boundary="===============4338739901905813597=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-markdown: upgrading to 3.5 SUCCEEDED
Message-ID: <0101018b34df081c-c87ae605-7c5d-440a-b37f-42b9debc4d4d-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189176

--===============4338739901905813597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-markdown* to *3.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-markdown-upgrade-3.4.4-3.5.patch
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
From 5187832f59f8235e1bd9fba62aa536fca72492aa Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 11:21:12 +0000
Subject: [PATCH] python3-markdown: upgrade 3.4.4 -> 3.5

---
 .../{python3-markdown_3.4.4.bb => python3-markdown_3.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markdown_3.4.4.bb => python3-markdown_3.5.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.4.4.bb b/meta/recipes-devtools/python/python3-markdown_3.5.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-markdown_3.4.4.bb
rename to meta/recipes-devtools/python/python3-markdown_3.5.bb
index 6a7e6f7c3e..1ad3f7828d 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.4.4.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.5.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed"
 inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "Markdown"
-SRC_URI[sha256sum] = "225c6123522495d4119a90b3a3ba31a1e87a70369e03f14799ea9c0d7183a3d6"
+SRC_URI[sha256sum] = "a807eb2e4778d9156c8f07876c6e4d50b5494c5665c4834f67b06459dfd877b3"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.39.2


--===============4338739901905813597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.11/site-packages/Markdown-3.5.dist-info was added
  /usr/lib/python3.11/site-packages/Markdown-3.5.dist-info/entry_points.txt was added
  /usr/lib/python3.11/site-packages/Markdown-3.5.dist-info/LICENSE.md was added
  /usr/lib/python3.11/site-packages/Markdown-3.5.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/Markdown-3.5.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/Markdown-3.5.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/Markdown-3.5.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/Markdown-3.4.4.dist-info was removed
  /usr/lib/python3.11/site-packages/Markdown-3.4.4.dist-info/entry_points.txt was removed
  /usr/lib/python3.11/site-packages/Markdown-3.4.4.dist-info/LICENSE.md was removed
  /usr/lib/python3.11/site-packages/Markdown-3.4.4.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/Markdown-3.4.4.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/Markdown-3.4.4.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/Markdown-3.4.4.dist-info/WHEEL was removed

--===============4338739901905813597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-markdown: PKGV changed from 3.4.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/python3-markdown: PV changed from "3.4.4" to "3.5"
packages/core2-32-poky-linux/python3-markdown: SRC_URI changed from "https://files.pythonhosted.org/packages/source/M/Markdown/Markdown-3.4.4.tar.gz;downloadfilename=Markdown-3.4.4.tar.gz" to "https://files.pythonhosted.org/packages/source/M/Markdown/Markdown-3.5.tar.gz;downloadfilename=Markdown-3.5.tar.gz"
packages/core2-32-poky-linux/python3-markdown/python3-markdown-dbg: PKGV changed from 3.4.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/python3-markdown/python3-markdown-dbg: PV changed from "3.4.4" to "3.5"
packages/core2-32-poky-linux/python3-markdown/python3-markdown-dev: PKGV changed from 3.4.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/python3-markdown/python3-markdown-dev: PV changed from "3.4.4" to "3.5"
packages/core2-32-poky-linux/python3-markdown/python3-markdown-doc: PKGV changed from 3.4.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/python3-markdown/python3-markdown-doc: PV changed from "3.4.4" to "3.5"
packages/core2-32-poky-linux/python3-markdown/python3-markdown-locale: PKGV changed from 3.4.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/python3-markdown/python3-markdown-locale: PV changed from "3.4.4" to "3.5"
packages/core2-32-poky-linux/python3-markdown/python3-markdown-src: PKGV changed from 3.4.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/python3-markdown/python3-markdown-src: PV changed from "3.4.4" to "3.5"
packages/core2-32-poky-linux/python3-markdown/python3-markdown-staticdev: PKGV changed from 3.4.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/python3-markdown/python3-markdown-staticdev: PV changed from "3.4.4" to "3.5"
packages/core2-32-poky-linux/python3-markdown/python3-markdown: PKGV changed from 3.4.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/python3-markdown/python3-markdown: PKGSIZE changed from 642553 to 681387 (+6%)
packages/core2-32-poky-linux/python3-markdown/python3-markdown: PV changed from "3.4.4" to "3.5"
Changes to packages/core2-32-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.11/site-packages/Markdown-3.5.dist-info was added
  /usr/lib/python3.11/site-packages/Markdown-3.5.dist-info/entry_points.txt was added
  /usr/lib/python3.11/site-packages/Markdown-3.5.dist-info/LICENSE.md was added
  /usr/lib/python3.11/site-packages/Markdown-3.5.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/Markdown-3.5.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/Markdown-3.5.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/Markdown-3.5.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/Markdown-3.4.4.dist-info was removed
  /usr/lib/python3.11/site-packages/Markdown-3.4.4.dist-info/entry_points.txt was removed
  /usr/lib/python3.11/site-packages/Markdown-3.4.4.dist-info/LICENSE.md was removed
  /usr/lib/python3.11/site-packages/Markdown-3.4.4.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/Markdown-3.4.4.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/Markdown-3.4.4.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/Markdown-3.4.4.dist-info/WHEEL was removed

--===============4338739901905813597==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-markdown-upgrade-3.4.4-3.5.patch"

RnJvbSA1MTg3ODMyZjU5ZjgyMzVlMWJkOWZiYTYyYWE1MzZmY2E3MjQ5MmFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMTE6MjE6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1hcmtkb3duOiB1cGdyYWRlIDMuNC40IC0+IDMuNQoKLS0tCiAuLi4ve3B5dGhvbjMt
bWFya2Rvd25fMy40LjQuYmIgPT4gcHl0aG9uMy1tYXJrZG93bl8zLjUuYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLW1hcmtkb3duXzMuNC40LmJiID0+
IHB5dGhvbjMtbWFya2Rvd25fMy41LmJifSAoODElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXJrZG93bl8zLjQuNC5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXJrZG93bl8zLjUuYmIKc2ltaWxhcml0eSBpbmRl
eCA4MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1h
cmtkb3duXzMuNC40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtbWFya2Rvd25fMy41LmJiCmluZGV4IDZhN2U2ZjdjM2UuLjFhZDNmNzgyOGQgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXJrZG93bl8zLjQu
NC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFya2Rvd25f
My41LmJiCkBAIC02LDcgKzYsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
Lm1kO21kNT03NDVhYWFkMGM2OWM2MDAzOWU2MzhiZmY5ZmZjNTllZCIKIGluaGVyaXQgcHlwaSBw
eXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhCiAKIFBZUElfUEFDS0FHRSA9ICJNYXJrZG93biIK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyMjVjNjEyMzUyMjQ5NWQ0MTE5YTkwYjNhM2JhMzFhMWU4
N2E3MDM2OWUwM2YxNDc5OWVhOWMwZDcxODNhM2Q2IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImE4
MDdlYjJlNDc3OGQ5MTU2YzhmMDc4NzZjNmU0ZDUwYjU0OTRjNTY2NWM0ODM0ZjY3YjA2NDU5ZGZk
ODc3YjMiCiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKIAotLSAKMi4zOS4y
Cgo=

--===============4338739901905813597==--

