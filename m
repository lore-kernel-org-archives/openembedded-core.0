Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1675DC3DA5F
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:58:00 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.2184.1719853076441872467
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=GYTO4soQ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Ph9a+1un;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101906f3b4c67-ec48207a-8ca2-446f-a3d0-4a38b1c9917b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853075;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gekvj5y2Xilze6NgTBu15Cp22wrC+s00vUNlw34lQ6k=;
	b=GYTO4soQXrxBymruJqCCTlVzr1fqHvx5suZ8F3k3FKy1ujsDCIz0lDCZrvBI9fTs
	mSz5HnPNp4OVmRiZt1Jf9+x/TXLeYxXJBF345gP3e1Dw9gZqR9tyn+Z2cLZJ+QoWLL4
	QmpYIQaa/VAVcEdiqmvHQHEPW6werQf7q27EU0jU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853075;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gekvj5y2Xilze6NgTBu15Cp22wrC+s00vUNlw34lQ6k=;
	b=Ph9a+1unjTLhicXrkgR+pyU9Jin4643xxEl7Pi4XVK/0XfHyMi4gp52gMpcl+UWZ
	BWiAeTH7Y/HKS5nuJ33RPRMLjw421j8TF+29kYipCx8zAoDg6F+e0Oj92hMrqyGgg5H
	QUPOxi0VTne+QxuwKkeB84ze0BIOJvQgJuz1bdJU=
Content-Type: multipart/mixed; boundary="===============1934262743961737324=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.25.0 SUCCEEDED
Message-ID: <010101906f3b4c67-ec48207a-8ca2-446f-a3d0-4a38b1c9917b-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:58:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201349

--===============1934262743961737324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hatchling* to *1.25.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatchling-upgrade-1.24.2-1.25.0.patch
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
From 80a5cfe2e501ab5dfbdd75db7d9472573862eba1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jul 2024 08:36:30 +0000
Subject: [PATCH] python3-hatchling: upgrade 1.24.2 -> 1.25.0

---
 ...{python3-hatchling_1.24.2.bb => python3-hatchling_1.25.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.24.2.bb => python3-hatchling_1.25.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.24.2.bb b/meta/recipes-devtools/python/python3-hatchling_1.25.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hatchling_1.24.2.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.25.0.bb
index 0ad545f448..111b447815 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.24.2.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.25.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native python3-trove-classifiers-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "41ddc27cdb25db9ef7b68bef075f829c84cb349aa1bff8240797d012510547b0"
+SRC_URI[sha256sum] = "7064631a512610b52250a4d3ff1bd81551d6d1431c4eb7b72e734df6c74f4262"
 
 do_compile:prepend() {
     export PYTHONPATH=src
-- 
2.44.0


--===============1934262743961737324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-hatchling: PV changed from "1.24.2" to "1.25.0"
packages/core2-64-poky-linux/python3-hatchling: PKGV changed from 1.24.2 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/python3-hatchling: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.24.2.tar.gz;downloadfilename=hatchling-1.24.2.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.25.0.tar.gz;downloadfilename=hatchling-1.25.0.tar.gz"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dbg: PV changed from "1.24.2" to "1.25.0"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dbg: PKGV changed from 1.24.2 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dev: PV changed from "1.24.2" to "1.25.0"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dev: PKGV changed from 1.24.2 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-doc: PV changed from "1.24.2" to "1.25.0"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-doc: PKGV changed from 1.24.2 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-locale: PV changed from "1.24.2" to "1.25.0"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-locale: PKGV changed from 1.24.2 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-src: PV changed from "1.24.2" to "1.25.0"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-src: PKGV changed from 1.24.2 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-staticdev: PV changed from "1.24.2" to "1.25.0"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-staticdev: PKGV changed from 1.24.2 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: PV changed from "1.24.2" to "1.25.0"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: PKGV changed from 1.24.2 [default] to 1.25.0 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: FILELIST: directory renamed /usr/lib/python3.12/site-packages/hatchling-1.24.2.dist-info -> /usr/lib/python3.12/site-packages/hatchling-1.25.0.dist-info, directory renamed /usr/lib/python3.12/site-packages/hatchling-1.24.2.dist-info/licenses -> /usr/lib/python3.12/site-packages/hatchling-1.25.0.dist-info/licenses, added "/usr/lib/python3.12/site-packages/hatchling/builders/macos.py /usr/lib/python3.12/site-packages/hatchling/builders/__pycache__/macos.cpython-312.pyc"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: PKGSIZE changed from 715588 to 720636 (+1%)
Changes to packages/core2-64-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.12/site-packages/hatchling-1.24.2.dist-info moved to /usr/lib/python3.12/site-packages/hatchling-1.25.0.dist-info
  /usr/lib/python3.12/site-packages/hatchling/builders/macos.py was added
  /usr/lib/python3.12/site-packages/hatchling/builders/__pycache__/macos.cpython-312.pyc was added
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.12/site-packages/hatchling-1.24.2.dist-info moved to /usr/lib/python3.12/site-packages/hatchling-1.25.0.dist-info
  /usr/lib/python3.12/site-packages/hatchling/builders/macos.py was added
  /usr/lib/python3.12/site-packages/hatchling/builders/__pycache__/macos.cpython-312.pyc was added

--===============1934262743961737324==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatchling-upgrade-1.24.2-1.25.0.patch"

RnJvbSA4MGE1Y2ZlMmU1MDFhYjVkZmJkZDc1ZGI3ZDk0NzI1NzM4NjJlYmExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdWwgMjAyNCAwODozNjozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaGF0Y2hsaW5nOiB1cGdyYWRlIDEuMjQuMiAtPiAxLjI1LjAKCi0tLQogLi4ue3B5dGhv
bjMtaGF0Y2hsaW5nXzEuMjQuMi5iYiA9PiBweXRob24zLWhhdGNobGluZ18xLjI1LjAuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1oYXRjaGxpbmdfMS4yNC4y
LmJiID0+IHB5dGhvbjMtaGF0Y2hsaW5nXzEuMjUuMC5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjQuMi5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oYXRjaGxpbmdfMS4yNS4wLmJi
CnNpbWlsYXJpdHkgaW5kZXggODUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1oYXRjaGxpbmdfMS4yNC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjUuMC5iYgppbmRleCAwYWQ1NDVm
NDQ4Li4xMTFiNDQ3ODE1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjQuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjUuMC5iYgpAQCAtOCw3ICs4LDcgQEAgaW5oZXJp
dCBweXBpIHB5dGhvbl9oYXRjaGxpbmcKIERFUEVORFMgKz0gInB5dGhvbjMtcGx1Z2d5LW5hdGl2
ZSBweXRob24zLXBhdGhzcGVjLW5hdGl2ZSBweXRob24zLXBhY2thZ2luZy1uYXRpdmUgcHl0aG9u
My1lZGl0YWJsZXMtbmF0aXZlIHB5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnMtbmF0aXZlIgogREVQ
RU5EUzpyZW1vdmU6Y2xhc3MtbmF0aXZlID0gInB5dGhvbjMtaGF0Y2hsaW5nLW5hdGl2ZSIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjQxZGRjMjdjZGIyNWRiOWVmN2I2OGJlZjA3NWY4MjljODRj
YjM0OWFhMWJmZjgyNDA3OTdkMDEyNTEwNTQ3YjAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzA2
NDYzMWE1MTI2MTBiNTIyNTBhNGQzZmYxYmQ4MTU1MWQ2ZDE0MzFjNGViN2I3MmU3MzRkZjZjNzRm
NDI2MiIKIAogZG9fY29tcGlsZTpwcmVwZW5kKCkgewogICAgIGV4cG9ydCBQWVRIT05QQVRIPXNy
YwotLSAKMi40NC4wCgo=

--===============1934262743961737324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: FILELIST: directory renamed /usr/lib/python3.12/site-packages/hatchling-1.24.2.dist-info/licenses -> /usr/lib/python3.12/site-packages/hatchling-1.25.0.dist-info/licenses, directory renamed /usr/lib/python3.12/site-packages/hatchling-1.24.2.dist-info -> /usr/lib/python3.12/site-packages/hatchling-1.25.0.dist-info, added "/usr/lib/python3.12/site-packages/hatchling/builders/__pycache__/macos.cpython-312.pyc /usr/lib/python3.12/site-packages/hatchling/builders/macos.py"
Changes to packages/core2-64-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.12/site-packages/hatchling-1.24.2.dist-info moved to /usr/lib/python3.12/site-packages/hatchling-1.25.0.dist-info
  /usr/lib/python3.12/site-packages/hatchling/builders/macos.py was added
  /usr/lib/python3.12/site-packages/hatchling/builders/__pycache__/macos.cpython-312.pyc was added
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.12/site-packages/hatchling-1.24.2.dist-info moved to /usr/lib/python3.12/site-packages/hatchling-1.25.0.dist-info
  /usr/lib/python3.12/site-packages/hatchling/builders/macos.py was added
  /usr/lib/python3.12/site-packages/hatchling/builders/__pycache__/macos.cpython-312.pyc was added

--===============1934262743961737324==--

