Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0AB7C31D97
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:24 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.1273.1715794337765295571
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=DPHYQB77;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=GIhdFgD/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018f7d4fe0a5-7feb20a4-cac2-4147-8d0a-fc12037cbf74-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cTcdIPK0tZgbBA9yIFq5oOEE2jJ0L6mNoyqCpoMusn8=;
	b=DPHYQB77LzZtBjZI/0QGW9kQWM5K15wDcQeoYzCQ6Vk7Qq2kKtww1UKY36nHSBnA
	SsOgGPxsGhCzZT9rRh9DV0Bo5kWHbwbdbI9ENgmX/ZoFItKgo8dj+StwALsDZti3noD
	2mIIbP2HVZrZJP5moEbe4zvwoMrybWPvMp1qe+wo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cTcdIPK0tZgbBA9yIFq5oOEE2jJ0L6mNoyqCpoMusn8=;
	b=GIhdFgD/L7WhxJXjLuY1NeVNHs4r+cFWh8tNGw3Pdqg4OZzeMbNf/mfWOKZiopWC
	GAgDwvS9V/MbRJTuPlp79wGmwerFVF/T5n195iBjouRYMEKyyNU6Wc0zRAO46kuP3SL
	5plrspoJ1i6RHft0bA6H5FxT11DNDBsZAP6/Nv1A=
Content-Type: multipart/mixed; boundary="===============5446859961088589992=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-referencing: upgrading to 0.35.1 SUCCEEDED
Message-ID: <0101018f7d4fe0a5-7feb20a4-cac2-4147-8d0a-fc12037cbf74-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199331

--===============5446859961088589992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-referencing* to *0.35.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-referencing-upgrade-0.34.0-0.35.1.patch
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
From 853d1b7eaa4c8815fbfb9601b698547701580c07 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 10:07:02 +0000
Subject: [PATCH] python3-referencing: upgrade 0.34.0 -> 0.35.1

---
 ...hon3-referencing_0.34.0.bb => python3-referencing_0.35.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-referencing_0.34.0.bb => python3-referencing_0.35.1.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-referencing_0.34.0.bb b/meta/recipes-devtools/python/python3-referencing_0.35.1.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-referencing_0.34.0.bb
rename to meta/recipes-devtools/python/python3-referencing_0.35.1.bb
index 6fbd10d9cf..3e2a380607 100644
--- a/meta/recipes-devtools/python/python3-referencing_0.34.0.bb
+++ b/meta/recipes-devtools/python/python3-referencing_0.35.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/python-jsonschema/referencing"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=93eb9740964b59e9ba30281255b044e2"
 
-SRC_URI[sha256sum] = "5773bd84ef41799a5a8ca72dc34590c041eb01bf9aa02632b4a973fb0181a844"
+SRC_URI[sha256sum] = "25b42124a6c8b632a425174f24087783efb348a6f1e0008e63cd4466fedf703c"
 
 inherit pypi python_hatchling
 
-- 
2.44.0


--===============5446859961088589992==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-referencing-upgrade-0.34.0-0.35.1.patch"

RnJvbSA4NTNkMWI3ZWFhNGM4ODE1ZmJmYjk2MDFiNjk4NTQ3NzAxNTgwYzA3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMTA6MDc6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXJlZmVyZW5jaW5nOiB1cGdyYWRlIDAuMzQuMCAtPiAwLjM1LjEKCi0tLQogLi4uaG9u
My1yZWZlcmVuY2luZ18wLjM0LjAuYmIgPT4gcHl0aG9uMy1yZWZlcmVuY2luZ18wLjM1LjEuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1yZWZlcmVuY2luZ18w
LjM0LjAuYmIgPT4gcHl0aG9uMy1yZWZlcmVuY2luZ18wLjM1LjEuYmJ9ICg4MSUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJlZmVyZW5jaW5nXzAu
MzQuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1yZWZlcmVuY2lu
Z18wLjM1LjEuYmIKc2ltaWxhcml0eSBpbmRleCA4MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJlZmVyZW5jaW5nXzAuMzQuMC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJlZmVyZW5jaW5nXzAuMzUuMS5i
YgppbmRleCA2ZmJkMTBkOWNmLi4zZTJhMzgwNjA3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcmVmZXJlbmNpbmdfMC4zNC4wLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1yZWZlcmVuY2luZ18wLjM1LjEuYmIKQEAg
LTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9weXRob24tanNvbnNj
aGVtYS9yZWZlcmVuY2luZyIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9OTNlYjk3NDA5NjRiNTllOWJhMzAyODEyNTViMDQ0ZTIiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICI1NzczYmQ4NGVmNDE3OTlhNWE4Y2E3MmRjMzQ1OTBjMDQxZWIw
MWJmOWFhMDI2MzJiNGE5NzNmYjAxODFhODQ0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI1YjQy
MTI0YTZjOGI2MzJhNDI1MTc0ZjI0MDg3NzgzZWZiMzQ4YTZmMWUwMDA4ZTYzY2Q0NDY2ZmVkZjcw
M2MiCiAKIGluaGVyaXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiAKLS0gCjIuNDQuMAoK

--===============5446859961088589992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-referencing: PKGV changed from 0.34.0 [default] to 0.35.1 [default]
packages/core2-64-poky-linux/python3-referencing: PV changed from "0.34.0" to "0.35.1"
packages/core2-64-poky-linux/python3-referencing: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/referencing/referencing-0.34.0.tar.gz;downloadfilename=referencing-0.34.0.tar.gz" to "https://files.pythonhosted.org/packages/source/r/referencing/referencing-0.35.1.tar.gz;downloadfilename=referencing-0.35.1.tar.gz"
packages/core2-64-poky-linux/python3-referencing/python3-referencing-dbg: PKGV changed from 0.34.0 [default] to 0.35.1 [default]
packages/core2-64-poky-linux/python3-referencing/python3-referencing-dbg: PV changed from "0.34.0" to "0.35.1"
packages/core2-64-poky-linux/python3-referencing/python3-referencing-dev: PKGV changed from 0.34.0 [default] to 0.35.1 [default]
packages/core2-64-poky-linux/python3-referencing/python3-referencing-dev: PV changed from "0.34.0" to "0.35.1"
packages/core2-64-poky-linux/python3-referencing/python3-referencing-doc: PKGV changed from 0.34.0 [default] to 0.35.1 [default]
packages/core2-64-poky-linux/python3-referencing/python3-referencing-doc: PV changed from "0.34.0" to "0.35.1"
packages/core2-64-poky-linux/python3-referencing/python3-referencing-locale: PKGV changed from 0.34.0 [default] to 0.35.1 [default]
packages/core2-64-poky-linux/python3-referencing/python3-referencing-locale: PV changed from "0.34.0" to "0.35.1"
packages/core2-64-poky-linux/python3-referencing/python3-referencing-src: PKGV changed from 0.34.0 [default] to 0.35.1 [default]
packages/core2-64-poky-linux/python3-referencing/python3-referencing-src: PV changed from "0.34.0" to "0.35.1"
packages/core2-64-poky-linux/python3-referencing/python3-referencing-staticdev: PKGV changed from 0.34.0 [default] to 0.35.1 [default]
packages/core2-64-poky-linux/python3-referencing/python3-referencing-staticdev: PV changed from "0.34.0" to "0.35.1"
packages/core2-64-poky-linux/python3-referencing/python3-referencing: PKGV changed from 0.34.0 [default] to 0.35.1 [default]
packages/core2-64-poky-linux/python3-referencing/python3-referencing: PV changed from "0.34.0" to "0.35.1"
packages/core2-64-poky-linux/python3-referencing/python3-referencing: PKGSIZE changed from 263024 to 264402 (+1%)
Changes to packages/core2-64-poky-linux/python3-referencing (sysroot):
  /usr/lib/python3.12/site-packages/referencing-0.34.0.dist-info moved to /usr/lib/python3.12/site-packages/referencing-0.35.1.dist-info

--===============5446859961088589992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-referencing (sysroot):
  /usr/lib/python3.12/site-packages/referencing-0.34.0.dist-info moved to /usr/lib/python3.12/site-packages/referencing-0.35.1.dist-info

--===============5446859961088589992==--

