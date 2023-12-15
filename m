Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDBF5C48289
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 14:17:52 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.63596.1702649862753690235
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 06:17:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BAqUqou4;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HUEjRSq3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018c6dd71c27-5661054d-5f89-4a30-be70-fa7f08d17380-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702649863;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eI2FiHuP26RK4TtASD+NcZHfSUNW5giRxs1E/3/Tzj8=;
	b=BAqUqou43jZ34Fmdm9xszfHfTowbuhxeesYJ5tK0VO6aWd0K0udIvr8CptSFvzso
	xXoyKXU2J8lnpHCr4CHIACnxX5uEv3YOcJH8rgCKkiHJ4EkZ+kYkn1QgoKurd5SBcpk
	pHlPjTgZkxd0X6Hy3khc1nCOrXiMS44S/KINet7Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702649863;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eI2FiHuP26RK4TtASD+NcZHfSUNW5giRxs1E/3/Tzj8=;
	b=HUEjRSq3L3oQaQTlIFKFlyy6GGj/K5OfJvKiZ05eu0lezbjDQt3AFleKDW2c9PEu
	83lZkbwCiPY+eJrlgf/85FBYs7YNMkZCkrmr3yHM7Mde1J4RfA1X2plSxgfpLP/mQtF
	GbezlMi8cq02Snb9wDFDNOEtE6kyjYcMOHg3MdpE=
Content-Type: multipart/mixed; boundary="===============2397865416704738416=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.20.0 SUCCEEDED
Message-ID: <0101018c6dd71c27-5661054d-5f89-4a30-be70-fa7f08d17380-000000@us-west-2.amazonses.com>
Date: Fri, 15 Dec 2023 14:17:43 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 14:17:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192463

--===============2397865416704738416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hatchling* to *1.20.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatchling-upgrade-1.18.0-1.20.0.patch
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
From d1eb21a56816de5838bb7501706631ae3983bd96 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Dec 2023 07:50:34 +0000
Subject: [PATCH] python3-hatchling: upgrade 1.18.0 -> 1.20.0

---
 ...{python3-hatchling_1.18.0.bb => python3-hatchling_1.20.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.18.0.bb => python3-hatchling_1.20.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.18.0.bb b/meta/recipes-devtools/python/python3-hatchling_1.20.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hatchling_1.18.0.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.20.0.bb
index c94e49dab3..6c1db9b801 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.18.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.20.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native python3-trove-classifiers-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "50e99c3110ce0afc3f7bdbadff1c71c17758e476731c27607940cfa6686489ca"
+SRC_URI[sha256sum] = "0e0893cbe3d5f9275fc0e5b629087fc23b17abd7065e4db0a310e0a0237bc945"
 
 do_compile:prepend() {
     export PYTHONPATH=src
-- 
2.42.0


--===============2397865416704738416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-hatchling: PV changed from "1.18.0" to "1.20.0"
packages/core2-64-poky-linux/python3-hatchling: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.18.0.tar.gz;downloadfilename=hatchling-1.18.0.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.20.0.tar.gz;downloadfilename=hatchling-1.20.0.tar.gz"
packages/core2-64-poky-linux/python3-hatchling: PKGV changed from 1.18.0 [default] to 1.20.0 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dbg: PV changed from "1.18.0" to "1.20.0"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dbg: PKGV changed from 1.18.0 [default] to 1.20.0 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dev: PV changed from "1.18.0" to "1.20.0"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dev: PKGV changed from 1.18.0 [default] to 1.20.0 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-doc: PV changed from "1.18.0" to "1.20.0"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-doc: PKGV changed from 1.18.0 [default] to 1.20.0 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-locale: PV changed from "1.18.0" to "1.20.0"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-locale: PKGV changed from 1.18.0 [default] to 1.20.0 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-src: PV changed from "1.18.0" to "1.20.0"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-src: PKGV changed from 1.18.0 [default] to 1.20.0 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-staticdev: PV changed from "1.18.0" to "1.20.0"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-staticdev: PKGV changed from 1.18.0 [default] to 1.20.0 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: PV changed from "1.18.0" to "1.20.0"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: PKGSIZE changed from 680784 to 680489 (-0%)
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: PKGV changed from 1.18.0 [default] to 1.20.0 [default]
Changes to packages/core2-64-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.11/site-packages/hatchling-1.18.0.dist-info moved to /usr/lib/python3.11/site-packages/hatchling-1.20.0.dist-info
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.11/site-packages/hatchling-1.18.0.dist-info moved to /usr/lib/python3.11/site-packages/hatchling-1.20.0.dist-info

--===============2397865416704738416==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatchling-upgrade-1.18.0-1.20.0.patch"

RnJvbSBkMWViMjFhNTY4MTZkZTU4MzhiYjc1MDE3MDY2MzFhZTM5ODNiZDk2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgRGVjIDIwMjMgMDc6NTA6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWhhdGNobGluZzogdXBncmFkZSAxLjE4LjAgLT4gMS4yMC4wCgotLS0KIC4uLntweXRo
b24zLWhhdGNobGluZ18xLjE4LjAuYmIgPT4gcHl0aG9uMy1oYXRjaGxpbmdfMS4yMC4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaGF0Y2hsaW5nXzEuMTgu
MC5iYiA9PiBweXRob24zLWhhdGNobGluZ18xLjIwLjAuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjE4LjAuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjAuMC5i
YgpzaW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMTguMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjIwLjAuYmIKaW5kZXggYzk0ZTQ5
ZGFiMy4uNmMxZGI5YjgwMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWhhdGNobGluZ18xLjE4LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjIwLjAuYmIKQEAgLTgsNyArOCw3IEBAIGluaGVy
aXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiBERVBFTkRTICs9ICJweXRob24zLXBsdWdneS1uYXRp
dmUgcHl0aG9uMy1wYXRoc3BlYy1uYXRpdmUgcHl0aG9uMy1wYWNrYWdpbmctbmF0aXZlIHB5dGhv
bjMtZWRpdGFibGVzLW5hdGl2ZSBweXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzLW5hdGl2ZSIKIERF
UEVORFM6cmVtb3ZlOmNsYXNzLW5hdGl2ZSA9ICJweXRob24zLWhhdGNobGluZy1uYXRpdmUiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1MGU5OWMzMTEwY2UwYWZjM2Y3YmRiYWRmZjFjNzFjMTc3
NThlNDc2NzMxYzI3NjA3OTQwY2ZhNjY4NjQ4OWNhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjBl
MDg5M2NiZTNkNWY5Mjc1ZmMwZTViNjI5MDg3ZmMyM2IxN2FiZDcwNjVlNGRiMGEzMTBlMGEwMjM3
YmM5NDUiCiAKIGRvX2NvbXBpbGU6cHJlcGVuZCgpIHsKICAgICBleHBvcnQgUFlUSE9OUEFUSD1z
cmMKLS0gCjIuNDIuMAoK

--===============2397865416704738416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.11/site-packages/hatchling-1.18.0.dist-info moved to /usr/lib/python3.11/site-packages/hatchling-1.20.0.dist-info
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.11/site-packages/hatchling-1.18.0.dist-info moved to /usr/lib/python3.11/site-packages/hatchling-1.20.0.dist-info

--===============2397865416704738416==--

