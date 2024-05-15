Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23FFAC3271F
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:26 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.1244.1715794338013170150
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=S7Fj7xlZ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=1cOd5S+J;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018f7d4fdec1-9b3ecfb6-dd3a-432d-948b-bf88e8ee04df-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NAlapbe3OeBcTanqmxaxILAoSbygOeseowQAPkaVghM=;
	b=S7Fj7xlZcIT7wZge7DZzOjTklqQjTtF9v/7ZIC6yIgGPumCTmZrV6jfkkzS5QcL+
	bXUqqHwQRHm8M0BUMR+tjDj4rKnFt/Cm/KbKaks+YLLBVNtMpyHiB7Fdg2I013pJSLX
	a4vB3hmU1YYj0eMPMbot8yoa2gnJUcxPeikrkSI8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NAlapbe3OeBcTanqmxaxILAoSbygOeseowQAPkaVghM=;
	b=1cOd5S+JoLcgz4dbhbqEevQmeWN95VenOOZiFt579Jwtk/gH/7c9Lk+CWOL6OVkL
	RygdOp/5BWoLAgVsyKAXhxpFcrqUtXSjRvMdUtN1L6Hlr0bdpQlosVf/Q9VuM/IFdcQ
	uxNQmlzvr5PMUGFQDq8rgnVF/y7nOwZt/istef3Y=
Content-Type: multipart/mixed; boundary="===============8943566434868604183=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.24.2 SUCCEEDED
Message-ID: <0101018f7d4fdec1-9b3ecfb6-dd3a-432d-948b-bf88e8ee04df-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199325

--===============8943566434868604183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hatchling* to *1.24.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatchling-upgrade-1.24.1-1.24.2.patch
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
From 0c305919eae860f35d7f33151b1f896ad61b81fc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 09:30:23 +0000
Subject: [PATCH] python3-hatchling: upgrade 1.24.1 -> 1.24.2

---
 ...{python3-hatchling_1.24.1.bb => python3-hatchling_1.24.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.24.1.bb => python3-hatchling_1.24.2.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.24.1.bb b/meta/recipes-devtools/python/python3-hatchling_1.24.2.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hatchling_1.24.1.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.24.2.bb
index fc8d953281..0ad545f448 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.24.1.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.24.2.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native python3-trove-classifiers-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "51f861891e98c4044eb455163a737e5d2328d7aa74890b182db2d80fee22a497"
+SRC_URI[sha256sum] = "41ddc27cdb25db9ef7b68bef075f829c84cb349aa1bff8240797d012510547b0"
 
 do_compile:prepend() {
     export PYTHONPATH=src
-- 
2.44.0


--===============8943566434868604183==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatchling-upgrade-1.24.1-1.24.2.patch"

RnJvbSAwYzMwNTkxOWVhZTg2MGYzNWQ3ZjMzMTUxYjFmODk2YWQ2MWI4MWZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMDk6MzA6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWhhdGNobGluZzogdXBncmFkZSAxLjI0LjEgLT4gMS4yNC4yCgotLS0KIC4uLntweXRo
b24zLWhhdGNobGluZ18xLjI0LjEuYmIgPT4gcHl0aG9uMy1oYXRjaGxpbmdfMS4yNC4yLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjQu
MS5iYiA9PiBweXRob24zLWhhdGNobGluZ18xLjI0LjIuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjI0LjEuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjQuMi5i
YgpzaW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjQuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjI0LjIuYmIKaW5kZXggZmM4ZDk1
MzI4MS4uMGFkNTQ1ZjQ0OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWhhdGNobGluZ18xLjI0LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjI0LjIuYmIKQEAgLTgsNyArOCw3IEBAIGluaGVy
aXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiBERVBFTkRTICs9ICJweXRob24zLXBsdWdneS1uYXRp
dmUgcHl0aG9uMy1wYXRoc3BlYy1uYXRpdmUgcHl0aG9uMy1wYWNrYWdpbmctbmF0aXZlIHB5dGhv
bjMtZWRpdGFibGVzLW5hdGl2ZSBweXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzLW5hdGl2ZSIKIERF
UEVORFM6cmVtb3ZlOmNsYXNzLW5hdGl2ZSA9ICJweXRob24zLWhhdGNobGluZy1uYXRpdmUiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1MWY4NjE4OTFlOThjNDA0NGViNDU1MTYzYTczN2U1ZDIz
MjhkN2FhNzQ4OTBiMTgyZGIyZDgwZmVlMjJhNDk3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQx
ZGRjMjdjZGIyNWRiOWVmN2I2OGJlZjA3NWY4MjljODRjYjM0OWFhMWJmZjgyNDA3OTdkMDEyNTEw
NTQ3YjAiCiAKIGRvX2NvbXBpbGU6cHJlcGVuZCgpIHsKICAgICBleHBvcnQgUFlUSE9OUEFUSD1z
cmMKLS0gCjIuNDQuMAoK

--===============8943566434868604183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-hatchling: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.24.1.tar.gz;downloadfilename=hatchling-1.24.1.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.24.2.tar.gz;downloadfilename=hatchling-1.24.2.tar.gz"
packages/core2-64-poky-linux/python3-hatchling: PKGV changed from 1.24.1 [default] to 1.24.2 [default]
packages/core2-64-poky-linux/python3-hatchling: PV changed from "1.24.1" to "1.24.2"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dbg: PKGV changed from 1.24.1 [default] to 1.24.2 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dbg: PV changed from "1.24.1" to "1.24.2"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dev: PKGV changed from 1.24.1 [default] to 1.24.2 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dev: PV changed from "1.24.1" to "1.24.2"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-doc: PKGV changed from 1.24.1 [default] to 1.24.2 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-doc: PV changed from "1.24.1" to "1.24.2"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-locale: PKGV changed from 1.24.1 [default] to 1.24.2 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-locale: PV changed from "1.24.1" to "1.24.2"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-src: PKGV changed from 1.24.1 [default] to 1.24.2 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-src: PV changed from "1.24.1" to "1.24.2"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-staticdev: PKGV changed from 1.24.1 [default] to 1.24.2 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-staticdev: PV changed from "1.24.1" to "1.24.2"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: PKGSIZE changed from 715154 to 715588 (+0%)
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: PKGV changed from 1.24.1 [default] to 1.24.2 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: PV changed from "1.24.1" to "1.24.2"
Changes to packages/core2-64-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.12/site-packages/hatchling-1.24.1.dist-info moved to /usr/lib/python3.12/site-packages/hatchling-1.24.2.dist-info
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.12/site-packages/hatchling-1.24.1.dist-info moved to /usr/lib/python3.12/site-packages/hatchling-1.24.2.dist-info

--===============8943566434868604183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.12/site-packages/hatchling-1.24.1.dist-info moved to /usr/lib/python3.12/site-packages/hatchling-1.24.2.dist-info
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.12/site-packages/hatchling-1.24.1.dist-info moved to /usr/lib/python3.12/site-packages/hatchling-1.24.2.dist-info

--===============8943566434868604183==--

