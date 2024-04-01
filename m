Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C4FCD13BB
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:32 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.44647.1711994601800607642
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TgnZnuor;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=jQq30VQn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018e9ad47e6d-d0c10199-0f15-45d0-9300-dd11beea6888-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9hJ5L2XMSWOXCRegUgtDN4ohPmIwU/6Cvio3YMoEZPk=;
	b=TgnZnuorfVumWZ1W+b4xnvyF7bMhO9M8NAIOZ+LrpOEwtreW4MG7ErVUYunVJ+ZW
	v3WIlVbryZSRGAFm7uTNoi5c6DB3cHNwDtwSOZeWwJhhAB5ar/eTdoppaGYtGPX710O
	Kchrn6S2kbMrTb4hwVstF0VKv0cx9fNoyirlFqes=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9hJ5L2XMSWOXCRegUgtDN4ohPmIwU/6Cvio3YMoEZPk=;
	b=jQq30VQnErPZViA3aZX7WElKX1YAcWfzeKsRlWnm32oNZQMC8h5t9KP1Ofkjm7JO
	DKp31j3eZjkSCFMHXvtFLtsIa5gkC/qigpYdy/ObIDbjXyKfRp8/SqnQyYBoVtpzUMI
	N6K/SvmfoY2KYHvfcwFd1NrrssrOmMQu9m7sDJRk=
Content-Type: multipart/mixed; boundary="===============5059723344641267589=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.22.4 SUCCEEDED
Message-ID: <0101018e9ad47e6d-d0c10199-0f15-45d0-9300-dd11beea6888-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197721

--===============5059723344641267589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hatchling* to *1.22.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatchling-upgrade-1.21.1-1.22.4.patch
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
From 208449717514e5c479c14bcbbd68a4e65aa52755 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 07:59:35 +0000
Subject: [PATCH] python3-hatchling: upgrade 1.21.1 -> 1.22.4

---
 ...{python3-hatchling_1.21.1.bb => python3-hatchling_1.22.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.21.1.bb => python3-hatchling_1.22.4.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.21.1.bb b/meta/recipes-devtools/python/python3-hatchling_1.22.4.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hatchling_1.21.1.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.22.4.bb
index 09d936aa7d..d2f32d8b1a 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.21.1.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.22.4.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native python3-trove-classifiers-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "bba440453a224e7d4478457fa2e8d8c3633765bafa02975a6b53b9bf917980bc"
+SRC_URI[sha256sum] = "8a2dcec96d7fb848382ef5848e5ac43fdae641f35a08a3fab5116bd495f3416e"
 
 do_compile:prepend() {
     export PYTHONPATH=src
-- 
2.42.0


--===============5059723344641267589==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatchling-upgrade-1.21.1-1.22.4.patch"

RnJvbSAyMDg0NDk3MTc1MTRlNWM0NzljMTRiY2JiZDY4YTRlNjVhYTUyNzU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAwNzo1OTozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaGF0Y2hsaW5nOiB1cGdyYWRlIDEuMjEuMSAtPiAxLjIyLjQKCi0tLQogLi4ue3B5dGhv
bjMtaGF0Y2hsaW5nXzEuMjEuMS5iYiA9PiBweXRob24zLWhhdGNobGluZ18xLjIyLjQuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1oYXRjaGxpbmdfMS4yMS4x
LmJiID0+IHB5dGhvbjMtaGF0Y2hsaW5nXzEuMjIuNC5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjEuMS5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oYXRjaGxpbmdfMS4yMi40LmJi
CnNpbWlsYXJpdHkgaW5kZXggODUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1oYXRjaGxpbmdfMS4yMS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjIuNC5iYgppbmRleCAwOWQ5MzZh
YTdkLi5kMmYzMmQ4YjFhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjEuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjIuNC5iYgpAQCAtOCw3ICs4LDcgQEAgaW5oZXJp
dCBweXBpIHB5dGhvbl9oYXRjaGxpbmcKIERFUEVORFMgKz0gInB5dGhvbjMtcGx1Z2d5LW5hdGl2
ZSBweXRob24zLXBhdGhzcGVjLW5hdGl2ZSBweXRob24zLXBhY2thZ2luZy1uYXRpdmUgcHl0aG9u
My1lZGl0YWJsZXMtbmF0aXZlIHB5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnMtbmF0aXZlIgogREVQ
RU5EUzpyZW1vdmU6Y2xhc3MtbmF0aXZlID0gInB5dGhvbjMtaGF0Y2hsaW5nLW5hdGl2ZSIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gImJiYTQ0MDQ1M2EyMjRlN2Q0NDc4NDU3ZmEyZThkOGMzNjMz
NzY1YmFmYTAyOTc1YTZiNTNiOWJmOTE3OTgwYmMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGEy
ZGNlYzk2ZDdmYjg0ODM4MmVmNTg0OGU1YWM0M2ZkYWU2NDFmMzVhMDhhM2ZhYjUxMTZiZDQ5NWYz
NDE2ZSIKIAogZG9fY29tcGlsZTpwcmVwZW5kKCkgewogICAgIGV4cG9ydCBQWVRIT05QQVRIPXNy
YwotLSAKMi40Mi4wCgo=

--===============5059723344641267589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: FILELIST: directory renamed /usr/lib/python3.12/site-packages/hatchling-1.21.1.dist-info -> /usr/lib/python3.12/site-packages/hatchling-1.22.4.dist-info, directory renamed /usr/lib/python3.12/site-packages/hatchling-1.21.1.dist-info/licenses -> /usr/lib/python3.12/site-packages/hatchling-1.22.4.dist-info/licenses, added "/usr/lib/python3.12/site-packages/hatchling/builders/binary.py /usr/lib/python3.12/site-packages/hatchling/builders/__pycache__/binary.cpython-312.pyc"
Changes to packages/core2-64-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.12/site-packages/hatchling-1.21.1.dist-info moved to /usr/lib/python3.12/site-packages/hatchling-1.22.4.dist-info
  /usr/lib/python3.12/site-packages/hatchling/builders/binary.py was added
  /usr/lib/python3.12/site-packages/hatchling/builders/__pycache__/binary.cpython-312.pyc was added
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.12/site-packages/hatchling-1.21.1.dist-info moved to /usr/lib/python3.12/site-packages/hatchling-1.22.4.dist-info
  /usr/lib/python3.12/site-packages/hatchling/builders/binary.py was added
  /usr/lib/python3.12/site-packages/hatchling/builders/__pycache__/binary.cpython-312.pyc was added

--===============5059723344641267589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-hatchling: PV changed from "1.21.1" to "1.22.4"
packages/core2-64-poky-linux/python3-hatchling: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.21.1.tar.gz;downloadfilename=hatchling-1.21.1.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.22.4.tar.gz;downloadfilename=hatchling-1.22.4.tar.gz"
packages/core2-64-poky-linux/python3-hatchling: PKGV changed from 1.21.1 [default] to 1.22.4 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dbg: PV changed from "1.21.1" to "1.22.4"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dbg: PKGV changed from 1.21.1 [default] to 1.22.4 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dev: PV changed from "1.21.1" to "1.22.4"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-dev: PKGV changed from 1.21.1 [default] to 1.22.4 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-doc: PV changed from "1.21.1" to "1.22.4"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-doc: PKGV changed from 1.21.1 [default] to 1.22.4 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-locale: PV changed from "1.21.1" to "1.22.4"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-locale: PKGV changed from 1.21.1 [default] to 1.22.4 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-src: PV changed from "1.21.1" to "1.22.4"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-src: PKGV changed from 1.21.1 [default] to 1.22.4 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-staticdev: PV changed from "1.21.1" to "1.22.4"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling-staticdev: PKGV changed from 1.21.1 [default] to 1.22.4 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: PV changed from "1.21.1" to "1.22.4"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: PKGV changed from 1.21.1 [default] to 1.22.4 [default]
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: FILELIST: directory renamed /usr/lib/python3.12/site-packages/hatchling-1.21.1.dist-info -> /usr/lib/python3.12/site-packages/hatchling-1.22.4.dist-info, directory renamed /usr/lib/python3.12/site-packages/hatchling-1.21.1.dist-info/licenses -> /usr/lib/python3.12/site-packages/hatchling-1.22.4.dist-info/licenses, added "/usr/lib/python3.12/site-packages/hatchling/builders/binary.py /usr/lib/python3.12/site-packages/hatchling/builders/__pycache__/binary.cpython-312.pyc"
packages/core2-64-poky-linux/python3-hatchling/python3-hatchling: PKGSIZE changed from 654724 to 702685 (+7%)
Changes to packages/core2-64-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.12/site-packages/hatchling-1.21.1.dist-info moved to /usr/lib/python3.12/site-packages/hatchling-1.22.4.dist-info
  /usr/lib/python3.12/site-packages/hatchling/builders/binary.py was added
  /usr/lib/python3.12/site-packages/hatchling/builders/__pycache__/binary.cpython-312.pyc was added
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.12/site-packages/hatchling-1.21.1.dist-info moved to /usr/lib/python3.12/site-packages/hatchling-1.22.4.dist-info
  /usr/lib/python3.12/site-packages/hatchling/builders/binary.py was added
  /usr/lib/python3.12/site-packages/hatchling/builders/__pycache__/binary.cpython-312.pyc was added

--===============5059723344641267589==--

