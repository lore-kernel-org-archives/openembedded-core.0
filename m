Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6138DC83F0D
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:23 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.1417.1751386815398132227
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=aHCZuAY2;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Lf2lecyo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010197c6c9f992-14c9d898-caa7-4fc2-ad02-8ee8f090ddf1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386814;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lEcUr/U/ulndzGVUVFhhNXe+AMSGDwJk5guf5KjuWIE=;
	b=aHCZuAY2No/KAiDVD+DO/Pba82wKjpJD3KA3gQGCHghBFKaU1nPWQ9M4Jq8rROvj
	afKvp9dHGbMRUCJBu6r5epF0yNZqq3QPGGxebguZ27gWtitexEyWSv6mtPxQ1QO3P5l
	gbYSbmfp4j5haBsT/J7q/I0i/6DCZUv/nBkkW/sY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386814;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lEcUr/U/ulndzGVUVFhhNXe+AMSGDwJk5guf5KjuWIE=;
	b=Lf2lecyo70SO9j8hsmZEpJhppd7XlK+3i23NCyT5eS8Yi33Bchlb9XZnPNsJdinB
	67CMCh+g/0rlOKnn923vk22OV9YRoZNWSTURSEg79jeON074MIa+W83ghTbR3bH6IMC
	fke5lHVMmN6ApqIn+FZ3tvwmHl2FiL4/IN7w2b/8=
Content-Type: multipart/mixed; boundary="===============3994637083124119674=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-markdown: upgrading to 3.8.2 SUCCEEDED
Message-ID: <01010197c6c9f992-14c9d898-caa7-4fc2-ad02-8ee8f090ddf1-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219640

--===============3994637083124119674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-markdown* to *3.8.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-markdown-upgrade-3.8-3.8.2.patch
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
From 1e31583be42171c94e58d1d5f5d1f7b2738d9b2c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 09:27:42 +0000
Subject: [PATCH] python3-markdown: upgrade 3.8 -> 3.8.2

---
 .../{python3-markdown_3.8.bb => python3-markdown_3.8.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markdown_3.8.bb => python3-markdown_3.8.2.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.8.bb b/meta/recipes-devtools/python/python3-markdown_3.8.2.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-markdown_3.8.bb
rename to meta/recipes-devtools/python/python3-markdown_3.8.2.bb
index 09c2f3435b..d7ab34b915 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.8.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.8.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ec58cdf7cfed06a21f7a9362627a5480"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "7df81e63f0df5c4b24b7d156eb81e4690595239b7d70937d0409f1b0de319c6f"
+SRC_URI[sha256sum] = "247b9a70dd12e27f67431ce62523e675b866d254f900c4fe75ce3dda62237c45"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.1


--===============3994637083124119674==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-markdown-upgrade-3.8-3.8.2.patch"

RnJvbSAxZTMxNTgzYmU0MjE3MWM5NGU1OGQxZDVmNWQxZjdiMjczOGQ5YjJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAwOToyNzo0MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbWFya2Rvd246IHVwZ3JhZGUgMy44IC0+IDMuOC4yCgotLS0KIC4uLi97cHl0aG9uMy1t
YXJrZG93bl8zLjguYmIgPT4gcHl0aG9uMy1tYXJrZG93bl8zLjguMi5iYn0gICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtbWFya2Rvd25fMy44LmJiID0+IHB5
dGhvbjMtbWFya2Rvd25fMy44LjIuYmJ9ICg3OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hcmtkb3duXzMuOC5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXJrZG93bl8zLjguMi5iYgpzaW1pbGFyaXR5IGluZGV4
IDc5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFy
a2Rvd25fMy44LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtbWFya2Rvd25fMy44LjIuYmIKaW5kZXggMDljMmYzNDM1Yi4uZDdhYjM0YjkxNSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hcmtkb3duXzMuOC5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFya2Rvd25fMy44
LjIuYmIKQEAgLTUsNyArNSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0Uu
bWQ7bWQ1PWVjNThjZGY3Y2ZlZDA2YTIxZjdhOTM2MjYyN2E1NDgwIgogCiBpbmhlcml0IHB5cGkg
cHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiN2Rm
ODFlNjNmMGRmNWM0YjI0YjdkMTU2ZWI4MWU0NjkwNTk1MjM5YjdkNzA5MzdkMDQwOWYxYjBkZTMx
OWM2ZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyNDdiOWE3MGRkMTJlMjdmNjc0MzFjZTYyNTIz
ZTY3NWI4NjZkMjU0ZjkwMGM0ZmU3NWNlM2RkYTYyMjM3YzQ1IgogCiBCQkNMQVNTRVhURU5EID0g
Im5hdGl2ZSBuYXRpdmVzZGsiCiAKLS0gCjIuNDcuMQoK

--===============3994637083124119674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.13/site-packages/markdown-3.8.2.dist-info was added
  /usr/lib/python3.13/site-packages/markdown-3.8.2.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/markdown-3.8.2.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/markdown-3.8.2.dist-info/licenses/LICENSE.md was added
  /usr/lib/python3.13/site-packages/markdown-3.8.2.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/markdown-3.8.2.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/markdown-3.8.2.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/markdown-3.8.dist-info was removed
  /usr/lib/python3.13/site-packages/markdown-3.8.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/markdown-3.8.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/markdown-3.8.dist-info/licenses/LICENSE.md was removed
  /usr/lib/python3.13/site-packages/markdown-3.8.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/markdown-3.8.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/markdown-3.8.dist-info/WHEEL was removed

--===============3994637083124119674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-markdown: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/markdown/markdown-3.8.tar.gz;downloadfilename=markdown-3.8.tar.gz" to "https://files.pythonhosted.org/packages/source/m/markdown/markdown-3.8.2.tar.gz;downloadfilename=markdown-3.8.2.tar.gz"
packages/core2-64-poky-linux/python3-markdown: PV changed from "3.8" to "3.8.2"
packages/core2-64-poky-linux/python3-markdown: PKGV changed from 3.8 [default] to 3.8.2 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown-dbg: PV changed from "3.8" to "3.8.2"
packages/core2-64-poky-linux/python3-markdown/python3-markdown-dbg: PKGV changed from 3.8 [default] to 3.8.2 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown-dev: PV changed from "3.8" to "3.8.2"
packages/core2-64-poky-linux/python3-markdown/python3-markdown-dev: PKGV changed from 3.8 [default] to 3.8.2 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown-doc: PV changed from "3.8" to "3.8.2"
packages/core2-64-poky-linux/python3-markdown/python3-markdown-doc: PKGV changed from 3.8 [default] to 3.8.2 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown-locale: PV changed from "3.8" to "3.8.2"
packages/core2-64-poky-linux/python3-markdown/python3-markdown-locale: PKGV changed from 3.8 [default] to 3.8.2 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown-src: PV changed from "3.8" to "3.8.2"
packages/core2-64-poky-linux/python3-markdown/python3-markdown-src: PKGV changed from 3.8 [default] to 3.8.2 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown-staticdev: PV changed from "3.8" to "3.8.2"
packages/core2-64-poky-linux/python3-markdown/python3-markdown-staticdev: PKGV changed from 3.8 [default] to 3.8.2 [default]
packages/core2-64-poky-linux/python3-markdown/python3-markdown: PV changed from "3.8" to "3.8.2"
packages/core2-64-poky-linux/python3-markdown/python3-markdown: PKGSIZE changed from 685153 to 689140 (+1%)
packages/core2-64-poky-linux/python3-markdown/python3-markdown: PKGV changed from 3.8 [default] to 3.8.2 [default]
Changes to packages/core2-64-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.13/site-packages/markdown-3.8.2.dist-info was added
  /usr/lib/python3.13/site-packages/markdown-3.8.2.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/markdown-3.8.2.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/markdown-3.8.2.dist-info/licenses/LICENSE.md was added
  /usr/lib/python3.13/site-packages/markdown-3.8.2.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/markdown-3.8.2.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/markdown-3.8.2.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/markdown-3.8.dist-info was removed
  /usr/lib/python3.13/site-packages/markdown-3.8.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/markdown-3.8.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/markdown-3.8.dist-info/licenses/LICENSE.md was removed
  /usr/lib/python3.13/site-packages/markdown-3.8.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/markdown-3.8.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/markdown-3.8.dist-info/WHEEL was removed

--===============3994637083124119674==--

