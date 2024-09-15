Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B26BC3ABA6
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:22 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.115383.1726410839861918615
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=W16CNMUA;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=u6zD0R0l;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010191f61ad7c2-f3970b67-cadf-4cd3-a814-efbdd29bd647-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410840;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6fli7Ob7mJwFurkI7TbJZzexjbEpwK+S43+iQCzmfPE=;
	b=W16CNMUA6JdxWF503N0+7pD6SKusOhiCnaJf/ZElnVO7YcR5m2eB4OXWxzSNypxu
	U/TG/3cs3lK2NUSV9ObgbMgjZGw8eg6QNXowde9KV+dwh0+inOnaXTo1nYHB6trYNuL
	XhPUMlJy12p6Vaf9cipsSn6jaEdR+ZNKLc29PQwQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410840;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6fli7Ob7mJwFurkI7TbJZzexjbEpwK+S43+iQCzmfPE=;
	b=u6zD0R0lKGo4SpkI5nWqdesRvP7iiQSbDwnLK9aG23XyJTpWx1B77UFQCBqPEIjM
	idPNHkQhF/+hGNpam/KV5JBHk5WwzIdbAio0uONU85CTxi/+M9Bst/wwcBnc2zxM8kq
	o/vGu9U6o630U0sjxl4dJ3sCnmXbSUgqRvTtA9/A=
Content-Type: multipart/mixed; boundary="===============7427416644750270333=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-build: upgrading to 1.2.2 SUCCEEDED
Message-ID: <01010191f61ad7c2-f3970b67-cadf-4cd3-a814-efbdd29bd647-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:34:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204515

--===============7427416644750270333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-build* to *1.2.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-build-upgrade-1.2.1-1.2.2.patch
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
From 41241905ccd846f904af16eb2a99e2ce654e3c6c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Sep 2024 08:19:30 +0000
Subject: [PATCH] python3-build: upgrade 1.2.1 -> 1.2.2

---
 .../python/{python3-build_1.2.1.bb => python3-build_1.2.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-build_1.2.1.bb => python3-build_1.2.2.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-build_1.2.1.bb b/meta/recipes-devtools/python/python3-build_1.2.2.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-build_1.2.1.bb
rename to meta/recipes-devtools/python/python3-build_1.2.2.bb
index 0156861201..8f2ee92060 100644
--- a/meta/recipes-devtools/python/python3-build_1.2.1.bb
+++ b/meta/recipes-devtools/python/python3-build_1.2.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/build"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=310439af287b0fb4780b2ad6907c256c"
 
-SRC_URI[sha256sum] = "526263f4870c26f26c433545579475377b2b7588b6f1eac76a001e873ae3e19d"
+SRC_URI[sha256sum] = "119b2fb462adef986483438377a13b2f42064a2a3a4161f24a0cca698a07ac8c"
 
 inherit pypi python_flit_core
 
-- 
2.44.0


--===============7427416644750270333==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-build-upgrade-1.2.1-1.2.2.patch"

RnJvbSA0MTI0MTkwNWNjZDg0NmY5MDRhZjE2ZWIyYTk5ZTJjZTY1NGUzYzZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgU2VwIDIwMjQgMDg6MTk6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWJ1aWxkOiB1cGdyYWRlIDEuMi4xIC0+IDEuMi4yCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtYnVpbGRfMS4yLjEuYmIgPT4gcHl0aG9uMy1idWlsZF8xLjIuMi5iYn0gICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtYnVpbGRfMS4yLjEuYmIgPT4gcHl0
aG9uMy1idWlsZF8xLjIuMi5iYn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtYnVpbGRfMS4yLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtYnVpbGRfMS4yLjIuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJ1aWxkXzEuMi4x
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYnVpbGRf
MS4yLjIuYmIKaW5kZXggMDE1Njg2MTIwMS4uOGYyZWU5MjA2MCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJ1aWxkXzEuMi4xLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1idWlsZF8xLjIuMi5iYgpAQCAtMyw3ICsz
LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3B5cGEvYnVpbGQiCiBMSUNFTlNF
ID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTMxMDQzOWFm
Mjg3YjBmYjQ3ODBiMmFkNjkwN2MyNTZjIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTI2MjYz
ZjQ4NzBjMjZmMjZjNDMzNTQ1NTc5NDc1Mzc3YjJiNzU4OGI2ZjFlYWM3NmEwMDFlODczYWUzZTE5
ZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIxMTliMmZiNDYyYWRlZjk4NjQ4MzQzODM3N2ExM2Iy
ZjQyMDY0YTJhM2E0MTYxZjI0YTBjY2E2OThhMDdhYzhjIgogCiBpbmhlcml0IHB5cGkgcHl0aG9u
X2ZsaXRfY29yZQogCi0tIAoyLjQ0LjAKCg==

--===============7427416644750270333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-build (sysroot):
  /usr/lib/python3.12/site-packages/build-1.2.1.dist-info moved to /usr/lib/python3.12/site-packages/build-1.2.2.dist-info
Changes to packages/x86_64-linux/python3-build-native (sysroot):
  /usr/lib/python3.12/site-packages/build-1.2.1.dist-info moved to /usr/lib/python3.12/site-packages/build-1.2.2.dist-info

--===============7427416644750270333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/b/build/build-1.2.1.tar.gz;downloadfilename=build-1.2.1.tar.gz" to "https://files.pythonhosted.org/packages/source/b/build/build-1.2.2.tar.gz;downloadfilename=build-1.2.2.tar.gz"
packages/core2-64-poky-linux/python3-build: PV changed from "1.2.1" to "1.2.2"
packages/core2-64-poky-linux/python3-build: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/core2-64-poky-linux/python3-build/python3-build-dbg: PV changed from "1.2.1" to "1.2.2"
packages/core2-64-poky-linux/python3-build/python3-build-dbg: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/core2-64-poky-linux/python3-build/python3-build-dev: PV changed from "1.2.1" to "1.2.2"
packages/core2-64-poky-linux/python3-build/python3-build-dev: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/core2-64-poky-linux/python3-build/python3-build-doc: PV changed from "1.2.1" to "1.2.2"
packages/core2-64-poky-linux/python3-build/python3-build-doc: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/core2-64-poky-linux/python3-build/python3-build-locale: PV changed from "1.2.1" to "1.2.2"
packages/core2-64-poky-linux/python3-build/python3-build-locale: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/core2-64-poky-linux/python3-build/python3-build-src: PV changed from "1.2.1" to "1.2.2"
packages/core2-64-poky-linux/python3-build/python3-build-src: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/core2-64-poky-linux/python3-build/python3-build-staticdev: PV changed from "1.2.1" to "1.2.2"
packages/core2-64-poky-linux/python3-build/python3-build-staticdev: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/core2-64-poky-linux/python3-build/python3-build: PV changed from "1.2.1" to "1.2.2"
packages/core2-64-poky-linux/python3-build/python3-build: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/core2-64-poky-linux/python3-build/python3-build: PKGSIZE changed from 131319 to 134096 (+2%)
Changes to packages/core2-64-poky-linux/python3-build (sysroot):
  /usr/lib/python3.12/site-packages/build-1.2.1.dist-info moved to /usr/lib/python3.12/site-packages/build-1.2.2.dist-info
Changes to packages/x86_64-linux/python3-build-native (sysroot):
  /usr/lib/python3.12/site-packages/build-1.2.1.dist-info moved to /usr/lib/python3.12/site-packages/build-1.2.2.dist-info

--===============7427416644750270333==--

