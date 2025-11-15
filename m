Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE8B0CED243
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:52 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11928.1763224711617854114
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=AxxaumBI;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=S+hfoet9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019a88622893-5cea1c5b-16bd-418e-be6e-ff4192a0a4fd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224725;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HRbi2snleeXjXn2j94EzJayp1vE63UfiMneEWqRBxfw=;
	b=AxxaumBIo3ZgwhSfrP/Z/Qe7IvU8iV/d2plfuOrJfuW4qSLXjytiXnx7l1HQcVvi
	N54IVPwaCaOgN81R5nSgD3Bdrvl8ruY2gtqklZk+EXSl+DT9EwywHl0+XDs4+pmgGvb
	+Nq4SE8B2qUwVW4HVpidBTwrCeSOwFW+uBazlYtw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224725;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HRbi2snleeXjXn2j94EzJayp1vE63UfiMneEWqRBxfw=;
	b=S+hfoet9uE7vUcT+GVz8UG4tkimaCeiLdmqPA9R5C3E23Rwv54kwNqSnpNCr70Ey
	dIxjOhqRPoLW8KCjuxgLYniKEKz4OjKVcvafaNYNNBm7/Nr8ykJsoNPDfToS3LPvGu0
	1o4shfvt02Cb9O5bmZsSEI6EFeoFEtiliARdTLkQ=
Content-Type: multipart/mixed; boundary="===============7921546443572710585=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-markdown: upgrading to 3.10 SUCCEEDED
Message-ID: <0101019a88622893-5cea1c5b-16bd-418e-be6e-ff4192a0a4fd-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226357

--===============7921546443572710585==
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
From 11cde95c70d77573743e9c6527038a951008dd2f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 10:22:07 +0000
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


--===============7921546443572710585==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-markdown-upgrade-3.9-3.10.patch"

RnJvbSAxMWNkZTk1YzcwZDc3NTczNzQzZTljNjUyNzAzOGE5NTEwMDhkZDJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTA6MjI6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1hcmtkb3duOiB1cGdyYWRlIDMuOSAtPiAzLjEwCgotLS0KIC4uLi97cHl0aG9uMy1t
YXJrZG93bl8zLjkuYmIgPT4gcHl0aG9uMy1tYXJrZG93bl8zLjEwLmJifSAgICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtbWFya2Rvd25fMy45LmJiID0+IHB5
dGhvbjMtbWFya2Rvd25fMy4xMC5iYn0gKDc5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFya2Rvd25fMy45LmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLW1hcmtkb3duXzMuMTAuYmIKc2ltaWxhcml0eSBpbmRleCA3
OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hcmtk
b3duXzMuOS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LW1hcmtkb3duXzMuMTAuYmIKaW5kZXggNjczNzVlMTMyMS4uNWJlMTU3NmQyMCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hcmtkb3duXzMuOS5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFya2Rvd25fMy4xMC5i
YgpAQCAtNSw3ICs1LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5tZDtt
ZDU9ZWM1OGNkZjdjZmVkMDZhMjFmN2E5MzYyNjI3YTU0ODAiCiAKIGluaGVyaXQgcHlwaSBweXRo
b25fc2V0dXB0b29sc19idWlsZF9tZXRhCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkMjkwMGZl
MTc4MmJkMzNiZGJiZDU2ODU5ZGVmZWY3MGMyZTc4ZmM0NjY2OGY4ZWI5ZGYzMTI4MTM4ZjJjYjZh
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM3MDYyZDRmMmFhNGIyYjZiMzJhZWZiODBmYWEzMDBm
ODJjYzc5MGNiOTQ5YTM1YjhjYWVkZTM0ZjJiNjhjMGUiCiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0
aXZlIG5hdGl2ZXNkayIKIAotLSAKMi40Ny4xCgo=

--===============7921546443572710585==
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
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: PKGSIZE changed from 696874 to 698694 (+0%)
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: PKGV changed from 3.9 [default] to 3.10 [default]
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

--===============7921546443572710585==
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

--===============7921546443572710585==--

