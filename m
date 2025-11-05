Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC977CCFA19
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:34 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2358.1762384582025820205
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=d3zaDvu4;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=gNGSQ395;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019a564e9f72-5140f573-1316-45fb-bdc7-691b9807cb04-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384584;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9lCzjXYquiIcyhydGglCjFBYmQr/AA4Qr7bgc5jXmkY=;
	b=d3zaDvu4FcHz8Vvwf5tLjmblh7KMG6AMFK+6CTZGcoOTBQ7Yf3HBIxBmdrr0hApP
	kAWEgPMgFM7ZeKpJX1EX2yyCjmkuHDwk0MK4dnS4wTZpj93ZI2WYWJw88ooGDJ33KEb
	4dTbvbu886ROXjO3hk1vc1x7sUYsx1Y9SSfvDHbs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384584;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9lCzjXYquiIcyhydGglCjFBYmQr/AA4Qr7bgc5jXmkY=;
	b=gNGSQ395ha+NQPifryrkc6bLdkkW8XKYWQ4YGQ6k0Jnrnh8jOeng52ChXtPZfSyi
	VrCRAfSZWOqRpEYDEAfLDgkJ22WPFouW6IcSkDpSNt4Yl+TyhXlsmIffaOAYyT1biK6
	E1PmKVSkmes44Ub2oJPETlUDIyLk59OmrCGk4Gd4=
Content-Type: multipart/mixed; boundary="===============1485443034369032469=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-markdown: upgrading to 3.10 SUCCEEDED
Message-ID: <0101019a564e9f72-5140f573-1316-45fb-bdc7-691b9807cb04-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225829

--===============1485443034369032469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-markdown* to *3.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-markdown-upgrade-3.9-3.10.patch
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
From c62583e6a37bd2fb75fe6d18bd60c3a2db1633de Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 17:03:39 +0000
Subject: [PATCH] python3-markdown: upgrade 3.9 -> 3.10

---
 .../{python3-markdown_3.9.bb => python3-markdown_3.10.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markdown_3.9.bb => python3-markdown_3.10.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.9.bb b/meta/recipes-devtools/python/python3-markdown_3.10.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-markdown_3.9.bb
rename to meta/recipes-devtools/python/python3-markdown_3.10.bb
index 67375e1321..5be1576d20 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.9.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.10.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ec58cdf7cfed06a21f7a9362627a5480"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "d2900fe1782bd33bdbbd56859defef70c2e78fc46668f8eb9df3128138f2cb6a"
+SRC_URI[sha256sum] = "37062d4f2aa4b2b6b32aefb80faa300f82cc790cb949a35b8caede34f2b68c0e"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.1


--===============1485443034369032469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.13/site-packages/markdown-3.10.dist-info was added
  /usr/lib/python3.13/site-packages/markdown-3.10.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/markdown-3.10.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/markdown-3.10.dist-info/licenses/LICENSE.md was added
  /usr/lib/python3.13/site-packages/markdown-3.10.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/markdown-3.10.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/markdown-3.10.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/markdown-3.9.dist-info was removed
  /usr/lib/python3.13/site-packages/markdown-3.9.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/markdown-3.9.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/markdown-3.9.dist-info/licenses/LICENSE.md was removed
  /usr/lib/python3.13/site-packages/markdown-3.9.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/markdown-3.9.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/markdown-3.9.dist-info/WHEEL was removed

--===============1485443034369032469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-markdown: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/markdown/markdown-3.9.tar.gz;downloadfilename=markdown-3.9.tar.gz" to "https://files.pythonhosted.org/packages/source/m/markdown/markdown-3.10.tar.gz;downloadfilename=markdown-3.10.tar.gz"
packages/x86-64-v3-poky-linux/python3-markdown: PKGV changed from 3.9 [default] to 3.10 [default]
packages/x86-64-v3-poky-linux/python3-markdown: PV changed from "3.9" to "3.10"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-dbg: PKGV changed from 3.9 [default] to 3.10 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-dbg: PV changed from "3.9" to "3.10"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-dev: PKGV changed from 3.9 [default] to 3.10 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-dev: PV changed from "3.9" to "3.10"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-doc: PKGV changed from 3.9 [default] to 3.10 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-doc: PV changed from "3.9" to "3.10"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-locale: PKGV changed from 3.9 [default] to 3.10 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-locale: PV changed from "3.9" to "3.10"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-src: PKGV changed from 3.9 [default] to 3.10 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-src: PV changed from "3.9" to "3.10"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-staticdev: PKGV changed from 3.9 [default] to 3.10 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-staticdev: PV changed from "3.9" to "3.10"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: PKGV changed from 3.9 [default] to 3.10 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: PKGSIZE changed from 696874 to 698694 (+0%)
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: PV changed from "3.9" to "3.10"
Changes to packages/x86-64-v3-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.13/site-packages/markdown-3.10.dist-info was added
  /usr/lib/python3.13/site-packages/markdown-3.10.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/markdown-3.10.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/markdown-3.10.dist-info/licenses/LICENSE.md was added
  /usr/lib/python3.13/site-packages/markdown-3.10.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/markdown-3.10.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/markdown-3.10.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/markdown-3.9.dist-info was removed
  /usr/lib/python3.13/site-packages/markdown-3.9.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/markdown-3.9.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/markdown-3.9.dist-info/licenses/LICENSE.md was removed
  /usr/lib/python3.13/site-packages/markdown-3.9.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/markdown-3.9.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/markdown-3.9.dist-info/WHEEL was removed

--===============1485443034369032469==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-markdown-upgrade-3.9-3.10.patch"

RnJvbSBjNjI1ODNlNmEzN2JkMmZiNzVmZTZkMThiZDYwYzNhMmRiMTYzM2RlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxNzowMzozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbWFya2Rvd246IHVwZ3JhZGUgMy45IC0+IDMuMTAKCi0tLQogLi4uL3tweXRob24zLW1h
cmtkb3duXzMuOS5iYiA9PiBweXRob24zLW1hcmtkb3duXzMuMTAuYmJ9ICAgICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1tYXJrZG93bl8zLjkuYmIgPT4gcHl0
aG9uMy1tYXJrZG93bl8zLjEwLmJifSAoNzklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXJrZG93bl8zLjkuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFya2Rvd25fMy4xMC5iYgpzaW1pbGFyaXR5IGluZGV4IDc5
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFya2Rv
d25fMy45LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
bWFya2Rvd25fMy4xMC5iYgppbmRleCA2NzM3NWUxMzIxLi41YmUxNTc2ZDIwIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFya2Rvd25fMy45LmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXJrZG93bl8zLjEwLmJi
CkBAIC01LDcgKzUsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLm1kO21k
NT1lYzU4Y2RmN2NmZWQwNmEyMWY3YTkzNjI2MjdhNTQ4MCIKIAogaW5oZXJpdCBweXBpIHB5dGhv
bl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImQyOTAwZmUx
NzgyYmQzM2JkYmJkNTY4NTlkZWZlZjcwYzJlNzhmYzQ2NjY4ZjhlYjlkZjMxMjgxMzhmMmNiNmEi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzcwNjJkNGYyYWE0YjJiNmIzMmFlZmI4MGZhYTMwMGY4
MmNjNzkwY2I5NDlhMzViOGNhZWRlMzRmMmI2OGMwZSIKIAogQkJDTEFTU0VYVEVORCA9ICJuYXRp
dmUgbmF0aXZlc2RrIgogCi0tIAoyLjQ3LjEKCg==

--===============1485443034369032469==--

