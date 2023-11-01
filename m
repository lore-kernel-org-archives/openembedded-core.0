Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 561CBC18E0C
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:15 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.8489.1698848704544672362
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RbMDDZvc;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Yqw23otO;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.29, mailfrom: 0101018b8b460446-1d4fd3c3-8ae1-4751-a920-082cb679a0d5-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848703;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=O/uaJCZxhsR1w765dpQcnEQ+hZQ7oK+5Sl89lrLIjuk=;
	b=RbMDDZvcMgubfmSa80xQrQiSzXwnb2lHVhv8pOK1NSxqRaVg84Q0/YvE+sbdMbG4
	0g3UXkhbkPaSvjGgsALy4KNrFu+hrg/mmz1AzaF/kDhCXNuRuJ4eXdKrw4MnmImPm+o
	+EmOcTwzntdoHpdEmhDzfLnbDVKuEcqF+urcqvUo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848703;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=O/uaJCZxhsR1w765dpQcnEQ+hZQ7oK+5Sl89lrLIjuk=;
	b=Yqw23otOMRiw2oP6b+c2NQ+YhWYLhNkpeS87NZbfHttaosVj6Hb0yZd8qWd2npp1
	DV+HzStN78IUjZSW8tUIIOf2Ni/SYIDGQ3XHRiPVcW6INaM/CJP7tW3IM8XXmAvmkMN
	s4GHUmKBuHpIofTXu+QYWMKnjKTuDkGTijFmMFvU=
Content-Type: multipart/mixed; boundary="===============8879850458268329518=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-markdown: upgrading to 3.5.1 SUCCEEDED
Message-ID: <0101018b8b460446-1d4fd3c3-8ae1-4751-a920-082cb679a0d5-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189960

--===============8879850458268329518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-markdown* to *3.5.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-markdown-upgrade-3.5-3.5.1.patch
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
From bf5736788b485b7333e377245a5b44d5f8ae9090 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 08:54:32 +0000
Subject: [PATCH] python3-markdown: upgrade 3.5 -> 3.5.1

---
 .../{python3-markdown_3.5.bb => python3-markdown_3.5.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markdown_3.5.bb => python3-markdown_3.5.1.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.5.bb b/meta/recipes-devtools/python/python3-markdown_3.5.1.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-markdown_3.5.bb
rename to meta/recipes-devtools/python/python3-markdown_3.5.1.bb
index 1ad3f7828d..ccd8ccfc7e 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.5.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.5.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed"
 inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "Markdown"
-SRC_URI[sha256sum] = "a807eb2e4778d9156c8f07876c6e4d50b5494c5665c4834f67b06459dfd877b3"
+SRC_URI[sha256sum] = "b65d7beb248dc22f2e8a31fb706d93798093c308dc1aba295aedeb9d41a813bd"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.39.2


--===============8879850458268329518==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-markdown-upgrade-3.5-3.5.1.patch"

RnJvbSBiZjU3MzY3ODhiNDg1YjczMzNlMzc3MjQ1YTViNDRkNWY4YWU5MDkwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwODo1NDozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbWFya2Rvd246IHVwZ3JhZGUgMy41IC0+IDMuNS4xCgotLS0KIC4uLi97cHl0aG9uMy1t
YXJrZG93bl8zLjUuYmIgPT4gcHl0aG9uMy1tYXJrZG93bl8zLjUuMS5iYn0gICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtbWFya2Rvd25fMy41LmJiID0+IHB5
dGhvbjMtbWFya2Rvd25fMy41LjEuYmJ9ICg4MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hcmtkb3duXzMuNS5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXJrZG93bl8zLjUuMS5iYgpzaW1pbGFyaXR5IGluZGV4
IDgxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFy
a2Rvd25fMy41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtbWFya2Rvd25fMy41LjEuYmIKaW5kZXggMWFkM2Y3ODI4ZC4uY2NkOGNjZmM3ZSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hcmtkb3duXzMuNS5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFya2Rvd25fMy41
LjEuYmIKQEAgLTYsNyArNiw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0Uu
bWQ7bWQ1PTc0NWFhYWQwYzY5YzYwMDM5ZTYzOGJmZjlmZmM1OWVkIgogaW5oZXJpdCBweXBpIHB5
dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIAogUFlQSV9QQUNLQUdFID0gIk1hcmtkb3duIgot
U1JDX1VSSVtzaGEyNTZzdW1dID0gImE4MDdlYjJlNDc3OGQ5MTU2YzhmMDc4NzZjNmU0ZDUwYjU0
OTRjNTY2NWM0ODM0ZjY3YjA2NDU5ZGZkODc3YjMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjY1
ZDdiZWIyNDhkYzIyZjJlOGEzMWZiNzA2ZDkzNzk4MDkzYzMwOGRjMWFiYTI5NWFlZGViOWQ0MWE4
MTNiZCIKIAogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgogCi0tIAoyLjM5LjIK
Cg==

--===============8879850458268329518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-markdown: SRC_URI changed from "https://files.pythonhosted.org/packages/source/M/Markdown/Markdown-3.5.tar.gz;downloadfilename=Markdown-3.5.tar.gz" to "https://files.pythonhosted.org/packages/source/M/Markdown/Markdown-3.5.1.tar.gz;downloadfilename=Markdown-3.5.1.tar.gz"
packages/core2-64-poky-linux/python3-markdown: PKGV changed from 3.5 [default] to 3.5.1 [default]
packages/core2-64-poky-linux/python3-markdown: PV changed from "3.5" to "3.5.1"
packages/core2-64-poky-linux/python3-markdown/python3-markdown-dbg: PKGV changed from 3.5 [default] to 3.5.1 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown-dbg: PV changed from "3.5" to "3.5.1"
packages/core2-64-poky-linux/python3-markdown/python3-markdown-dev: PKGV changed from 3.5 [default] to 3.5.1 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown-dev: PV changed from "3.5" to "3.5.1"
packages/core2-64-poky-linux/python3-markdown/python3-markdown-doc: PKGV changed from 3.5 [default] to 3.5.1 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown-doc: PV changed from "3.5" to "3.5.1"
packages/core2-64-poky-linux/python3-markdown/python3-markdown-locale: PKGV changed from 3.5 [default] to 3.5.1 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown-locale: PV changed from "3.5" to "3.5.1"
packages/core2-64-poky-linux/python3-markdown/python3-markdown-src: PKGV changed from 3.5 [default] to 3.5.1 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown-src: PV changed from "3.5" to "3.5.1"
packages/core2-64-poky-linux/python3-markdown/python3-markdown-staticdev: PKGV changed from 3.5 [default] to 3.5.1 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown-staticdev: PV changed from "3.5" to "3.5.1"
packages/core2-64-poky-linux/python3-markdown/python3-markdown: PKGSIZE changed from 681387 to 685353 (+1%)
packages/core2-64-poky-linux/python3-markdown/python3-markdown: PKGV changed from 3.5 [default] to 3.5.1 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown: PV changed from "3.5" to "3.5.1"
Changes to packages/core2-64-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.11/site-packages/Markdown-3.5.1.dist-info was added
  /usr/lib/python3.11/site-packages/Markdown-3.5.1.dist-info/entry_points.txt was added
  /usr/lib/python3.11/site-packages/Markdown-3.5.1.dist-info/LICENSE.md was added
  /usr/lib/python3.11/site-packages/Markdown-3.5.1.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/Markdown-3.5.1.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/Markdown-3.5.1.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/Markdown-3.5.1.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/Markdown-3.5.dist-info was removed
  /usr/lib/python3.11/site-packages/Markdown-3.5.dist-info/entry_points.txt was removed
  /usr/lib/python3.11/site-packages/Markdown-3.5.dist-info/LICENSE.md was removed
  /usr/lib/python3.11/site-packages/Markdown-3.5.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/Markdown-3.5.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/Markdown-3.5.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/Markdown-3.5.dist-info/WHEEL was removed

--===============8879850458268329518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.11/site-packages/Markdown-3.5.1.dist-info was added
  /usr/lib/python3.11/site-packages/Markdown-3.5.1.dist-info/entry_points.txt was added
  /usr/lib/python3.11/site-packages/Markdown-3.5.1.dist-info/LICENSE.md was added
  /usr/lib/python3.11/site-packages/Markdown-3.5.1.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/Markdown-3.5.1.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/Markdown-3.5.1.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/Markdown-3.5.1.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/Markdown-3.5.dist-info was removed
  /usr/lib/python3.11/site-packages/Markdown-3.5.dist-info/entry_points.txt was removed
  /usr/lib/python3.11/site-packages/Markdown-3.5.dist-info/LICENSE.md was removed
  /usr/lib/python3.11/site-packages/Markdown-3.5.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/Markdown-3.5.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/Markdown-3.5.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/Markdown-3.5.dist-info/WHEEL was removed

--===============8879850458268329518==--

