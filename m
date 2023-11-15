Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A250CC54FBD
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:14 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.14627.1700059030491019837
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JUSWW15x;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=e6P3apux;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018bd36a26e7-bcbbb235-354b-431e-9bf9-0148b7dff3f6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059031;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oSakhB00t44yQd1M/OWTEFss3O2J1CIwnDImO0WlA1w=;
	b=JUSWW15xJjz4G3mm/Hu6fiHiJkgcs9zoOPjGX3b3jNUiLKU29vJkz+iFpJTgBB3V
	cT8nQl2kN6pUKBpWfDHdccTBdgcC5NPZnh0yzuRP/Q4/RQ5ag49eQ6AYn5kY5otz/AT
	ymow3mi13Q5blbmO5mO5QPnvqLNGFvoIJHVv8S04=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059031;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oSakhB00t44yQd1M/OWTEFss3O2J1CIwnDImO0WlA1w=;
	b=e6P3apuxQDAqLcONvqsJ0CEMQcNHX4D5UZywCNIRPX47qyGo5uTPU7MJs87NSV9g
	c83ZtrMQAfnytKUK2SvspJQZPugQjJH3mx9xfO/b3sPv5KliZYCPOQoORLsmXg+hD6w
	ftsqbofx408iN3dz0v8ZC8yh28QmG108Ljvma4wU=
Content-Type: multipart/mixed; boundary="===============8160366279308917897=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lsof: upgrading to 4.99.0 FAILED
Message-ID: <0101018bd36a26e7-bcbbb235-354b-431e-9bf9-0148b7dff3f6-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190670

--===============8160366279308917897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lsof* to *4.99.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-lsof-upgrade-4.98.0-4.99.0.patch
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
From 27e0417bda3d9f64c707073946b1bef66c90c00b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 09:15:52 +0000
Subject: [PATCH] lsof: upgrade 4.98.0 -> 4.99.0

---
 .../lsof/files/remove-host-information.patch    | 17 +++++++++++++----
 .../lsof/{lsof_4.98.0.bb => lsof_4.99.0.bb}     |  2 +-
 2 files changed, 14 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/lsof/{lsof_4.98.0.bb => lsof_4.99.0.bb} (96%)

diff --git a/meta/recipes-extended/lsof/files/remove-host-information.patch b/meta/recipes-extended/lsof/files/remove-host-information.patch
index fb90366ffa..629fea4a53 100644
--- a/meta/recipes-extended/lsof/files/remove-host-information.patch
+++ b/meta/recipes-extended/lsof/files/remove-host-information.patch
@@ -1,3 +1,8 @@
+From 8b1269dfa4d2afd54c5131d4612ce0d277664c44 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 30 Aug 2017 15:05:16 +0800
+Subject: [PATCH] lsof: remove host information from version.h
+
 lsof doesn't embed the username or hostname in the build if SOURCE_DATE_EPOCH is
 defined, but this still embeds build paths.  Delete all of the host details to
 ensure that no host information is leaked into the binary.
@@ -5,10 +10,14 @@ ensure that no host information is leaked into the binary.
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
-diff --git a/dialects/linux/Makefile b/dialects/linux/Makefile
-index 176a4c2..ef5a633 100644
---- a/dialects/linux/Makefile
-+++ b/dialects/linux/Makefile
+---
+ lib/dialects/linux/Makefile | 69 ++++++-------------------------------
+ 1 file changed, 11 insertions(+), 58 deletions(-)
+
+diff --git a/lib/dialects/linux/Makefile b/lib/dialects/linux/Makefile
+index f8adaa6..7a79ca7 100644
+--- a/lib/dialects/linux/Makefile
++++ b/lib/dialects/linux/Makefile
 @@ -83,64 +83,17 @@ ${LIB}: FRC
  version.h:	FRC
  	@echo Constructing version.h
diff --git a/meta/recipes-extended/lsof/lsof_4.98.0.bb b/meta/recipes-extended/lsof/lsof_4.99.0.bb
similarity index 96%
rename from meta/recipes-extended/lsof/lsof_4.98.0.bb
rename to meta/recipes-extended/lsof/lsof_4.99.0.bb
index 835ce3b8df..e4b187745d 100644
--- a/meta/recipes-extended/lsof/lsof_4.98.0.bb
+++ b/meta/recipes-extended/lsof/lsof_4.99.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a48ac97a8550eff12395a2c0d6151510"
 
 SRC_URI = "git://github.com/lsof-org/lsof;branch=master;protocol=https \
            file://remove-host-information.patch"
-SRCREV = "546eb1c9910e7c137fdff551683c35a736021e05"
+SRCREV = "2015d742527ebdded8c5694edcf3ac2a01ce76ab"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============8160366279308917897==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lsof-upgrade-4.98.0-4.99.0.patch"

RnJvbSAyN2UwNDE3YmRhM2Q5ZjY0YzcwNzA3Mzk0NmIxYmVmNjZjOTBjMDBiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMDk6MTU6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
c29mOiB1cGdyYWRlIDQuOTguMCAtPiA0Ljk5LjAKCi0tLQogLi4uL2xzb2YvZmlsZXMvcmVtb3Zl
LWhvc3QtaW5mb3JtYXRpb24ucGF0Y2ggICAgfCAxNyArKysrKysrKysrKysrLS0tLQogLi4uL2xz
b2Yve2xzb2ZfNC45OC4wLmJiID0+IGxzb2ZfNC45OS4wLmJifSAgICAgfCAgMiArLQogMiBmaWxl
cyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9sc29mL3tsc29mXzQuOTguMC5iYiA9PiBsc29mXzQuOTkuMC5iYn0g
KDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHNvZi9maWxlcy9yZW1v
dmUtaG9zdC1pbmZvcm1hdGlvbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29mL2Zp
bGVzL3JlbW92ZS1ob3N0LWluZm9ybWF0aW9uLnBhdGNoCmluZGV4IGZiOTAzNjZmZmEuLjYyOWZl
YTRhNTMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29mL2ZpbGVzL3JlbW92
ZS1ob3N0LWluZm9ybWF0aW9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29m
L2ZpbGVzL3JlbW92ZS1ob3N0LWluZm9ybWF0aW9uLnBhdGNoCkBAIC0xLDMgKzEsOCBAQAorRnJv
bSA4YjEyNjlkZmE0ZDJhZmQ1NGM1MTMxZDQ2MTJjZTBkMjc3NjY0YzQ0IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+CitEYXRl
OiBXZWQsIDMwIEF1ZyAyMDE3IDE1OjA1OjE2ICswODAwCitTdWJqZWN0OiBbUEFUQ0hdIGxzb2Y6
IHJlbW92ZSBob3N0IGluZm9ybWF0aW9uIGZyb20gdmVyc2lvbi5oCisKIGxzb2YgZG9lc24ndCBl
bWJlZCB0aGUgdXNlcm5hbWUgb3IgaG9zdG5hbWUgaW4gdGhlIGJ1aWxkIGlmIFNPVVJDRV9EQVRF
X0VQT0NIIGlzCiBkZWZpbmVkLCBidXQgdGhpcyBzdGlsbCBlbWJlZHMgYnVpbGQgcGF0aHMuICBE
ZWxldGUgYWxsIG9mIHRoZSBob3N0IGRldGFpbHMgdG8KIGVuc3VyZSB0aGF0IG5vIGhvc3QgaW5m
b3JtYXRpb24gaXMgbGVha2VkIGludG8gdGhlIGJpbmFyeS4KQEAgLTUsMTAgKzEwLDE0IEBAIGVu
c3VyZSB0aGF0IG5vIGhvc3QgaW5mb3JtYXRpb24gaXMgbGVha2VkIGludG8gdGhlIGJpbmFyeS4K
IFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZQogU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0
b24gPHJvc3MuYnVydG9uQGFybS5jb20+CiAKLWRpZmYgLS1naXQgYS9kaWFsZWN0cy9saW51eC9N
YWtlZmlsZSBiL2RpYWxlY3RzL2xpbnV4L01ha2VmaWxlCi1pbmRleCAxNzZhNGMyLi5lZjVhNjMz
IDEwMDY0NAotLS0tIGEvZGlhbGVjdHMvbGludXgvTWFrZWZpbGUKLSsrKyBiL2RpYWxlY3RzL2xp
bnV4L01ha2VmaWxlCistLS0KKyBsaWIvZGlhbGVjdHMvbGludXgvTWFrZWZpbGUgfCA2OSArKysr
KystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisgMSBmaWxlIGNoYW5nZWQsIDExIGlu
c2VydGlvbnMoKyksIDU4IGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvbGliL2RpYWxlY3Rz
L2xpbnV4L01ha2VmaWxlIGIvbGliL2RpYWxlY3RzL2xpbnV4L01ha2VmaWxlCitpbmRleCBmOGFk
YWE2Li43YTc5Y2E3IDEwMDY0NAorLS0tIGEvbGliL2RpYWxlY3RzL2xpbnV4L01ha2VmaWxlCisr
KysgYi9saWIvZGlhbGVjdHMvbGludXgvTWFrZWZpbGUKIEBAIC04Myw2NCArODMsMTcgQEAgJHtM
SUJ9OiBGUkMKICB2ZXJzaW9uLmg6CUZSQwogIAlAZWNobyBDb25zdHJ1Y3RpbmcgdmVyc2lvbi5o
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHNvZi9sc29mXzQuOTguMC5iYiBi
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29mL2xzb2ZfNC45OS4wLmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9sc29mL2xzb2ZfNC45OC4w
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHNvZi9sc29mXzQuOTkuMC5iYgpp
bmRleCA4MzVjZTNiOGRmLi5lNGIxODc3NDVkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvbHNvZi9sc29mXzQuOTguMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHNv
Zi9sc29mXzQuOTkuMC5iYgpAQCAtOCw3ICs4LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxl
Oi8vQ09QWUlORzttZDU9YTQ4YWM5N2E4NTUwZWZmMTIzOTVhMmMwZDYxNTE1MTAiCiAKIFNSQ19V
UkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9sc29mLW9yZy9sc29mO2JyYW5jaD1tYXN0ZXI7cHJvdG9j
b2w9aHR0cHMgXAogICAgICAgICAgICBmaWxlOi8vcmVtb3ZlLWhvc3QtaW5mb3JtYXRpb24ucGF0
Y2giCi1TUkNSRVYgPSAiNTQ2ZWIxYzk5MTBlN2MxMzdmZGZmNTUxNjgzYzM1YTczNjAyMWUwNSIK
K1NSQ1JFViA9ICIyMDE1ZDc0MjUyN2ViZGRlZDhjNTY5NGVkY2YzYWMyYTAxY2U3NmFiIgogCiBT
ID0gIiR7V09SS0RJUn0vZ2l0IgogCi0tIAoyLjM5LjIKCg==

--===============8160366279308917897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1843 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1843 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-631a39f68f08fbf5676e71880d4fd37e4ee960eb"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:631a39f68f08fbf5676e71880d4fd37e4ee960eb"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 77 Local 65 Mirrors 0 Missed 12 Current 221 (84% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 229 of 298 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_create_spdx_setscene)
NOTE: Running task 329 of 896 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.0.bb:do_recipe_qa)
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe lsof-4.99.0-r0: task do_recipe_qa: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 265 of 298 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe lsof-4.99.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 355 of 896 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.0.bb:do_fetch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 271 of 298 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe lsof-4.99.0-r0: task do_fetch: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 278 of 298 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 280 of 298 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 287 of 298 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_populate_sysroot_setscene)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 293 of 298 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 295 of 298 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 298 of 298 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe lsof-4.99.0-r0: task do_fetch: Succeeded
NOTE: Running task 878 of 896 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.0.bb:do_unpack)
NOTE: Running task 879 of 896 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lsof-4.99.0-r0: task do_unpack: Started
NOTE: recipe lsof-4.99.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lsof-4.99.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lsof-4.99.0-r0: task do_unpack: Succeeded
NOTE: Running task 880 of 896 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.0.bb:do_patch)
NOTE: Running task 881 of 896 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.0.bb:do_collect_spdx_deps)
NOTE: recipe lsof-4.99.0-r0: task do_patch: Started
NOTE: recipe lsof-4.99.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe lsof-4.99.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lsof-4.99.0-r0: task do_patch: Succeeded
NOTE: Running task 882 of 896 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 883 of 896 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.0.bb:do_populate_lic)
NOTE: recipe lsof-4.99.0-r0: task do_populate_lic: Started
NOTE: recipe lsof-4.99.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lsof-4.99.0-r0: task do_populate_lic: Succeeded
NOTE: recipe lsof-4.99.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 884 of 896 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.0.bb:do_configure)
NOTE: recipe lsof-4.99.0-r0: task do_configure: Started
NOTE: recipe lsof-4.99.0-r0: task do_configure: Succeeded
NOTE: Running task 885 of 896 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.0.bb:do_compile)
NOTE: recipe lsof-4.99.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 52 CC=x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot CFGL=-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/bu
 ild/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -L./lib -llsof DEBUG= INCL= -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebu
 g-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot-native=  -I..
| (cd lib; make DEBUG="" CFGF="-DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\"")
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0 
  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot-native=  -I..      -c -o dfile.o dfile.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0 
  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot-native=  -I..      -c -o dmnt.o dmnt.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0 
  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot-native=  -I..      -c -o dnode.o dnode.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0 
  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot-native=  -I..      -c -o dprint.o dprint.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0 
  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot-native=  -I..      -c -o dproc.o dproc.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0 
  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot-native=  -I..      -c -o dsock.o dsock.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0 
  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot-native=  -I..      -c -o dstore.o dstore.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0 
  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot-native=  -I..      -c -o arg.o arg.c
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git/lib'
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug
 -prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot-native=  -I..    -c -o ckkv.o ckkv.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0 
  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot-native=  -I..      -c -o main.o main.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug
 -prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot-native=  -I..    -c -o cvfs.o cvfs.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0 
  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot-native=  -I..      -c -o print.o print.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug
 -prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot-native=  -I..    -c -o dvch.o dvch.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot -Wall  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR=\"4.18.0\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0 
  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot-native=  -I..      -c -o store.o store.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug
 -prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot-native=  -I..    -c -o fino.o fino.c
| Constructing version.h
| dfile.c:31:10: fatal error: common.h: No such file or directory
|    31 | #include "common.h"
|       |          ^~~~~~~~~~
| compilation terminated.
| dprint.c:31:10: fatal error: common.h: No such file or directory
|    31 | #include "common.h"
|       |          ^~~~~~~~~~
| dmnt.c:31:10: fatal error: common.h: No such file or directory
|    31 | #include "common.h"
|       |          ^~~~~~~~~~
| dnode.c:31:10: fatal error: common.h: No such file or directory
|    31 | #include "common.h"
|       |          ^~~~~~~~~~
| compilation terminated.
| compilation terminated.
| compilation terminated.
| dproc.c:31:10: fatal error: common.h: No such file or directory
|    31 | #include "common.h"
|       |          ^~~~~~~~~~
| compilation terminated.
| dsock.c:31:10: fatal error: common.h: No such file or directory
|    31 | #include "common.h"
|       |          ^~~~~~~~~~
| compilation terminated.
| dstore.c:31:10: fatal error: common.h: No such file or directory
|    31 | #include "common.h"
|       |          ^~~~~~~~~~
| compilation terminated.
| arg.c:31:10: fatal error: common.h: No such file or directory
|    31 | #include "common.h"
|       |          ^~~~~~~~~~
| compilation terminated.
| main.c:33:10: fatal error: common.h: No such file or directory
|    33 | #include "common.h"
|       |          ^~~~~~~~~~
| compilation terminated.
| print.c:31:10: fatal error: common.h: No such file or directory
|    31 | #include "common.h"
|       |          ^~~~~~~~~~
| compilation terminated.
| make: *** [<builtin>: dfile.o] Error 1
| make: *** Waiting for unfinished jobs....
| store.c:31:10: fatal error: common.h: No such file or directory
|    31 | #include "common.h"
|       |          ^~~~~~~~~~
| compilation terminated.
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug
 -prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot-native=  -I..    -c -o isfn.o isfn.c
| In file included from ckkv.c:31:
| common.h:38:14: fatal error: lsof.h: No such file or directory
|    38 | #    include "lsof.h"
|       |              ^~~~~~~~
| compilation terminated.
| In file included from cvfs.c:42:
| common.h:38:14: fatal error: lsof.h: No such file or directory
|    38 | #    include "lsof.h"
|       |              ^~~~~~~~
| compilation terminated.
| In file included from dvch.c:31:
| common.h:38:14: fatal error: lsof.h: No such file or directory
|    38 | #    include "lsof.h"
|       |              ^~~~~~~~
| compilation terminated.
| In file included from fino.c:39:
| common.h:38:14: fatal error: lsof.h: No such file or directory
|    38 | #    include "lsof.h"
|       |              ^~~~~~~~
| compilation terminated.
| make: *** [<builtin>: print.o] Error 1
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug
 -prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot-native=  -I..    -c -o lkud.o lkud.c
| make: *** [<builtin>: dstore.o] Error 1
| make: *** [<builtin>: arg.o] Error 1
| make: *** [<builtin>: store.o] Error 1
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug
 -prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot-native=  -I..    -c -o lsof.o lsof.c
| make: *** [<builtin>: dmnt.o] Error 1
| make: *** [<builtin>: dprint.o] Error 1
| make: *** [<builtin>: dproc.o] Error 1
| make: *** [<builtin>: dnode.o] Error 1
| make: *** [<builtin>: dsock.o] Error 1
| make: *** [<builtin>: main.o] Error 1
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug
 -prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot-native=  -I..    -c -o misc.o misc.c
| x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot  -DLINUXV=418000 -DGLIBCV=238% -DHASIPv6 -DHASNORPC_H -DNEEDS_NETINET_TCPH -DHASUXSOCKEPT -DHASPTYEPT -DHASSOSTATE -DHASSOOPT -DHAS_DUP2 -DHAS_CLOSEFROM -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DLSOF_VSTR="4.18.0" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug
 -prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git=/usr/src/debug/lsof/4.99.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/recipe-sysroot-native=  -I..    -c -o node.o node.c
| make[1]: *** [<builtin>: ckkv.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
| make[1]: *** [<builtin>: cvfs.o] Error 1
| make[1]: *** [<builtin>: dvch.o] Error 1
| make[1]: *** [<builtin>: fino.o] Error 1
| In file included from isfn.c:54:
| common.h:38:14: fatal error: lsof.h: No such file or directory
|    38 | #    include "lsof.h"
|       |              ^~~~~~~~
| compilation terminated.
| make[1]: *** [<builtin>: isfn.o] Error 1
| In file included from lkud.c:39:
| common.h:38:14: fatal error: lsof.h: No such file or directory
|    38 | #    include "lsof.h"
|       |              ^~~~~~~~
| compilation terminated.
| In file included from lsof.c:34:
| common.h:38:14: fatal error: lsof.h: No such file or directory
|    38 | #    include "lsof.h"
|       |              ^~~~~~~~
| In file included from misc.c:31:
| common.h:38:14: fatal error: lsof.h: No such file or directory
|    38 | #    include "lsof.h"
|       |              ^~~~~~~~
| compilation terminated.
| compilation terminated.
| make[1]: *** [<builtin>: lkud.o] Error 1
| In file included from node.c:31:
| common.h:38:14: fatal error: lsof.h: No such file or directory
|    38 | #    include "lsof.h"
|       |              ^~~~~~~~
| compilation terminated.
| make[1]: *** [<builtin>: misc.o] Error 1
| make[1]: *** [<builtin>: lsof.o] Error 1
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/git/lib'
| make[1]: *** [<builtin>: node.o] Error 1
| make: *** [Makefile:96: lib/liblsof.a] Error 2
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/temp/run.do_compile.2610591:170 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/temp/run.do_compile.2610591, line 170
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/temp/run.do_compile.2610591, line 154
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/temp/run.do_compile.2610591, line 149
| 	#4: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/temp/run.do_compile.2610591, line 144
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/temp/run.do_compile.2610591, line 183
NOTE: recipe lsof-4.99.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 885 tasks of which 875 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115091532.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115091532.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.0.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: lsof-4.99.0-r0 do_compile: oe_runmake failed
ERROR: lsof-4.99.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/temp/run.do_compile.2610591', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lsof/4.99.0/temp/log.do_compile.2610591
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lsof/lsof_4.99.0.bb:do_compile) failed with exit code '1'

--===============8160366279308917897==--

