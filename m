Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67076CA5FBE
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 06:18:53 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1848.1790662721454358455
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 23:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hF1O9trS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=fjMFNbJR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a0ebd0bcb6-6bda34fa-0e48-472e-83cf-9ee4930fb303-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790662720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MSrtQ/WghUfK/GJ/I2vwtC0Gd7Al+WZokXrHW0glBrw=;
	b=hF1O9trSY+/rnGK0vty7TIaLJ1vYxY3RBowY4ygSakNaPKhodENfgItEA9OjOFxS
	Wf6D9EzevDu8TtcLOfICSD3bRRmgUThsbPLfkJkgta6lLqmosySBc62bTBFCt4GImqy
	AeI6swizKTabVZQ2/PNDYAsikA0B5nZW7vI2NVJU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790662720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MSrtQ/WghUfK/GJ/I2vwtC0Gd7Al+WZokXrHW0glBrw=;
	b=fjMFNbJRYDWYJ5xewnrIcymoNOMgOn1Sg97722hL+4IHBnpkGAScbf6o8LaHkVtg
	Bhp2O00mELyjUlVrVLOMalnr9JW5XV4YH6NXWt7Xl9yp9mkbq8y0NysrNvoX4cQ0E3s
	g84IEMiuzpS+1qX21bEbNOcYHmTDYMtZwV59chGQ=
Content-Type: multipart/mixed; boundary="===============0017602764495282696=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.4.363.0 SUCCEEDED
Message-ID: <010101a0ebd0bcb6-6bda34fa-0e48-472e-83cf-9ee4930fb303-000000@us-west-2.amazonses.com>
Date: Tue, 29 Sep 2026 06:18:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.29-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 06:18:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246827

--===============0017602764495282696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *glslang* to *1.4.363.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glslang-upgrade-1.4.357.0-1.4.363.0.patch
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
From 76736cbba2ec0cf787a5997dab8a5a38950a69fe Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 29 Sep 2026 05:34:59 +0000
Subject: [PATCH] glslang: upgrade 1.4.357.0 -> 1.4.363.0

## 16.6.0 2026-09-10
### New Extensions
### `SPV_KHR_abort` / `abortEXT`
### API Changes
### Bug Fixes
### Performance
## 16.5.0 2026-07-31
### New Extensions
### API Changes
### Bug Fixes
### Other
---
 .../glslang/glslang/0001-generate-glslang-pkg-config.patch      | 2 +-
 .../glslang/{glslang_1.4.357.0.bb => glslang_1.4.363.0.bb}      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.4.357.0.bb => glslang_1.4.363.0.bb} (96%)

diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
index b6a4c5a29b..b000dabff9 100644
--- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
+++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
@@ -1,4 +1,4 @@
-From f7aad1905705097782ebfea3c74c75856158a2ba Mon Sep 17 00:00:00 2001
+From 347ba2f438483f66d14fa0e8ef7baf828ed6be92 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 7 Feb 2021 01:30:39 +0000
 Subject: [PATCH] generate glslang pkg-config
diff --git a/meta/recipes-graphics/glslang/glslang_1.4.357.0.bb b/meta/recipes-graphics/glslang/glslang_1.4.363.0.bb
similarity index 96%
rename from meta/recipes-graphics/glslang/glslang_1.4.357.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.4.363.0.bb
index 0f43d83f4e..1a92e89564 100644
--- a/meta/recipes-graphics/glslang/glslang_1.4.357.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.4.363.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND MIT AND GPL-3.0-or-later WITH Bison-exception-2.2"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=50ff9d0fcde2d5b953ebe431c48e34e3"
 
-SRCREV = "168d452a4f460d24b588fed08477a81c44ee27a1"
+SRCREV = "e1b562a8bed273a02f30b59b66a5d499793cede5"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main;tag=vulkan-sdk-${PV} \
            file://0001-generate-glslang-pkg-config.patch \
            "
-- 
2.47.1


--===============0017602764495282696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/glslang/glslang-dbg: PKGV changed from 1.4.357.0 [default] to 1.4.363.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-dbg: PKGSIZE changed from 55096448 to 55582504 (+1%)
packages/x86-64-v3-poky-linux/glslang/glslang-dbg: FILELIST: removed "/usr/lib/.debug/libSPIRV.so.16.4.0 /usr/lib/.debug/libglslang-default-resource-limits.so.16.4.0 /usr/lib/.debug/libglslang.so.16.4.0", added "/usr/lib/.debug/libSPIRV.so.16.6.0 /usr/lib/.debug/libglslang.so.16.6.0 /usr/lib/.debug/libglslang-default-resource-limits.so.16.6.0"
packages/x86-64-v3-poky-linux/glslang/glslang-dbg: PV changed from "1.4.357.0" to "1.4.363.0"
packages/x86-64-v3-poky-linux/glslang/glslang-dev: PKGV changed from 1.4.357.0 [default] to 1.4.363.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-dev: PKGSIZE changed from 444211 to 447919 (+1%)
packages/x86-64-v3-poky-linux/glslang/glslang-dev: PV changed from "1.4.357.0" to "1.4.363.0"
packages/x86-64-v3-poky-linux/glslang/glslang-doc: PKGV changed from 1.4.357.0 [default] to 1.4.363.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-doc: PV changed from "1.4.357.0" to "1.4.363.0"
packages/x86-64-v3-poky-linux/glslang/glslang-locale: PKGV changed from 1.4.357.0 [default] to 1.4.363.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-locale: PV changed from "1.4.357.0" to "1.4.363.0"
packages/x86-64-v3-poky-linux/glslang/glslang-src: PKGV changed from 1.4.357.0 [default] to 1.4.363.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-src: PKGSIZE changed from 5637751 to 5706112 (+1%)
packages/x86-64-v3-poky-linux/glslang/glslang-src: FILELIST: directory renamed /usr/src/debug/glslang/1.4.357.0/glslang/Include -> /usr/src/debug/glslang/1.4.363.0/glslang/Include, directory renamed /usr/src/debug/glslang/1.4.357.0/glslang/Public -> /usr/src/debug/glslang/1.4.363.0/glslang/Public, directory renamed /usr/src/debug/glslang/1.4.357.0/glslang/ResourceLimits -> /usr/src/debug/glslang/1.4.363.0/glslang/ResourceLimits, directory renamed /usr/src/debug/glslang/1.4.357.0/glslang/MachineIndependent/preprocessor -> /usr/src/debug/glslang/1.4.363.0/glslang/MachineIndependent/preprocessor, directory renamed /usr/src/debug/glslang/1.4.357.0/glslang/MachineIndependent -> /usr/src/debug/glslang/1.4.363.0/glslang/MachineIndependent, directory renamed /usr/src/debug/glslang/1.4.357.0/StandAlone -> /usr/src/debug/glslang/1.4.363.0/StandAlone, directory renamed /usr/src/debug/glslang/1.4.357.0/glslang/CInterface -> /usr/src/debug/glslang/1.4.363.0/glslang/CInterface, directory renamed /
 usr/src/debug/glslang/1.4.357.0/glslang -> /usr/src/debug/glslang/1.4.363.0/glslang, directory renamed /usr/src/debug/glslang/1.4.357.0/glslang/GenericCodeGen -> /usr/src/debug/glslang/1.4.363.0/glslang/GenericCodeGen, directory renamed /usr/src/debug/glslang/1.4.357.0/include/glslang -> /usr/src/debug/glslang/1.4.363.0/include/glslang, directory renamed /usr/src/debug/glslang/1.4.357.0/SPIRV/CInterface -> /usr/src/debug/glslang/1.4.363.0/SPIRV/CInterface, directory renamed /usr/src/debug/glslang/1.4.357.0/SPIRV -> /usr/src/debug/glslang/1.4.363.0/SPIRV, directory renamed /usr/src/debug/glslang/1.4.357.0/glslang/HLSL -> /usr/src/debug/glslang/1.4.363.0/glslang/HLSL, directory renamed /usr/src/debug/glslang/1.4.357.0/glslang/OSDependent/Unix -> /usr/src/debug/glslang/1.4.363.0/glslang/OSDependent/Unix, directory renamed /usr/src/debug/glslang/1.4.357.0/glslang/OSDependent -> /usr/src/debug/glslang/1.4.363.0/glslang/OSDependent
packages/x86-64-v3-poky-linux/glslang/glslang-src: PV changed from "1.4.357.0" to "1.4.363.0"
packages/x86-64-v3-poky-linux/glslang/glslang-staticdev: PKGV changed from 1.4.357.0 [default] to 1.4.363.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-staticdev: PV changed from "1.4.357.0" to "1.4.363.0"
packages/x86-64-v3-poky-linux/glslang/glslang: PKGV changed from 1.4.357.0 [default] to 1.4.363.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang: PKGSIZE changed from 4137113 to 4165785 (+1%)
packages/x86-64-v3-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libglslang.so.16.4.0 /usr/lib/libSPIRV.so.16.4.0 /usr/lib/libglslang-default-resource-limits.so.16.4.0", added "/usr/lib/libSPIRV.so.16.6.0 /usr/lib/libglslang.so.16.6.0 /usr/lib/libglslang-default-resource-limits.so.16.6.0"
packages/x86-64-v3-poky-linux/glslang/glslang: PV changed from "1.4.357.0" to "1.4.363.0"
packages/x86-64-v3-poky-linux/glslang: PKGV changed from 1.4.357.0 [default] to 1.4.363.0 [default]
packages/x86-64-v3-poky-linux/glslang: SRC_URI changed from "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main;tag=vulkan-sdk-1.4.357.0 file://0001-generate-glslang-pkg-config.patch" to "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main;tag=vulkan-sdk-1.4.363.0 file://0001-generate-glslang-pkg-config.patch"
packages/x86-64-v3-poky-linux/glslang: PV changed from "1.4.357.0" to "1.4.363.0"
Changes to packages/x86-64-v3-poky-linux/glslang (sysroot):
  /usr/lib/libglslang-default-resource-limits.so.16 changed symlink target from libglslang-default-resource-limits.so.16.4.0 to libglslang-default-resource-limits.so.16.6.0
  /usr/lib/libglslang.so.16 changed symlink target from libglslang.so.16.4.0 to libglslang.so.16.6.0
  /usr/lib/libSPIRV.so.16 changed symlink target from libSPIRV.so.16.4.0 to libSPIRV.so.16.6.0
  /usr/lib/libglslang-default-resource-limits.so.16.4.0 moved to /usr/lib/libglslang-default-resource-limits.so.16.6.0
  /usr/lib/libglslang.so.16.4.0 moved to /usr/lib/libglslang.so.16.6.0
  /usr/lib/libSPIRV.so.16.4.0 moved to /usr/lib/libSPIRV.so.16.6.0

--===============0017602764495282696==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-1.4.357.0-1.4.363.0.patch"

RnJvbSA3NjczNmNiYmEyZWMwY2Y3ODdhNTk5N2RhYjhhNWEzODk1MGE2OWZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjkgU2VwIDIwMjYgMDU6MzQ6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bHNsYW5nOiB1cGdyYWRlIDEuNC4zNTcuMCAtPiAxLjQuMzYzLjAKCiMjIDE2LjYuMCAyMDI2LTA5
LTEwCiMjIyBOZXcgRXh0ZW5zaW9ucwojIyMgYFNQVl9LSFJfYWJvcnRgIC8gYGFib3J0RVhUYAoj
IyMgQVBJIENoYW5nZXMKIyMjIEJ1ZyBGaXhlcwojIyMgUGVyZm9ybWFuY2UKIyMgMTYuNS4wIDIw
MjYtMDctMzEKIyMjIE5ldyBFeHRlbnNpb25zCiMjIyBBUEkgQ2hhbmdlcwojIyMgQnVnIEZpeGVz
CiMjIyBPdGhlcgotLS0KIC4uLi9nbHNsYW5nL2dsc2xhbmcvMDAwMS1nZW5lcmF0ZS1nbHNsYW5n
LXBrZy1jb25maWcucGF0Y2ggICAgICB8IDIgKy0KIC4uLi9nbHNsYW5nL3tnbHNsYW5nXzEuNC4z
NTcuMC5iYiA9PiBnbHNsYW5nXzEuNC4zNjMuMC5iYn0gICAgICB8IDIgKy0KIDIgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1ncmFwaGljcy9nbHNsYW5nL3tnbHNsYW5nXzEuNC4zNTcuMC5iYiA9PiBnbHNsYW5nXzEuNC4z
NjMuMC5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFu
Zy9nbHNsYW5nLzAwMDEtZ2VuZXJhdGUtZ2xzbGFuZy1wa2ctY29uZmlnLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZy8wMDAxLWdlbmVyYXRlLWdsc2xhbmctcGtn
LWNvbmZpZy5wYXRjaAppbmRleCBiNmE0YzVhMjliLi5iMDAwZGFiZmY5IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nLzAwMDEtZ2VuZXJhdGUtZ2xzbGFu
Zy1wa2ctY29uZmlnLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2ds
c2xhbmcvMDAwMS1nZW5lcmF0ZS1nbHNsYW5nLXBrZy1jb25maWcucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIGY3YWFkMTkwNTcwNTA5Nzc4MmViZmVhM2M3NGM3NTg1NjE1OGEyYmEgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDM0N2JhMmY0Mzg0ODNmNjZkMTRmYTBlOGVmN2JhZjgy
OGVkNmJlOTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKb3NlIFF1YXJlc21hIDxx
dWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KIERhdGU6IFN1biwgNyBGZWIgMjAyMSAwMTozMDozOSAr
MDAwMAogU3ViamVjdDogW1BBVENIXSBnZW5lcmF0ZSBnbHNsYW5nIHBrZy1jb25maWcKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS40LjM1Ny4wLmJi
IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjQuMzYzLjAuYmIKc2lt
aWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xh
bmcvZ2xzbGFuZ18xLjQuMzU3LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9n
bHNsYW5nL2dsc2xhbmdfMS40LjM2My4wLmJiCmluZGV4IDBmNDNkODNmNGUuLjFhOTJlODk1NjQg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS40LjM1
Ny4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS40LjM2
My4wLmJiCkBAIC04LDcgKzgsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL3d3dy5raHJvbm9zLm9y
Zy9vcGVuZ2xlcy9zZGsvdG9vbHMvUmVmZXJlbmNlLUNvbXBpbGVyIgogTElDRU5TRSA9ICJBcGFj
aGUtMi4wIEFORCBCU0QtMi1DbGF1c2UgQU5EIEJTRC0zLUNsYXVzZSBBTkQgTUlUIEFORCBHUEwt
My4wLW9yLWxhdGVyIFdJVEggQmlzb24tZXhjZXB0aW9uLTIuMiIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT01MGZmOWQwZmNkZTJkNWI5NTNlYmU0MzFjNDhlMzRl
MyIKIAotU1JDUkVWID0gIjE2OGQ0NTJhNGY0NjBkMjRiNTg4ZmVkMDg0NzdhODFjNDRlZTI3YTEi
CitTUkNSRVYgPSAiZTFiNTYyYThiZWQyNzNhMDJmMzBiNTliNjZhNWQ0OTk3OTNjZWRlNSIKIFNS
Q19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvZ2xzbGFuZy5naXQ7cHJvdG9j
b2w9aHR0cHM7YnJhbmNoPW1haW47dGFnPXZ1bGthbi1zZGstJHtQVn0gXAogICAgICAgICAgICBm
aWxlOi8vMDAwMS1nZW5lcmF0ZS1nbHNsYW5nLXBrZy1jb25maWcucGF0Y2ggXAogICAgICAgICAg
ICAiCi0tIAoyLjQ3LjEKCg==

--===============0017602764495282696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libglslang-default-resource-limits.so.16.4.0 /usr/lib/libSPIRV.so.16.4.0 /usr/lib/libglslang.so.16.4.0", added "/usr/lib/libSPIRV.so.16.6.0 /usr/lib/libglslang-default-resource-limits.so.16.6.0 /usr/lib/libglslang.so.16.6.0"
Changes to packages/x86-64-v3-poky-linux/glslang (sysroot):
  /usr/lib/libglslang-default-resource-limits.so.16 changed symlink target from libglslang-default-resource-limits.so.16.4.0 to libglslang-default-resource-limits.so.16.6.0
  /usr/lib/libglslang.so.16 changed symlink target from libglslang.so.16.4.0 to libglslang.so.16.6.0
  /usr/lib/libSPIRV.so.16 changed symlink target from libSPIRV.so.16.4.0 to libSPIRV.so.16.6.0
  /usr/lib/libglslang-default-resource-limits.so.16.4.0 moved to /usr/lib/libglslang-default-resource-limits.so.16.6.0
  /usr/lib/libglslang.so.16.4.0 moved to /usr/lib/libglslang.so.16.6.0
  /usr/lib/libSPIRV.so.16.4.0 moved to /usr/lib/libSPIRV.so.16.6.0

--===============0017602764495282696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="glslang-changelog.txt"

## 16.6.0 2026-09-10
### New Extensions
### `SPV_KHR_abort` / `abortEXT`
### API Changes
### Bug Fixes
### Performance
## 16.5.0 2026-07-31
### New Extensions
### API Changes
### Bug Fixes
### Other

--===============0017602764495282696==--

