Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3556DCC6B24
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 05:20:37 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6836.1791955227157632158
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 22:20:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SZW2rMdj;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=C0I8gwVP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a138dacdfe-9e4388ca-b439-4e66-a21e-40148fecf605-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791955226;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GtIAE2lO+hfYRor0wVCZ/zfUjAxdBsJxQxiKiB3U86U=;
	b=SZW2rMdjHWGAaX0esC2CcIByBUdTuZq9aOjUm7dSLCyj60ToWBCFGsFxmwhMELrV
	KrWiuC6YZzLHDT4pPlAhiIvS3YQrZ5nl+sa16zQoggq8bnOGLga/G0w9KmFE4EoVJIP
	mNctid8hJTzyawv/9H/UJVrm4v7Ed40JZuRZuCWM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791955226;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GtIAE2lO+hfYRor0wVCZ/zfUjAxdBsJxQxiKiB3U86U=;
	b=C0I8gwVPX/gkNTnWOmBzjdvaq9Je8ViCc8GCE6+nnHos36yxXt7Z+b1wsIaGSo5A
	DFH2YTtBuBrTbPdhckcoArcgGRP6klPjwCdGIzfuDOBKAl7CyhkeEHZRAqEDMWFCUIP
	dz6c6NSD0o40kdHsMZ1J+UdZm5w0D/is9uJq7XlA=
Content-Type: multipart/mixed; boundary="===============2419942933800559571=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-markdown: upgrading to 3.11.1 SUCCEEDED
Message-ID: <010101a138dacdfe-9e4388ca-b439-4e66-a21e-40148fecf605-000000@us-west-2.amazonses.com>
Date: Wed, 14 Oct 2026 05:20:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.14-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 05:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247742

--===============2419942933800559571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-markdown* to *3.11.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-markdown-upgrade-3.11-3.11.1.patch
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
From 4e6a4164dd41e8f2320d65eabfef500904744af0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 14 Oct 2026 05:17:48 +0000
Subject: [PATCH] python3-markdown: upgrade 3.11 -> 3.11.1

## [3.11.1] - 2026-10-13
### Fixed
---
 .../{python3-markdown_3.11.bb => python3-markdown_3.11.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markdown_3.11.bb => python3-markdown_3.11.1.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.11.bb b/meta/recipes-devtools/python/python3-markdown_3.11.1.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-markdown_3.11.bb
rename to meta/recipes-devtools/python/python3-markdown_3.11.1.bb
index 709e7cdb70..3611675782 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.11.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.11.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ec58cdf7cfed06a21f7a9362627a5480"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "180224db6aed87ba9ce1f2781ebcd5826253de8ff637112090e24b84502bbf9f"
+SRC_URI[sha256sum] = "496f4f80f9ebd3395a04c8ec9595c40bbe8ec19e9c67d21fe071a1643e876606"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.1


--===============2419942933800559571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: FILELIST: directory renamed /usr/lib/python3.14/site-packages/markdown-3.11.dist-info -> /usr/lib/python3.14/site-packages/markdown-3.11.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/markdown-3.11.dist-info/licenses -> /usr/lib/python3.14/site-packages/markdown-3.11.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.14/site-packages/markdown-3.11.1.dist-info was added
  /usr/lib/python3.14/site-packages/markdown-3.11.1.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/markdown-3.11.1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/markdown-3.11.1.dist-info/licenses/LICENSE.md was added
  /usr/lib/python3.14/site-packages/markdown-3.11.1.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/markdown-3.11.1.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/markdown-3.11.1.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/markdown-3.11.dist-info was removed
  /usr/lib/python3.14/site-packages/markdown-3.11.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/markdown-3.11.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/markdown-3.11.dist-info/licenses/LICENSE.md was removed
  /usr/lib/python3.14/site-packages/markdown-3.11.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/markdown-3.11.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/markdown-3.11.dist-info/WHEEL was removed

--===============2419942933800559571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-markdown-changelog.txt"

## [3.11.1] - 2026-10-13
### Fixed

--===============2419942933800559571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-markdown: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/markdown/markdown-3.11.tar.gz" to "https://files.pythonhosted.org/packages/source/m/markdown/markdown-3.11.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-markdown: PV changed from "3.11" to "3.11.1"
packages/x86-64-v3-poky-linux/python3-markdown: PKGV changed from 3.11 [default] to 3.11.1 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-dbg: PV changed from "3.11" to "3.11.1"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-dbg: PKGV changed from 3.11 [default] to 3.11.1 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-dev: PV changed from "3.11" to "3.11.1"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-dev: PKGV changed from 3.11 [default] to 3.11.1 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-doc: PV changed from "3.11" to "3.11.1"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-doc: PKGV changed from 3.11 [default] to 3.11.1 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-locale: PV changed from "3.11" to "3.11.1"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-locale: PKGV changed from 3.11 [default] to 3.11.1 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-src: PV changed from "3.11" to "3.11.1"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-src: PKGV changed from 3.11 [default] to 3.11.1 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-staticdev: PV changed from "3.11" to "3.11.1"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-staticdev: PKGV changed from 3.11 [default] to 3.11.1 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: FILELIST: directory renamed /usr/lib/python3.14/site-packages/markdown-3.11.dist-info/licenses -> /usr/lib/python3.14/site-packages/markdown-3.11.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/markdown-3.11.dist-info -> /usr/lib/python3.14/site-packages/markdown-3.11.1.dist-info
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: PV changed from "3.11" to "3.11.1"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: PKGSIZE changed from 781669 to 824829 (+6%)
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: PKGV changed from 3.11 [default] to 3.11.1 [default]
Changes to packages/x86-64-v3-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.14/site-packages/markdown-3.11.1.dist-info was added
  /usr/lib/python3.14/site-packages/markdown-3.11.1.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/markdown-3.11.1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/markdown-3.11.1.dist-info/licenses/LICENSE.md was added
  /usr/lib/python3.14/site-packages/markdown-3.11.1.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/markdown-3.11.1.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/markdown-3.11.1.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/markdown-3.11.dist-info was removed
  /usr/lib/python3.14/site-packages/markdown-3.11.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/markdown-3.11.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/markdown-3.11.dist-info/licenses/LICENSE.md was removed
  /usr/lib/python3.14/site-packages/markdown-3.11.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/markdown-3.11.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/markdown-3.11.dist-info/WHEEL was removed

--===============2419942933800559571==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-markdown-upgrade-3.11-3.11.1.patch"

RnJvbSA0ZTZhNDE2NGRkNDFlOGYyMzIwZDY1ZWFiZmVmNTAwOTA0NzQ0YWYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTQgT2N0IDIwMjYgMDU6MTc6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1hcmtkb3duOiB1cGdyYWRlIDMuMTEgLT4gMy4xMS4xCgojIyBbMy4xMS4xXSAtIDIw
MjYtMTAtMTMKIyMjIEZpeGVkCi0tLQogLi4uL3tweXRob24zLW1hcmtkb3duXzMuMTEuYmIgPT4g
cHl0aG9uMy1tYXJrZG93bl8zLjExLjEuYmJ9ICAgIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi97cHl0aG9uMy1tYXJrZG93bl8zLjExLmJiID0+IHB5dGhvbjMtbWFya2Rvd25fMy4x
MS4xLmJifSAoNzklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1tYXJrZG93bl8zLjExLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLW1hcmtkb3duXzMuMTEuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDc5JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFya2Rvd25fMy4xMS5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hcmtkb3duXzMu
MTEuMS5iYgppbmRleCA3MDllN2NkYjcwLi4zNjExNjc1NzgyIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFya2Rvd25fMy4xMS5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFya2Rvd25fMy4xMS4xLmJiCkBAIC01
LDcgKzUsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLm1kO21kNT1lYzU4
Y2RmN2NmZWQwNmEyMWY3YTkzNjI2MjdhNTQ4MCIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1
cHRvb2xzX2J1aWxkX21ldGEKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjE4MDIyNGRiNmFlZDg3
YmE5Y2UxZjI3ODFlYmNkNTgyNjI1M2RlOGZmNjM3MTEyMDkwZTI0Yjg0NTAyYmJmOWYiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiNDk2ZjRmODBmOWViZDMzOTVhMDRjOGVjOTU5NWM0MGJiZThlYzE5
ZTljNjdkMjFmZTA3MWExNjQzZTg3NjYwNiIKIAogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0
aXZlc2RrIgogCi0tIAoyLjQ3LjEKCg==

--===============2419942933800559571==--

