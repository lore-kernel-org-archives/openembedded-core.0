Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78697C0723F
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:28 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.827.1686887483426073753
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DdvKMi6l;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010188c2544a81-98ad3712-19bc-4c86-bafb-90a0752190be-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887484;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HlAkIbuMRPrUWOdlnpYYwj2ObSfiGUULeH68+dQU6R4=;
	b=DdvKMi6lPh1bDHp+NnNw9clZ1++Hne9eH3DSNotONSuBHOG52UxMNK9USvy7WE9v
	353tbeLkQKWiyYcFjNyM/JxLwLHu0YJMf771lmja1fXW91MgTKnuFVrmiLK/WsSzasa
	KR3zELyKmUNxh0/wa8Z2Vja95fHagSw+9qDX2yHc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887484;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HlAkIbuMRPrUWOdlnpYYwj2ObSfiGUULeH68+dQU6R4=;
	b=HZMPibWBFc7KqfiexhHVhGQDeBqYkXtx8Fl0s06tIPO4VWaa2uAE5OSuPDJiMuOy
	jUGcXuxy2cs6q9TbC4RU3YC5OhLqKvD3wp6tckpqPAjXF3wjvzWaSRob/DCk0Wk0PrY
	VMWv/GFWVY9GhFGnfiEtrsrbhWv1Dm79tRtIK4gc=
Content-Type: multipart/mixed; boundary="===============6780807218991230502=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.3.250.0 SUCCEEDED
Message-ID: <01010188c2544a81-98ad3712-19bc-4c86-bafb-90a0752190be-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182952

--===============6780807218991230502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glslang* to *1.3.250.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glslang-upgrade-1.3.243.0-1.3.250.0.patch
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
From c20422432a76cd2edd8d4568bc24a3060fa7cea4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 19:59:48 +0000
Subject: [PATCH] glslang: upgrade 1.3.243.0 -> 1.3.250.0

---
 .../glslang/{glslang_1.3.243.0.bb => glslang_1.3.250.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.243.0.bb => glslang_1.3.250.0.bb} (96%)

diff --git a/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb
similarity index 96%
rename from meta/recipes-graphics/glslang/glslang_1.3.243.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.250.0.bb
index c50d67a652..6e9c666d46 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "14e5a04e70057972eef8a40df422e30a3b70e4b5"
+SRCREV = "d1517d64cfca91f573af1bf7341dc3a5113349c0"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main \
            file://0001-generate-glslang-pkg-config.patch \
            "
-- 
2.39.2


--===============6780807218991230502==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-1.3.243.0-1.3.250.0.patch"

RnJvbSBjMjA0MjI0MzJhNzZjZDJlZGQ4ZDQ1NjhiYzI0YTMwNjBmYTdjZWE0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMTk6NTk6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bHNsYW5nOiB1cGdyYWRlIDEuMy4yNDMuMCAtPiAxLjMuMjUwLjAKCi0tLQogLi4uL2dsc2xhbmcv
e2dsc2xhbmdfMS4zLjI0My4wLmJiID0+IGdsc2xhbmdfMS4zLjI1MC4wLmJifSAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcve2dsc2xhbmdfMS4zLjI0My4wLmJiID0+IGds
c2xhbmdfMS4zLjI1MC4wLmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjI0My4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjUwLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjQzLjAuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjI1MC4w
LmJiCmluZGV4IGM1MGQ2N2E2NTIuLjZlOWM2NjZkNDYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjI0My4wLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjI1MC4wLmJiCkBAIC04LDcgKzgsNyBAQCBI
T01FUEFHRSA9ICJodHRwczovL3d3dy5raHJvbm9zLm9yZy9vcGVuZ2xlcy9zZGsvdG9vbHMvUmVm
ZXJlbmNlLUNvbXBpbGVyIgogTElDRU5TRSA9ICJCU0QtMy1DbGF1c2UgJiBCU0QtMi1DbGF1c2Ug
JiBNSVQgJiBBcGFjaGUtMi4wICYgR1BMLTMtd2l0aC1iaXNvbi1leGNlcHRpb24iCiBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9MmEyYjVhY2Q3YmM0ODQ0OTY0Y2Zk
YTQ1ZmU4MDdkYzMiCiAKLVNSQ1JFViA9ICIxNGU1YTA0ZTcwMDU3OTcyZWVmOGE0MGRmNDIyZTMw
YTNiNzBlNGI1IgorU1JDUkVWID0gImQxNTE3ZDY0Y2ZjYTkxZjU3M2FmMWJmNzM0MWRjM2E1MTEz
MzQ5YzAiCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL2dsc2xhbmcu
Z2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEt
Z2VuZXJhdGUtZ2xzbGFuZy1wa2ctY29uZmlnLnBhdGNoIFwKICAgICAgICAgICAgIgotLSAKMi4z
OS4yCgo=

--===============6780807218991230502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/glslang/glslang-dbg: FILELIST: removed "/usr/lib/.debug/libglslang.so.12.1.0 /usr/lib/.debug/libSPIRV.so.12.1.0 /usr/lib/.debug/libHLSL.so.12.1.0 /usr/lib/.debug/libglslang-default-resource-limits.so.12.1.0 /usr/lib/.debug/libSPVRemapper.so.12.1.0", added "/usr/lib/.debug/libSPIRV.so.12.2.0 /usr/lib/.debug/libHLSL.so.12.2.0 /usr/lib/.debug/libglslang-default-resource-limits.so.12.2.0 /usr/lib/.debug/libglslang.so.12.2.0 /usr/lib/.debug/libSPVRemapper.so.12.2.0"
packages/core2-32-poky-linux/glslang/glslang-dbg: PKGV changed from 1.3.243.0 [default] to 1.3.250.0 [default]
packages/core2-32-poky-linux/glslang/glslang-dbg: PKGSIZE changed from 74316404 to 74679208 (+0%)
packages/core2-32-poky-linux/glslang/glslang-dbg: PV changed from "1.3.243.0" to "1.3.250.0"
packages/core2-32-poky-linux/glslang/glslang-dev: PKGV changed from 1.3.243.0 [default] to 1.3.250.0 [default]
packages/core2-32-poky-linux/glslang/glslang-dev: PKGSIZE changed from 1005725 to 1020014 (+1%)
packages/core2-32-poky-linux/glslang/glslang-dev: PV changed from "1.3.243.0" to "1.3.250.0"
packages/core2-32-poky-linux/glslang/glslang-doc: PKGV changed from 1.3.243.0 [default] to 1.3.250.0 [default]
packages/core2-32-poky-linux/glslang/glslang-doc: PV changed from "1.3.243.0" to "1.3.250.0"
packages/core2-32-poky-linux/glslang/glslang-locale: PKGV changed from 1.3.243.0 [default] to 1.3.250.0 [default]
packages/core2-32-poky-linux/glslang/glslang-locale: PV changed from "1.3.243.0" to "1.3.250.0"
packages/core2-32-poky-linux/glslang/glslang-src: PKGV changed from 1.3.243.0 [default] to 1.3.250.0 [default]
packages/core2-32-poky-linux/glslang/glslang-src: PKGSIZE changed from 4789702 to 4821631 (+1%)
packages/core2-32-poky-linux/glslang/glslang-src: PV changed from "1.3.243.0" to "1.3.250.0"
packages/core2-32-poky-linux/glslang/glslang-staticdev: PKGV changed from 1.3.243.0 [default] to 1.3.250.0 [default]
packages/core2-32-poky-linux/glslang/glslang-staticdev: PV changed from "1.3.243.0" to "1.3.250.0"
packages/core2-32-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libSPVRemapper.so.12.1.0 /usr/lib/libglslang-default-resource-limits.so.12.1.0 /usr/lib/libglslang.so.12.1.0 /usr/lib/libSPIRV.so.12.1.0 /usr/lib/libHLSL.so.12.1.0", added "/usr/lib/libSPIRV.so.12.2.0 /usr/lib/libSPVRemapper.so.12.2.0 /usr/lib/libglslang-default-resource-limits.so.12.2.0 /usr/lib/libHLSL.so.12.2.0 /usr/lib/libglslang.so.12.2.0"
packages/core2-32-poky-linux/glslang/glslang: PKGV changed from 1.3.243.0 [default] to 1.3.250.0 [default]
packages/core2-32-poky-linux/glslang/glslang: PKGSIZE changed from 6502327 to 6530999 (+0%)
packages/core2-32-poky-linux/glslang/glslang: PV changed from "1.3.243.0" to "1.3.250.0"
packages/core2-32-poky-linux/glslang: PKGV changed from 1.3.243.0 [default] to 1.3.250.0 [default]
packages/core2-32-poky-linux/glslang: PV changed from "1.3.243.0" to "1.3.250.0"
Changes to packages/core2-32-poky-linux/glslang (sysroot):
  /usr/lib/libglslang-default-resource-limits.so.12 changed symlink target from libglslang-default-resource-limits.so.12.1.0 to libglslang-default-resource-limits.so.12.2.0
  /usr/lib/libglslang.so.12 changed symlink target from libglslang.so.12.1.0 to libglslang.so.12.2.0
  /usr/lib/libHLSL.so.12 changed symlink target from libHLSL.so.12.1.0 to libHLSL.so.12.2.0
  /usr/lib/libSPIRV.so.12 changed symlink target from libSPIRV.so.12.1.0 to libSPIRV.so.12.2.0
  /usr/lib/libSPVRemapper.so.12 changed symlink target from libSPVRemapper.so.12.1.0 to libSPVRemapper.so.12.2.0
  /usr/lib/libglslang-default-resource-limits.so.12.1.0 moved to /usr/lib/libglslang-default-resource-limits.so.12.2.0
  /usr/lib/libglslang.so.12.1.0 moved to /usr/lib/libglslang.so.12.2.0
  /usr/lib/libHLSL.so.12.1.0 moved to /usr/lib/libHLSL.so.12.2.0
  /usr/lib/libSPIRV.so.12.1.0 moved to /usr/lib/libSPIRV.so.12.2.0
  /usr/lib/libSPVRemapper.so.12.1.0 moved to /usr/lib/libSPVRemapper.so.12.2.0

--===============6780807218991230502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libglslang-default-resource-limits.so.12.1.0 /usr/lib/libSPVRemapper.so.12.1.0 /usr/lib/libSPIRV.so.12.1.0 /usr/lib/libglslang.so.12.1.0 /usr/lib/libHLSL.so.12.1.0", added "/usr/lib/libSPVRemapper.so.12.2.0 /usr/lib/libSPIRV.so.12.2.0 /usr/lib/libHLSL.so.12.2.0 /usr/lib/libglslang-default-resource-limits.so.12.2.0 /usr/lib/libglslang.so.12.2.0"
Changes to packages/core2-32-poky-linux/glslang (sysroot):
  /usr/lib/libglslang-default-resource-limits.so.12 changed symlink target from libglslang-default-resource-limits.so.12.1.0 to libglslang-default-resource-limits.so.12.2.0
  /usr/lib/libglslang.so.12 changed symlink target from libglslang.so.12.1.0 to libglslang.so.12.2.0
  /usr/lib/libHLSL.so.12 changed symlink target from libHLSL.so.12.1.0 to libHLSL.so.12.2.0
  /usr/lib/libSPIRV.so.12 changed symlink target from libSPIRV.so.12.1.0 to libSPIRV.so.12.2.0
  /usr/lib/libSPVRemapper.so.12 changed symlink target from libSPVRemapper.so.12.1.0 to libSPVRemapper.so.12.2.0
  /usr/lib/libglslang-default-resource-limits.so.12.1.0 moved to /usr/lib/libglslang-default-resource-limits.so.12.2.0
  /usr/lib/libglslang.so.12.1.0 moved to /usr/lib/libglslang.so.12.2.0
  /usr/lib/libHLSL.so.12.1.0 moved to /usr/lib/libHLSL.so.12.2.0
  /usr/lib/libSPIRV.so.12.1.0 moved to /usr/lib/libSPIRV.so.12.2.0
  /usr/lib/libSPVRemapper.so.12.1.0 moved to /usr/lib/libSPVRemapper.so.12.2.0

--===============6780807218991230502==--

