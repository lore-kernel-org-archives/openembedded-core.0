Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6AA9CD12CC
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:29 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.44646.1711994601707058040
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=P3hM08vP;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Q67Mbdhq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018e9ad47e1c-eb3f8c75-8e25-4917-9f07-f1204b7be724-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8nEte/fzMvZY4hzcsSBqw2Iwix0e6LqvaqnKXOIEBUM=;
	b=P3hM08vPjrvfaFSlNEb7tm/v2yUzXPw1OFjcGTqgAvldQs+0USpsSS1ppvR9aw99
	a3tIv910iSYt6EUt1wN6O3QRklucswIC0v3krK7/GPtZqiLHaGyC8CVl0cB2sIhUVY/
	cXcxnoEoj5Q59PtiZueI8+PLOLZuStmnlGCu6688=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8nEte/fzMvZY4hzcsSBqw2Iwix0e6LqvaqnKXOIEBUM=;
	b=Q67Mbdhqd03waICpt9UIYAnR6i2SmahS7tZ+/jMuQKfheonjKplsyWIFKNTD/H2h
	OUB9M7fkMlixVRux+oaI8mMiGZ0sHw51MV0pqKIsATj6VCWIDswQDKH67HnTKR/ZN/R
	7nxar1nYUCkR3kFnjvuAhYBnsBOH09+7Sp6pCzik=
Content-Type: multipart/mixed; boundary="===============8234732430714093914=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cython: upgrading to 3.0.10 SUCCEEDED
Message-ID: <0101018e9ad47e1c-eb3f8c75-8e25-4917-9f07-f1204b7be724-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:20 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197720

--===============8234732430714093914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cython* to *3.0.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cython-upgrade-3.0.8-3.0.10.patch
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
From 8697924277bc53c299baf62c869b3a13f332fc70 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 07:52:16 +0000
Subject: [PATCH] python3-cython: upgrade 3.0.8 -> 3.0.10

---
 meta/recipes-devtools/python/python-cython.inc                  | 2 +-
 .../{python3-cython_3.0.8.bb => python3-cython_3.0.10.bb}       | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_3.0.8.bb => python3-cython_3.0.10.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index e54926ae6d..87a2e88a1a 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "8333423d8fd5765e7cceea3a9985dd1e0a5dfeb2734629e1a2ed2d6233d39de6"
+SRC_URI[sha256sum] = "dcc96739331fb854dcf503f94607576cfe8488066c61ca50dfd55836f132de99"
 UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 
 inherit pypi
diff --git a/meta/recipes-devtools/python/python3-cython_3.0.8.bb b/meta/recipes-devtools/python/python3-cython_3.0.10.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-cython_3.0.8.bb
rename to meta/recipes-devtools/python/python3-cython_3.0.10.bb
-- 
2.42.0


--===============8234732430714093914==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cython-upgrade-3.0.8-3.0.10.patch"

RnJvbSA4Njk3OTI0Mjc3YmM1M2MyOTliYWY2MmM4NjliM2ExM2YzMzJmYzcwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAwNzo1MjoxNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY3l0aG9uOiB1cGdyYWRlIDMuMC44IC0+IDMuMC4xMAoKLS0tCiBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1jeXRob24uaW5jICAgICAgICAgICAgICAgICAgfCAyICst
CiAuLi4ve3B5dGhvbjMtY3l0aG9uXzMuMC44LmJiID0+IHB5dGhvbjMtY3l0aG9uXzMuMC4xMC5i
Yn0gICAgICAgfCAwCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1jeXRob25f
My4wLjguYmIgPT4gcHl0aG9uMy1jeXRob25fMy4wLjEwLmJifSAoMTAwJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1jeXRob24uaW5jIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tY3l0aG9uLmluYwppbmRleCBlNTQ5MjZhZTZk
Li44N2EyZTg4YTFhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbi1jeXRob24uaW5jCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
LWN5dGhvbi5pbmMKQEAgLTksNyArOSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJ
Q0VOU0UudHh0O21kNT02MWMzZWU4OTYxNTc1ODYxZmE4NmM3ZTYyYmM5ZjY5YyIKIFBZUElfUEFD
S0FHRSA9ICJDeXRob24iCiBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICI4MzMzNDIzZDhmZDU3NjVlN2NjZWVhM2E5OTg1ZGQxZTBhNWRm
ZWIyNzM0NjI5ZTFhMmVkMmQ2MjMzZDM5ZGU2IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImRjYzk2
NzM5MzMxZmI4NTRkY2Y1MDNmOTQ2MDc1NzZjZmU4NDg4MDY2YzYxY2E1MGRmZDU1ODM2ZjEzMmRl
OTkiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJDeXRob24tKD9QPHB2ZXI+LiopXC50YXIiCiAK
IGluaGVyaXQgcHlwaQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWN5dGhvbl8zLjAuOC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1jeXRob25fMy4wLjEwLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uXzMuMC44LmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3l0aG9uXzMuMC4xMC5i
YgotLSAKMi40Mi4wCgo=

--===============8234732430714093914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.12/site-packages/Cython-3.0.10.dist-info was added
  /usr/lib/python3.12/site-packages/Cython-3.0.10.dist-info/COPYING.txt was added
  /usr/lib/python3.12/site-packages/Cython-3.0.10.dist-info/entry_points.txt was added
  /usr/lib/python3.12/site-packages/Cython-3.0.10.dist-info/LICENSE.txt was added
  /usr/lib/python3.12/site-packages/Cython-3.0.10.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/Cython-3.0.10.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/Cython-3.0.10.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/Cython-3.0.10.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/Cython-3.0.8.dist-info was removed
  /usr/lib/python3.12/site-packages/Cython-3.0.8.dist-info/COPYING.txt was removed
  /usr/lib/python3.12/site-packages/Cython-3.0.8.dist-info/entry_points.txt was removed
  /usr/lib/python3.12/site-packages/Cython-3.0.8.dist-info/LICENSE.txt was removed
  /usr/lib/python3.12/site-packages/Cython-3.0.8.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/Cython-3.0.8.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/Cython-3.0.8.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/Cython-3.0.8.dist-info/WHEEL was removed

--===============8234732430714093914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-cython: SRC_URI changed from "https://files.pythonhosted.org/packages/source/C/Cython/Cython-3.0.8.tar.gz;downloadfilename=Cython-3.0.8.tar.gz" to "https://files.pythonhosted.org/packages/source/C/Cython/Cython-3.0.10.tar.gz;downloadfilename=Cython-3.0.10.tar.gz"
packages/core2-64-poky-linux/python3-cython: PKGV changed from 3.0.8 [default] to 3.0.10 [default]
packages/core2-64-poky-linux/python3-cython: PV changed from "3.0.8" to "3.0.10"
packages/core2-64-poky-linux/python3-cython/python3-cython-dbg: PKGSIZE changed from 27665304 to 27773552 (+0%)
packages/core2-64-poky-linux/python3-cython/python3-cython-dbg: PKGV changed from 3.0.8 [default] to 3.0.10 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-dbg: PV changed from "3.0.8" to "3.0.10"
packages/core2-64-poky-linux/python3-cython/python3-cython-dev: PKGV changed from 3.0.8 [default] to 3.0.10 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-dev: PV changed from "3.0.8" to "3.0.10"
packages/core2-64-poky-linux/python3-cython/python3-cython-doc: PKGV changed from 3.0.8 [default] to 3.0.10 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-doc: PV changed from "3.0.8" to "3.0.10"
packages/core2-64-poky-linux/python3-cython/python3-cython-locale: PKGV changed from 3.0.8 [default] to 3.0.10 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-locale: PV changed from "3.0.8" to "3.0.10"
packages/core2-64-poky-linux/python3-cython/python3-cython-src: PKGSIZE changed from 22890639 to 22910290 (+0%)
packages/core2-64-poky-linux/python3-cython/python3-cython-src: PKGV changed from 3.0.8 [default] to 3.0.10 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-src: PV changed from "3.0.8" to "3.0.10"
packages/core2-64-poky-linux/python3-cython/python3-cython-staticdev: PKGV changed from 3.0.8 [default] to 3.0.10 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-staticdev: PV changed from "3.0.8" to "3.0.10"
packages/core2-64-poky-linux/python3-cython/python3-cython: PKGSIZE changed from 14562323 to 14579581 (+0%)
packages/core2-64-poky-linux/python3-cython/python3-cython: PKGV changed from 3.0.8 [default] to 3.0.10 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython: PV changed from "3.0.8" to "3.0.10"
Changes to packages/core2-64-poky-linux/python3-cython (sysroot):
  /usr/lib/python3.12/site-packages/Cython-3.0.10.dist-info was added
  /usr/lib/python3.12/site-packages/Cython-3.0.10.dist-info/COPYING.txt was added
  /usr/lib/python3.12/site-packages/Cython-3.0.10.dist-info/entry_points.txt was added
  /usr/lib/python3.12/site-packages/Cython-3.0.10.dist-info/LICENSE.txt was added
  /usr/lib/python3.12/site-packages/Cython-3.0.10.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/Cython-3.0.10.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/Cython-3.0.10.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/Cython-3.0.10.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/Cython-3.0.8.dist-info was removed
  /usr/lib/python3.12/site-packages/Cython-3.0.8.dist-info/COPYING.txt was removed
  /usr/lib/python3.12/site-packages/Cython-3.0.8.dist-info/entry_points.txt was removed
  /usr/lib/python3.12/site-packages/Cython-3.0.8.dist-info/LICENSE.txt was removed
  /usr/lib/python3.12/site-packages/Cython-3.0.8.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/Cython-3.0.8.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/Cython-3.0.8.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/Cython-3.0.8.dist-info/WHEEL was removed

--===============8234732430714093914==--

