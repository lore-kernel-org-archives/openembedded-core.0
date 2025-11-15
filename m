Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1CD1CED247
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:52 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11933.1763224717426646307
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=oBl6uWkU;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=e/6J5g5K;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019a8862284d-a2a5af29-654a-4cf5-b497-69eb62464454-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224725;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HIeZgFeDT1QxpWbnA82zOL3t7EJTdnBrNGEwH0YAENs=;
	b=oBl6uWkUIhY85dCOQwxubwJBwccj+h78630/P80nYwUexZjpOeHabz9ESc3K6GxG
	xaWstrq9L47BL+GeJ/FTExetwWLhIBZ+O1oZFqMyHQ29i0INEe7zKe8FWNLpWpmtomf
	GpBowYSvJGfG2+HcQB2ShYliN4MGpGtyvJ8Ts3Xk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224725;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HIeZgFeDT1QxpWbnA82zOL3t7EJTdnBrNGEwH0YAENs=;
	b=e/6J5g5KFIvfS93BwwO84e4MxdhE1q+dChqBcrqEbUaTacOrhgHGXzUhq9mn1Vee
	G+OXiRiqNKk9lVklaPigjbThNaIoPMoAOuQlPoZU/oxVzEEW8ML/XhFonJJgi6W37mZ
	noztfcckoxCCAz4gdfvxhBMQ6uFzH4prHclRURts=
Content-Type: multipart/mixed; boundary="===============6144547470657157467=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-docutils: upgrading to 0.22.3 SUCCEEDED
Message-ID: <0101019a8862284d-a2a5af29-654a-4cf5-b497-69eb62464454-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226356

--===============6144547470657157467==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-docutils* to *0.22.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-docutils-upgrade-0.22-0.22.3.patch
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
From a1de695afa9ab2fca0f3c9f24ab80de7db8de850 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 10:15:06 +0000
Subject: [PATCH] python3-docutils: upgrade 0.22 -> 0.22.3

---
 .../{python3-docutils_0.22.bb => python3-docutils_0.22.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-docutils_0.22.bb => python3-docutils_0.22.3.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-docutils_0.22.bb b/meta/recipes-devtools/python/python3-docutils_0.22.3.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-docutils_0.22.bb
rename to meta/recipes-devtools/python/python3-docutils_0.22.3.bb
index 2dafa034fb..a89e9941ca 100644
--- a/meta/recipes-devtools/python/python3-docutils_0.22.bb
+++ b/meta/recipes-devtools/python/python3-docutils_0.22.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "CC0-1.0 & BSD-2-Clause & GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=ce467b04b35c7ac3429b6908fc8b318e"
 
-SRC_URI[sha256sum] = "ba9d57750e92331ebe7c08a1bbf7a7f8143b86c476acd51528b042216a6aad0f"
+SRC_URI[sha256sum] = "21486ae730e4ca9f622677b1412b879af1791efcfba517e4c6f60be543fc8cdd"
 
 inherit pypi python_flit_core
 
-- 
2.47.1


--===============6144547470657157467==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-docutils-upgrade-0.22-0.22.3.patch"

RnJvbSBhMWRlNjk1YWZhOWFiMmZjYTBmM2M5ZjI0YWI4MGRlN2RiOGRlODUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTA6MTU6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWRvY3V0aWxzOiB1cGdyYWRlIDAuMjIgLT4gMC4yMi4zCgotLS0KIC4uLi97cHl0aG9u
My1kb2N1dGlsc18wLjIyLmJiID0+IHB5dGhvbjMtZG9jdXRpbHNfMC4yMi4zLmJifSAgICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtZG9jdXRpbHNfMC4yMi5iYiA9
PiBweXRob24zLWRvY3V0aWxzXzAuMjIuMy5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZG9jdXRpbHNfMC4yMi5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kb2N1dGlsc18wLjIyLjMuYmIKc2ltaWxhcml0
eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWRvY3V0aWxzXzAuMjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1kb2N1dGlsc18wLjIyLjMuYmIKaW5kZXggMmRhZmEwMzRmYi4uYTg5ZTk5NDFj
YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWRvY3V0
aWxzXzAuMjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWRv
Y3V0aWxzXzAuMjIuMy5iYgpAQCAtNCw3ICs0LDcgQEAgU0VDVElPTiA9ICJkZXZlbC9weXRob24i
CiBMSUNFTlNFID0gIkNDMC0xLjAgJiBCU0QtMi1DbGF1c2UgJiBHUEwtMy4wLW9ubHkiCiBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HLnJzdDttZDU9Y2U0NjdiMDRiMzVjN2FjMzQy
OWI2OTA4ZmM4YjMxOGUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiYTlkNTc3NTBlOTIzMzFl
YmU3YzA4YTFiYmY3YTdmODE0M2I4NmM0NzZhY2Q1MTUyOGIwNDIyMTZhNmFhZDBmIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjIxNDg2YWU3MzBlNGNhOWY2MjI2NzdiMTQxMmI4NzlhZjE3OTFlZmNm
YmE1MTdlNGM2ZjYwYmU1NDNmYzhjZGQiCiAKIGluaGVyaXQgcHlwaSBweXRob25fZmxpdF9jb3Jl
CiAKLS0gCjIuNDcuMQoK

--===============6144547470657157467==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-docutils: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/docutils/docutils-0.22.tar.gz;downloadfilename=docutils-0.22.tar.gz" to "https://files.pythonhosted.org/packages/source/d/docutils/docutils-0.22.3.tar.gz;downloadfilename=docutils-0.22.3.tar.gz"
packages/x86-64-v3-poky-linux/python3-docutils: PKGV changed from 0.22 [default] to 0.22.3 [default]
packages/x86-64-v3-poky-linux/python3-docutils: PV changed from "0.22" to "0.22.3"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-dbg: PKGV changed from 0.22 [default] to 0.22.3 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-dbg: PV changed from "0.22" to "0.22.3"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-dev: PKGV changed from 0.22 [default] to 0.22.3 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-dev: PV changed from "0.22" to "0.22.3"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-doc: PKGV changed from 0.22 [default] to 0.22.3 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-doc: PV changed from "0.22" to "0.22.3"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-locale: PKGV changed from 0.22 [default] to 0.22.3 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-locale: PV changed from "0.22" to "0.22.3"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-src: PKGV changed from 0.22 [default] to 0.22.3 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-src: PV changed from "0.22" to "0.22.3"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-staticdev: PKGV changed from 0.22 [default] to 0.22.3 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-staticdev: PV changed from "0.22" to "0.22.3"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils: PKGV changed from 0.22 [default] to 0.22.3 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils: PKGSIZE changed from 4227190 to 4244793 (+0%)
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils: PV changed from "0.22" to "0.22.3"
Changes to packages/x86-64-v3-poky-linux/python3-docutils (sysroot):
  /usr/lib/python3.13/site-packages/docutils-0.22.3.dist-info was added
  /usr/lib/python3.13/site-packages/docutils-0.22.3.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/docutils-0.22.3.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/docutils-0.22.3.dist-info/licenses/COPYING.rst was added
  /usr/lib/python3.13/site-packages/docutils-0.22.3.dist-info/licenses/licenses was added
  /usr/lib/python3.13/site-packages/docutils-0.22.3.dist-info/licenses/licenses/BSD-0-Clause.rst was added
  /usr/lib/python3.13/site-packages/docutils-0.22.3.dist-info/licenses/licenses/BSD-2-Clause.rst was added
  /usr/lib/python3.13/site-packages/docutils-0.22.3.dist-info/licenses/licenses/gpl-3-0.txt was added
  /usr/lib/python3.13/site-packages/docutils-0.22.3.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/docutils-0.22.3.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/licenses/COPYING.rst was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/licenses/licenses was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/licenses/licenses/BSD-0-Clause.rst was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/licenses/licenses/BSD-2-Clause.rst was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/licenses/licenses/gpl-3-0.txt was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/WHEEL was removed

--===============6144547470657157467==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-docutils (sysroot):
  /usr/lib/python3.13/site-packages/docutils-0.22.3.dist-info was added
  /usr/lib/python3.13/site-packages/docutils-0.22.3.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/docutils-0.22.3.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/docutils-0.22.3.dist-info/licenses/COPYING.rst was added
  /usr/lib/python3.13/site-packages/docutils-0.22.3.dist-info/licenses/licenses was added
  /usr/lib/python3.13/site-packages/docutils-0.22.3.dist-info/licenses/licenses/BSD-0-Clause.rst was added
  /usr/lib/python3.13/site-packages/docutils-0.22.3.dist-info/licenses/licenses/BSD-2-Clause.rst was added
  /usr/lib/python3.13/site-packages/docutils-0.22.3.dist-info/licenses/licenses/gpl-3-0.txt was added
  /usr/lib/python3.13/site-packages/docutils-0.22.3.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/docutils-0.22.3.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/licenses/COPYING.rst was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/licenses/licenses was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/licenses/licenses/BSD-0-Clause.rst was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/licenses/licenses/BSD-2-Clause.rst was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/licenses/licenses/gpl-3-0.txt was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/docutils-0.22.dist-info/WHEEL was removed

--===============6144547470657157467==--

