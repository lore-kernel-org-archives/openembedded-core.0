Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB543C2BC81
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:11 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.13595.1713248039148729596
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZKhn/g41;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=uOzlA9yN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018ee58a6d9c-d45c6ff2-1bf6-4210-a5c5-2cd365d856ea-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CjWFOwVSVZwl/4F+DTKQGmmkZie7tTPviQslJF0BZ9g=;
	b=ZKhn/g412z1QxnKiBhrJgcOJcbpKTf7u5FBb18BAURrf3CZAsEb4rrFw5PuUY6IT
	uM+YVdWHp1aNQCLV3YMOwrtvwsqSEPJoTK6C/SWWwhqQsC5mpnRGSBmFI6YJ6QnZOOd
	mDyuTtzqe+2Ko8xZLC2U6zHHm0JHjsZBN7IOmAQk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CjWFOwVSVZwl/4F+DTKQGmmkZie7tTPviQslJF0BZ9g=;
	b=uOzlA9yNognQ6lUYTc8ogQtyXtEJSqYP9mxJFbBIiE7p7b3zptBz11OfAt8J9Mxn
	79LFXEwrJEEJGawdIa/ET77RrwMEXsleiBttH4cT1tmysF5Ls7R+URh5JPom9fm/LCO
	8JYDXG+q7rJHRUuVwYs1l4v+7/O36qMg3HnpQ7jo=
Content-Type: multipart/mixed; boundary="===============3193463525706589298=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cython: upgrading to 3.0.10 SUCCEEDED
Message-ID: <0101018ee58a6d9c-d45c6ff2-1bf6-4210-a5c5-2cd365d856ea-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198292

--===============3193463525706589298==
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
From 5c5e9bde489dfdf4b3edc51a46ff7ea8d66c47bd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 18:59:01 +0000
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


--===============3193463525706589298==
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

--===============3193463525706589298==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cython-upgrade-3.0.8-3.0.10.patch"

RnJvbSA1YzVlOWJkZTQ4OWRmZGY0YjNlZGM1MWE0NmZmN2VhOGQ2NmM0N2JkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMTg6NTk6MDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWN5dGhvbjogdXBncmFkZSAzLjAuOCAtPiAzLjAuMTAKCi0tLQogbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24tY3l0aG9uLmluYyAgICAgICAgICAgICAgICAgIHwgMiAr
LQogLi4uL3tweXRob24zLWN5dGhvbl8zLjAuOC5iYiA9PiBweXRob24zLWN5dGhvbl8zLjAuMTAu
YmJ9ICAgICAgIHwgMAogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtY3l0aG9u
XzMuMC44LmJiID0+IHB5dGhvbjMtY3l0aG9uXzMuMC4xMC5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tY3l0aG9uLmluYyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLWN5dGhvbi5pbmMKaW5kZXggZTU0OTI2YWU2
ZC4uODdhMmU4OGExYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24tY3l0aG9uLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bi1jeXRob24uaW5jCkBAIC05LDcgKzksNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFLnR4dDttZDU9NjFjM2VlODk2MTU3NTg2MWZhODZjN2U2MmJjOWY2OWMiCiBQWVBJX1BB
Q0tBR0UgPSAiQ3l0aG9uIgogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiODMzMzQyM2Q4ZmQ1NzY1ZTdjY2VlYTNhOTk4NWRkMWUwYTVk
ZmViMjczNDYyOWUxYTJlZDJkNjIzM2QzOWRlNiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkY2M5
NjczOTMzMWZiODU0ZGNmNTAzZjk0NjA3NTc2Y2ZlODQ4ODA2NmM2MWNhNTBkZmQ1NTgzNmYxMzJk
ZTk5IgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAiQ3l0aG9uLSg/UDxwdmVyPi4qKVwudGFyIgog
CiBpbmhlcml0IHB5cGkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1jeXRob25fMy4wLjguYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtY3l0aG9uXzMuMC4xMC5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbl8zLjAuOC5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWN5dGhvbl8zLjAuMTAu
YmIKLS0gCjIuNDIuMAoK

--===============3193463525706589298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-cython: PV changed from "3.0.8" to "3.0.10"
packages/core2-64-poky-linux/python3-cython: PKGV changed from 3.0.8 [default] to 3.0.10 [default]
packages/core2-64-poky-linux/python3-cython: SRC_URI changed from "https://files.pythonhosted.org/packages/source/C/Cython/Cython-3.0.8.tar.gz;downloadfilename=Cython-3.0.8.tar.gz" to "https://files.pythonhosted.org/packages/source/C/Cython/Cython-3.0.10.tar.gz;downloadfilename=Cython-3.0.10.tar.gz"
packages/core2-64-poky-linux/python3-cython/python3-cython-dbg: PV changed from "3.0.8" to "3.0.10"
packages/core2-64-poky-linux/python3-cython/python3-cython-dbg: PKGSIZE changed from 27518360 to 27625168 (+0%)
packages/core2-64-poky-linux/python3-cython/python3-cython-dbg: PKGV changed from 3.0.8 [default] to 3.0.10 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-dev: PV changed from "3.0.8" to "3.0.10"
packages/core2-64-poky-linux/python3-cython/python3-cython-dev: PKGV changed from 3.0.8 [default] to 3.0.10 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-doc: PV changed from "3.0.8" to "3.0.10"
packages/core2-64-poky-linux/python3-cython/python3-cython-doc: PKGV changed from 3.0.8 [default] to 3.0.10 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-locale: PV changed from "3.0.8" to "3.0.10"
packages/core2-64-poky-linux/python3-cython/python3-cython-locale: PKGV changed from 3.0.8 [default] to 3.0.10 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-src: PV changed from "3.0.8" to "3.0.10"
packages/core2-64-poky-linux/python3-cython/python3-cython-src: PKGSIZE changed from 22890639 to 22910290 (+0%)
packages/core2-64-poky-linux/python3-cython/python3-cython-src: PKGV changed from 3.0.8 [default] to 3.0.10 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython-staticdev: PV changed from "3.0.8" to "3.0.10"
packages/core2-64-poky-linux/python3-cython/python3-cython-staticdev: PKGV changed from 3.0.8 [default] to 3.0.10 [default]
packages/core2-64-poky-linux/python3-cython/python3-cython: PV changed from "3.0.8" to "3.0.10"
packages/core2-64-poky-linux/python3-cython/python3-cython: PKGSIZE changed from 14563051 to 14580309 (+0%)
packages/core2-64-poky-linux/python3-cython/python3-cython: PKGV changed from 3.0.8 [default] to 3.0.10 [default]
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

--===============3193463525706589298==--

