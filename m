Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0568C27C78
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:39 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.6030.1689456454894807139
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JE2LL8xS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101895b73a98b-2e58f813-a43b-4b28-9ada-05db7d4d701f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456454;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Rih6871CeFFXMC4Pa/GmW9WLLjmxrdtvTndPp79wP40=;
	b=JE2LL8xSr2GBAmlUuwCauzaaShcOqO5VYIxnQvLL/LShsU+JxtGoDnfdIKU1DB/J
	ZzbHhZJc9EW8WpruREEErpdnnWkusGXvjKOO1zBKX+4bU8kkHuiEgObI/J+86DbATzn
	y47mw4w84cm17yqhqboR27XEvXaqA4QTgaMqKgEs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456454;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Rih6871CeFFXMC4Pa/GmW9WLLjmxrdtvTndPp79wP40=;
	b=XPd8w6Njisu7TQlY4E8/AmHFpRidq5e0nRZ8gnjJOixkDDNvUqoPyu+ODicz4LGw
	BirAyIDikbhCVnI6Hj37PwieI5seSfsOu0RvnkClKriN7Bq1NeS/hnIQVaMBzhQNNLp
	prDfLKf20U7hUbVZUE/vJACI7gR41/uBwQaZIxJg=
Content-Type: multipart/mixed; boundary="===============8138425865174807033=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography-vectors: upgrading to 41.0.2 SUCCEEDED
Message-ID: <010101895b73a98b-2e58f813-a43b-4b28-9ada-05db7d4d701f-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184349

--===============8138425865174807033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cryptography-vectors* to *41.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cryptography-vectors-upgrade-41.0.1-41.0.2.patch
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
From a2689bf9e3222a0f98ac16ee0887141babaf8e92 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 11:38:25 +0000
Subject: [PATCH] python3-cryptography-vectors: upgrade 41.0.1 -> 41.0.2

---
 ...vectors_41.0.1.bb => python3-cryptography-vectors_41.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_41.0.1.bb => python3-cryptography-vectors_41.0.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.1.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_41.0.1.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb
index 016620e710..52f2c35315 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.1.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "23b08c39777ec7b2774a11f945d1746301b1e88ecff2e5326d7f50ea0f42d580"
+SRC_URI[sha256sum] = "028dff94a8522ca818b11295ff12df55f348f33a193c0597ddfe8239e53d1582"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
-- 
2.39.2


--===============8138425865174807033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-cryptography-vectors: PV changed from "41.0.1" to "41.0.2"
packages/core2-32-poky-linux/python3-cryptography-vectors: PKGV changed from 41.0.1 [default] to 41.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-41.0.1.tar.gz;downloadfilename=cryptography_vectors-41.0.1.tar.gz" to "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-41.0.2.tar.gz;downloadfilename=cryptography_vectors-41.0.2.tar.gz"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PV changed from "41.0.1" to "41.0.2"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PKGV changed from 41.0.1 [default] to 41.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PV changed from "41.0.1" to "41.0.2"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PKGV changed from 41.0.1 [default] to 41.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PV changed from "41.0.1" to "41.0.2"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PKGV changed from 41.0.1 [default] to 41.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PV changed from "41.0.1" to "41.0.2"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PKGV changed from 41.0.1 [default] to 41.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PV changed from "41.0.1" to "41.0.2"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PKGV changed from 41.0.1 [default] to 41.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PV changed from "41.0.1" to "41.0.2"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PKGV changed from 41.0.1 [default] to 41.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.11/site-packages/cryptography_vectors-41.0.1.dist-info -> /usr/lib/python3.11/site-packages/cryptography_vectors-41.0.2.dist-info, added "/usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-ed25519-non-singular-ext-val.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-ed25519-non-singular-crit-opt-val.pub"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PV changed from "41.0.1" to "41.0.2"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGSIZE changed from 75108637 to 75110206 (+0%)
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGV changed from 41.0.1 [default] to 41.0.2 [default]
Changes to packages/core2-32-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.11/site-packages/cryptography_vectors-41.0.1.dist-info moved to /usr/lib/python3.11/site-packages/cryptography_vectors-41.0.2.dist-info
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-ed25519-non-singular-crit-opt-val.pub was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-ed25519-non-singular-ext-val.pub was added

--===============8138425865174807033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.11/site-packages/cryptography_vectors-41.0.1.dist-info -> /usr/lib/python3.11/site-packages/cryptography_vectors-41.0.2.dist-info, added "/usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-ed25519-non-singular-ext-val.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-ed25519-non-singular-crit-opt-val.pub"
Changes to packages/core2-32-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.11/site-packages/cryptography_vectors-41.0.1.dist-info moved to /usr/lib/python3.11/site-packages/cryptography_vectors-41.0.2.dist-info
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-ed25519-non-singular-crit-opt-val.pub was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-ed25519-non-singular-ext-val.pub was added

--===============8138425865174807033==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-vectors-upgrade-41.0.1-41.0.2.patch"

RnJvbSBhMjY4OWJmOWUzMjIyYTBmOThhYzE2ZWUwODg3MTQxYmFiYWY4ZTkyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTE6Mzg6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzOiB1cGdyYWRlIDQxLjAuMSAtPiA0MS4wLjIKCi0t
LQogLi4udmVjdG9yc180MS4wLjEuYmIgPT4gcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9yc180
MS4wLjIuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1jcnlw
dG9ncmFwaHktdmVjdG9yc180MS4wLjEuYmIgPT4gcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9y
c180MS4wLjIuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzQxLjAuMS5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9yc180MS4wLjIuYmIK
c2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzQxLjAuMS5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzQx
LjAuMi5iYgppbmRleCAwMTY2MjBlNzEwLi41MmYyYzM1MzE1IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnNfNDEuMC4x
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFw
aHktdmVjdG9yc180MS4wLjIuYmIKQEAgLTksNyArOSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOU0U7bWQ1PThjMzYxN2RiNGZiNmZhZTAxZjFkMjUzYWI5MTUxMWU0IFwKICMg
Tk9URTogTWFrZSBzdXJlIHRvIGtlZXAgdGhpcyByZWNpcGUgYXQgdGhlIHNhbWUgdmVyc2lvbiBh
cyBweXRob24zLWNyeXB0b2dyYXBoeQogIyAgICAgICBVcGdyYWRlIGJvdGggcmVjaXBlcyBhdCB0
aGUgc2FtZSB0aW1lCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyM2IwOGMzOTc3N2VjN2IyNzc0
YTExZjk0NWQxNzQ2MzAxYjFlODhlY2ZmMmU1MzI2ZDdmNTBlYTBmNDJkNTgwIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjAyOGRmZjk0YTg1MjJjYTgxOGIxMTI5NWZmMTJkZjU1ZjM0OGYzM2ExOTNj
MDU5N2RkZmU4MjM5ZTUzZDE1ODIiCiAKIFBZUElfUEFDS0FHRSA9ICJjcnlwdG9ncmFwaHlfdmVj
dG9ycyIKIAotLSAKMi4zOS4yCgo=

--===============8138425865174807033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c2157884c73f9536103e0ec74672e84aff420996"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 51 Local 32 Mirrors 0 Missed 19 Current 403 (62% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 422 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 435 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/opkg-utils/0.5.0-r0/temp/log.do_packagedata_setscene.856684
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 452 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package_setscene)
NOTE: Running task 980 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_fetch)
NOTE: Running task 1054 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_fetch)
NOTE: Running task 1201 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_fetch)
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Succeeded
NOTE: Running task 1396 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_unpack)
NOTE: Running task 1397 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1398 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_unpack)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1399 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_unpack)
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_unpack: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 453 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_package_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1457 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata)
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1547 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_patch: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1548 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1549 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_populate_lic)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1550 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_populate_lic: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_patch: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_populate_lic unihash changed to 366206ce799ae65be689a267d9ece0e54204ba0dc4fbb1e1110797dee3a0be8a
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-41.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1551 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1552 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_rust_gen_targets)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-cryptography-41.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Succeeded
NOTE: Running task 1553 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_patch)
NOTE: Running task 1554 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_collect_spdx_deps)
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Succeeded
NOTE: Running task 1555 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_create_wrappers)
NOTE: Running task 1556 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1557 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_gen_targets)
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1558 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_configure)
NOTE: recipe libstd-rs-1.70.0-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_configure: Succeeded
NOTE: Running task 1559 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_compile)
NOTE: recipe libstd-rs-1.70.0-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_compile: Succeeded
NOTE: Running task 1560 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_install)
NOTE: recipe libstd-rs-1.70.0-r0: task do_install: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_install: Succeeded
NOTE: Running task 1561 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_populate_sysroot)
NOTE: Running task 1562 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_package)
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_package: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1563 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1564 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_rust_create_wrappers)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 1565 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_configure)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_configure: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1566 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1567 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_compile)
NOTE: recipe libstd-rs-1.70.0-r0: task do_package: Succeeded
NOTE: Running task 1568 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_packagedata)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1569 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_create_spdx)
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1570 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-cryptography-41.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1571 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_compile_ptest_base)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1572 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_install)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_install: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_install: Succeeded
NOTE: Running task 1573 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_install_ptest_base)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1574 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_package)
NOTE: Running task 1575 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_populate_sysroot)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_package: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1576 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1577 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1578 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_compile: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_package: Succeeded
NOTE: Running task 1579 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_packagedata)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1580 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_create_spdx)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_create_spdx: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1581 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1582 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_install)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_install: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_install: Succeeded
NOTE: Running task 1583 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_package)
NOTE: Running task 1584 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_populate_sysroot)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package: Succeeded
NOTE: Running task 1585 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1586 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_create_spdx)
NOTE: Running task 1587 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_package_write_rpm)
NOTE: Running task 1588 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_package_qa)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_create_spdx: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package_qa: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 1589 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_create_runtime_spdx)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package_qa: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1590 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_build)
NOTE: Tasks Summary: Attempted 1590 tasks of which 1538 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 7 ERROR messages, returning a non-zero exit code.
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package opkg-utils-src went backwards which would break package feeds (from 0:0.6.2-r0 to 0:0.5.0-r0) [version-going-backwards]
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package opkg-utils-dbg went backwards which would break package feeds (from 0:0.6.2-r0 to 0:0.5.0-r0) [version-going-backwards]
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package update-alternatives-opkg went backwards which would break package feeds (from 0:0.6.2-r0 to 0:0.5.0-r0) [version-going-backwards]
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package opkg-utils-doc went backwards which would break package feeds (from 0:0.6.2-r0 to 0:0.5.0-r0) [version-going-backwards]
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package opkg-utils-locale went backwards which would break package feeds (from 0:0.6.2-r0 to 0:0.5.0-r0) [version-going-backwards]
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package opkg-utils went backwards which would break package feeds (from 0:0.6.2-r0 to 0:0.5.0-r0) [version-going-backwards]
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8138425865174807033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 54 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c2157884c73f9536103e0ec74672e84aff420996"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 51 Local 32 Mirrors 0 Missed 19 Current 403 (62% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 422 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 435 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/opkg-utils/0.5.0-r0/temp/log.do_packagedata_setscene.834894
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 452 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package_setscene)
NOTE: Running task 980 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_fetch)
NOTE: Running task 1054 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_fetch)
NOTE: Running task 1201 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_fetch)
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Succeeded
NOTE: Running task 1396 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_unpack)
NOTE: Running task 1397 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1398 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_unpack)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1399 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_unpack)
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_unpack: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 453 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_package_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1457 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata)
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1505 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_patch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_patch: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1548 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1549 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1550 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_populate_lic)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_populate_lic: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_patch: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_populate_lic unihash changed to 366206ce799ae65be689a267d9ece0e54204ba0dc4fbb1e1110797dee3a0be8a
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-41.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1551 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1552 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_rust_gen_targets)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-cryptography-41.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Succeeded
NOTE: Running task 1553 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_patch)
NOTE: Running task 1554 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_collect_spdx_deps)
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Succeeded
NOTE: Running task 1555 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_create_wrappers)
NOTE: Running task 1556 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1557 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_gen_targets)
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1558 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_configure)
NOTE: recipe libstd-rs-1.70.0-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_configure: Succeeded
NOTE: Running task 1559 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_compile)
NOTE: recipe libstd-rs-1.70.0-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_compile: Succeeded
NOTE: Running task 1560 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_install)
NOTE: recipe libstd-rs-1.70.0-r0: task do_install: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_install: Succeeded
NOTE: Running task 1561 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_populate_sysroot)
NOTE: Running task 1562 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_package)
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_package: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1563 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1564 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_rust_create_wrappers)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 1565 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_configure)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_configure: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1566 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1567 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_compile)
NOTE: recipe libstd-rs-1.70.0-r0: task do_package: Succeeded
NOTE: Running task 1568 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_packagedata)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1569 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_create_spdx)
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1570 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-cryptography-41.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1571 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_compile_ptest_base)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1572 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_install)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_install: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_install: Succeeded
NOTE: Running task 1573 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_install_ptest_base)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1574 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_package)
NOTE: Running task 1575 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_populate_sysroot)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_package: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1576 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1577 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1578 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_compile: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_package: Succeeded
NOTE: Running task 1579 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_packagedata)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1580 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_create_spdx)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_create_spdx: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1581 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1582 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_install)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_install: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_install: Succeeded
NOTE: Running task 1583 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_package)
NOTE: Running task 1584 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_populate_sysroot)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package: Succeeded
NOTE: Running task 1585 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1586 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_create_spdx)
NOTE: Running task 1587 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_package_write_rpm)
NOTE: Running task 1588 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_package_qa)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_create_spdx: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package_qa: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 1589 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_create_runtime_spdx)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package_qa: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1590 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_build)
NOTE: Tasks Summary: Attempted 1590 tasks of which 1538 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 7 ERROR messages, returning a non-zero exit code.
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package opkg-utils-src went backwards which would break package feeds (from 0:0.6.2-r0 to 0:0.5.0-r0) [version-going-backwards]
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package opkg-utils-dbg went backwards which would break package feeds (from 0:0.6.2-r0 to 0:0.5.0-r0) [version-going-backwards]
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package update-alternatives-opkg went backwards which would break package feeds (from 0:0.6.2-r0 to 0:0.5.0-r0) [version-going-backwards]
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package opkg-utils-doc went backwards which would break package feeds (from 0:0.6.2-r0 to 0:0.5.0-r0) [version-going-backwards]
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package opkg-utils-locale went backwards which would break package feeds (from 0:0.6.2-r0 to 0:0.5.0-r0) [version-going-backwards]
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package opkg-utils went backwards which would break package feeds (from 0:0.6.2-r0 to 0:0.5.0-r0) [version-going-backwards]
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8138425865174807033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 48 skipped, 0 masked, 0 errors.
Removing 29 recipes from the core2-32 sysroot...done.
Removing 63 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c2157884c73f9536103e0ec74672e84aff420996"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 230 Local 193 Mirrors 0 Missed 37 Current 247 (83% match, 92% complete)
Removing 6 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 248 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 263 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 264 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 265 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 271 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 274 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 285 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 318 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_fetch)
NOTE: Running task 319 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_fetch)
NOTE: Running task 320 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_fetch)
NOTE: Running task 321 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_fetch)
NOTE: Running task 341 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_fetch)
NOTE: Running task 342 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_write_config)
NOTE: Running task 359 of 1655 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_rust_gen_targets)
NOTE: Running task 363 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe qemu-native-8.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe qemu-native-8.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_fetch: Started
NOTE: recipe libucontext-1.2-r0: task do_fetch: Started
NOTE: recipe libucontext-1.2-r0: task do_write_config: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Started
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 385 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_unpack)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Succeeded
NOTE: recipe qemu-native-8.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.6.0-r0: task do_rust_gen_targets: Started
NOTE: Running setscene task 302 of 477 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.1.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-rust-native-1.6.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_write_config: Succeeded
NOTE: recipe python3-cryptography-41.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 387 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_unpack)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_unpack: Started
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 318 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 320 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 321 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 323 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 325 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe meson-native-1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe meson-native-1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 326 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_create_spdx_setscene)
NOTE: recipe qemu-native-8.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 327 of 477 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_populate_sysroot_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 331 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 399 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-native-1_2.76.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 338 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 349 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 358 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-native-1_2.76.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 359 of 477 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 360 of 477 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 411 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_unpack)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 364 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 365 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 366 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 367 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 368 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 370 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 373 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 375 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 376 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 377 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 378 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 379 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 381 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 383 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 384 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_unpack: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-native-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe meson-native-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 386 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 414 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_unpack)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 396 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 399 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 406 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 410 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 818 of 1655 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.70.0.bb:do_rust_gen_targets)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-cryptography-41.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 879 of 1655 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.70.0.bb:do_rust_gen_targets)
NOTE: Running task 884 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_patch)
NOTE: Running task 885 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_unpack)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe meson-native-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 949 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_patch)
NOTE: Running task 997 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_patch)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1073 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_patch)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Started
NOTE: recipe rust-native-1.70.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rust-native-1.70.0-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 1086 of 1655 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.70.0.bb:do_compile)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_patch: Started
NOTE: recipe cargo-native-1.70.0-r0: task do_rust_gen_targets: Started
NOTE: recipe libucontext-1.2-r0: task do_unpack: Succeeded
NOTE: recipe cargo-native-1.70.0-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 1087 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_patch)
NOTE: recipe libunwind-1.6.2-r0: task do_patch: Started
NOTE: recipe util-linux-native-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1136 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 429 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1153 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1154 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_populate_lic)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 431 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.2-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rust-native-1.70.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_populate_lic: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rust-native-1.70.0-r0: task do_compile: Succeeded
NOTE: Running task 1159 of 1655 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.70.0.bb:do_install)
NOTE: recipe libucontext-1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-cryptography-41.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1160 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1161 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1162 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_rust_gen_targets)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/opkg-utils/0.5.0-r0/temp/log.do_packagedata_setscene.871967
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 432 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package_setscene)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_populate_lic: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_rust_gen_targets: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_populate_lic unihash changed to 366206ce799ae65be689a267d9ece0e54204ba0dc4fbb1e1110797dee3a0be8a
NOTE: recipe rust-native-1.70.0-r0: task do_install: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-41.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_patch: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-41.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 434 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running task 1163 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_package_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_package_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 440 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 442 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 445 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 448 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 450 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 452 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 454 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 455 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 458 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 460 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 461 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 462 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 470 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 474 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 475 of 477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1394 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1395 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1407 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata)
NOTE: Running task 1506 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_collect_spdx_deps)
NOTE: Running task 1507 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_collect_spdx_deps)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata: Started
NOTE: recipe libucontext-1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libucontext-1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1539 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_configure)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_configure: Started
NOTE: recipe libucontext-1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1582 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_configure)
NOTE: recipe libucontext-1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_configure: Started
NOTE: recipe libucontext-1.2-r0: task do_configure: Succeeded
NOTE: Running task 1583 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_compile)
NOTE: recipe libucontext-1.2-r0: task do_compile: Started
NOTE: recipe libucontext-1.2-r0: task do_compile: Succeeded
NOTE: Running task 1584 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_install)
NOTE: recipe libucontext-1.2-r0: task do_install: Started
NOTE: recipe libucontext-1.2-r0: task do_install: Succeeded
NOTE: Running task 1585 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot)
NOTE: Running task 1586 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_package)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libucontext-1.2-r0: task do_package: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_package: Succeeded
NOTE: Running task 1587 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata)
NOTE: recipe libucontext-1.2-r0: task do_packagedata: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1588 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_create_spdx)
NOTE: recipe libucontext-1.2-r0: task do_create_spdx: Started
NOTE: recipe libucontext-1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Succeeded
NOTE: Running task 1589 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_patch)
NOTE: recipe rust-native-1.70.0-r0: task do_install: Succeeded
NOTE: Running task 1590 of 1655 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.70.0.bb:do_populate_sysroot)
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Started
NOTE: recipe rust-native-1.70.0-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Succeeded
NOTE: Running task 1591 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1592 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_gen_targets)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1593 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_compile)
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1594 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_install)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_install: Succeeded
NOTE: Running task 1595 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_populate_sysroot)
NOTE: Running task 1596 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_package)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1597 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunwind-1.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunwind-1.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1598 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_configure)
NOTE: recipe libunwind-1.6.2-r0: task do_configure: Started
NOTE: recipe rust-native-1.70.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1599 of 1655 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.70.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe cargo-native-1.70.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cargo-native-1.70.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1600 of 1655 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.70.0.bb:do_rust_create_wrappers)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_package: Succeeded
NOTE: Running task 1601 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_packagedata)
NOTE: recipe cargo-native-1.70.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata: Started
NOTE: recipe cargo-native-1.70.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 1602 of 1655 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.70.0.bb:do_configure)
NOTE: recipe cargo-native-1.70.0-r0: task do_configure: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1603 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_create_spdx)
NOTE: recipe cargo-native-1.70.0-r0: task do_configure: Succeeded
NOTE: Running task 1604 of 1655 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.70.0.bb:do_compile)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_create_spdx: Started
NOTE: recipe cargo-native-1.70.0-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1605 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_collect_spdx_deps)
NOTE: recipe libunwind-1.6.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libunwind-1.6.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cargo-native-1.70.0-r0: task do_compile: Succeeded
NOTE: Running task 1606 of 1655 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.70.0.bb:do_install)
NOTE: recipe cargo-native-1.70.0-r0: task do_install: Started
NOTE: recipe cargo-native-1.70.0-r0: task do_install: Succeeded
NOTE: Running task 1607 of 1655 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.70.0.bb:do_populate_sysroot)
NOTE: recipe cargo-native-1.70.0-r0: task do_populate_sysroot: Started
NOTE: recipe cargo-native-1.70.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1608 of 1655 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-rust-native-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-rust-native-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1609 of 1655 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_rust_create_wrappers)
NOTE: recipe python3-setuptools-rust-native-1.6.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-setuptools-rust-native-1.6.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 1610 of 1655 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_configure)
NOTE: recipe python3-setuptools-rust-native-1.6.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-rust-native-1.6.0-r0: task do_configure: Succeeded
NOTE: Running task 1611 of 1655 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_compile)
NOTE: recipe python3-setuptools-rust-native-1.6.0-r0: task do_compile: Started
NOTE: recipe python3-setuptools-rust-native-1.6.0-r0: task do_compile: Succeeded
NOTE: Running task 1612 of 1655 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_install)
NOTE: recipe python3-setuptools-rust-native-1.6.0-r0: task do_install: Started
NOTE: recipe python3-setuptools-rust-native-1.6.0-r0: task do_install: Succeeded
NOTE: Running task 1613 of 1655 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_populate_sysroot)
NOTE: recipe python3-setuptools-rust-native-1.6.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-setuptools-rust-native-1.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_configure: Succeeded
NOTE: Running task 1614 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_compile)
NOTE: recipe libunwind-1.6.2-r0: task do_compile: Started
NOTE: recipe libunwind-1.6.2-r0: task do_compile: Succeeded
NOTE: Running task 1615 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_install)
NOTE: recipe libunwind-1.6.2-r0: task do_install: Started
NOTE: recipe libunwind-1.6.2-r0: task do_install: Succeeded
NOTE: Running task 1616 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot)
NOTE: Running task 1617 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_package)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe libunwind-1.6.2-r0: task do_package: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1618 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1619 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_create_wrappers)
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 1620 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_configure)
NOTE: recipe libstd-rs-1.70.0-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_configure: Succeeded
NOTE: Running task 1621 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_compile)
NOTE: recipe libstd-rs-1.70.0-r0: task do_compile: Started
NOTE: recipe libunwind-1.6.2-r0: task do_package: Succeeded
NOTE: Running task 1622 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1623 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_create_spdx)
NOTE: recipe libunwind-1.6.2-r0: task do_create_spdx: Started
NOTE: recipe libunwind-1.6.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 1624 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_collect_spdx_deps)
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_compile: Succeeded
NOTE: Running task 1625 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_install)
NOTE: recipe libstd-rs-1.70.0-r0: task do_install: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_install: Succeeded
NOTE: Running task 1626 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_populate_sysroot)
NOTE: Running task 1627 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_package)
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_package: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1628 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1629 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_rust_create_wrappers)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 1630 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_configure)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_configure: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1631 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1632 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_compile)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_package: Succeeded
NOTE: Running task 1633 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_packagedata)
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1634 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_create_spdx)
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1635 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-cryptography-41.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1636 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_compile_ptest_base)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1637 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_install)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_install: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_install: Succeeded
NOTE: Running task 1638 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_install_ptest_base)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1639 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_package)
NOTE: Running task 1640 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_populate_sysroot)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_package: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1641 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1642 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1643 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_compile: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_package: Succeeded
NOTE: Running task 1644 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_packagedata)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1645 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_create_spdx)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_create_spdx: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1646 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1647 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_install)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_install: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_install: Succeeded
NOTE: Running task 1648 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_package)
NOTE: Running task 1649 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_populate_sysroot)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package: Succeeded
NOTE: Running task 1650 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1651 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_create_spdx)
NOTE: Running task 1652 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_package_write_rpm)
NOTE: Running task 1653 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_package_qa)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_create_spdx: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package_qa: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 1654 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_create_runtime_spdx)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package_qa: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1655 of 1655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_build)
NOTE: Tasks Summary: Attempted 1655 tasks of which 1545 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 7 ERROR messages, returning a non-zero exit code.
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package opkg-utils-src went backwards which would break package feeds (from 0:0.6.2-r0 to 0:0.5.0-r0) [version-going-backwards]
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package opkg-utils-dbg went backwards which would break package feeds (from 0:0.6.2-r0 to 0:0.5.0-r0) [version-going-backwards]
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package update-alternatives-opkg went backwards which would break package feeds (from 0:0.6.2-r0 to 0:0.5.0-r0) [version-going-backwards]
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package opkg-utils-doc went backwards which would break package feeds (from 0:0.6.2-r0 to 0:0.5.0-r0) [version-going-backwards]
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package opkg-utils-locale went backwards which would break package feeds (from 0:0.6.2-r0 to 0:0.5.0-r0) [version-going-backwards]
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package opkg-utils went backwards which would break package feeds (from 0:0.6.2-r0 to 0:0.5.0-r0) [version-going-backwards]
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8138425865174807033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1806 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1804 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c2157884c73f9536103e0ec74672e84aff420996"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 51 Local 32 Mirrors 0 Missed 19 Current 403 (62% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 422 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 435 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/opkg-utils/0.5.0-r0/temp/log.do_packagedata_setscene.824097
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 452 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package_setscene)
NOTE: Running task 980 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_fetch)
NOTE: Running task 1054 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_fetch)
NOTE: Running task 1201 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_fetch)
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Succeeded
NOTE: Running task 1396 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_unpack)
NOTE: Running task 1397 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1398 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_unpack)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1399 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_unpack)
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 453 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_unpack: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_package_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1457 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1547 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_patch: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1548 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1549 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1550 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_populate_lic)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_populate_lic: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_patch: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_populate_lic unihash changed to 366206ce799ae65be689a267d9ece0e54204ba0dc4fbb1e1110797dee3a0be8a
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-41.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1551 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1552 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_rust_gen_targets)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-cryptography-41.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Succeeded
NOTE: Running task 1553 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_patch)
NOTE: Running task 1554 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_collect_spdx_deps)
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Succeeded
NOTE: Running task 1555 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_create_wrappers)
NOTE: Running task 1556 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1557 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_gen_targets)
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1558 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_configure)
NOTE: recipe libstd-rs-1.70.0-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_configure: Succeeded
NOTE: Running task 1559 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_compile)
NOTE: recipe libstd-rs-1.70.0-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_compile: Succeeded
NOTE: Running task 1560 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_install)
NOTE: recipe libstd-rs-1.70.0-r0: task do_install: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_install: Succeeded
NOTE: Running task 1561 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_populate_sysroot)
NOTE: Running task 1562 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_package)
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_package: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1563 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1564 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_rust_create_wrappers)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 1565 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_configure)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_configure: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1566 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1567 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_compile)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_package: Succeeded
NOTE: Running task 1568 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_packagedata)
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1569 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_create_spdx)
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1570 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-cryptography-41.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1571 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_compile_ptest_base)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1572 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_install)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_install: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_install: Succeeded
NOTE: Running task 1573 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_install_ptest_base)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1574 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_package)
NOTE: Running task 1575 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_populate_sysroot)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_package: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1576 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1577 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1578 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_compile: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_package: Succeeded
NOTE: Running task 1579 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_packagedata)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1580 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_create_spdx)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_create_spdx: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1581 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1582 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_install)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_install: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_install: Succeeded
NOTE: Running task 1583 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_package)
NOTE: Running task 1584 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_populate_sysroot)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package: Succeeded
NOTE: Running task 1585 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1586 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_create_spdx)
NOTE: Running task 1587 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_package_write_rpm)
NOTE: Running task 1588 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_package_qa)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_create_spdx: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package_qa: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 1589 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_create_runtime_spdx)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package_qa: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1590 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_build)
NOTE: Tasks Summary: Attempted 1590 tasks of which 1538 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 7 ERROR messages, returning a non-zero exit code.
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package opkg-utils-src went backwards which would break package feeds (from 0:0.6.2-r0 to 0:0.5.0-r0) [version-going-backwards]
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package opkg-utils-dbg went backwards which would break package feeds (from 0:0.6.2-r0 to 0:0.5.0-r0) [version-going-backwards]
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package update-alternatives-opkg went backwards which would break package feeds (from 0:0.6.2-r0 to 0:0.5.0-r0) [version-going-backwards]
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package opkg-utils-doc went backwards which would break package feeds (from 0:0.6.2-r0 to 0:0.5.0-r0) [version-going-backwards]
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package opkg-utils-locale went backwards which would break package feeds (from 0:0.6.2-r0 to 0:0.5.0-r0) [version-going-backwards]
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package opkg-utils went backwards which would break package feeds (from 0:0.6.2-r0 to 0:0.5.0-r0) [version-going-backwards]
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8138425865174807033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c2157884c73f9536103e0ec74672e84aff420996"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 51 Local 32 Mirrors 0 Missed 19 Current 403 (62% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 422 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 435 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/opkg-utils/0.5.0-r0/temp/log.do_packagedata_setscene.845885
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 452 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package_setscene)
NOTE: Running task 980 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_fetch)
NOTE: Running task 1054 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_fetch)
NOTE: Running task 1201 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_fetch)
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-41.0.1-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_fetch: Started
NOTE: Running task 1396 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_unpack)
NOTE: Running task 1397 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1398 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_unpack)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1399 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_unpack)
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 453 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_package_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1457 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata)
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1547 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_patch: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-cryptography-41.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1548 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1549 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_populate_lic)
NOTE: Running task 1550 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_populate_lic: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_patch: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_populate_lic unihash changed to 366206ce799ae65be689a267d9ece0e54204ba0dc4fbb1e1110797dee3a0be8a
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-41.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1551 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1552 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_rust_gen_targets)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-cryptography-41.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Succeeded
NOTE: Running task 1553 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_patch)
NOTE: Running task 1554 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_collect_spdx_deps)
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Succeeded
NOTE: Running task 1555 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_create_wrappers)
NOTE: Running task 1556 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1557 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_gen_targets)
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1558 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_configure)
NOTE: recipe libstd-rs-1.70.0-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_configure: Succeeded
NOTE: Running task 1559 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_compile)
NOTE: recipe libstd-rs-1.70.0-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_compile: Succeeded
NOTE: Running task 1560 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_install)
NOTE: recipe libstd-rs-1.70.0-r0: task do_install: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_install: Succeeded
NOTE: Running task 1561 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_populate_sysroot)
NOTE: Running task 1562 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_package)
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_package: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1563 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1564 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_rust_create_wrappers)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 1565 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_configure)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_configure: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1566 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1567 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_compile)
NOTE: recipe libstd-rs-1.70.0-r0: task do_package: Succeeded
NOTE: Running task 1568 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_packagedata)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1569 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_create_spdx)
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1570 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-cryptography-41.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1571 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_compile_ptest_base)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1572 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_install)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_install: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_install: Succeeded
NOTE: Running task 1573 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_install_ptest_base)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1574 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_package)
NOTE: Running task 1575 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_populate_sysroot)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_package: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1576 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1577 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1578 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_compile: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_package: Succeeded
NOTE: Running task 1579 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_packagedata)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1580 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb:do_create_spdx)
NOTE: recipe python3-cryptography-41.0.1-r0: task do_create_spdx: Started
NOTE: recipe python3-cryptography-41.0.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1581 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1582 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_install)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_install: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_install: Succeeded
NOTE: Running task 1583 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_package)
NOTE: Running task 1584 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_populate_sysroot)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package: Succeeded
NOTE: Running task 1585 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1586 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_create_spdx)
NOTE: Running task 1587 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_package_write_rpm)
NOTE: Running task 1588 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_package_qa)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_create_spdx: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package_qa: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 1589 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_create_runtime_spdx)
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package_qa: Succeeded
NOTE: recipe python3-cryptography-vectors-41.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1590 of 1590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb:do_build)
NOTE: Tasks Summary: Attempted 1590 tasks of which 1538 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 7 ERROR messages, returning a non-zero exit code.
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package opkg-utils-src went backwards which would break package feeds (from 0:0.6.2-r0 to 0:0.5.0-r0) [version-going-backwards]
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package opkg-utils-dbg went backwards which would break package feeds (from 0:0.6.2-r0 to 0:0.5.0-r0) [version-going-backwards]
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package update-alternatives-opkg went backwards which would break package feeds (from 0:0.6.2-r0 to 0:0.5.0-r0) [version-going-backwards]
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package opkg-utils-doc went backwards which would break package feeds (from 0:0.6.2-r0 to 0:0.5.0-r0) [version-going-backwards]
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package opkg-utils-locale went backwards which would break package feeds (from 0:0.6.2-r0 to 0:0.5.0-r0) [version-going-backwards]
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: QA Issue: Package version for package opkg-utils went backwards which would break package feeds (from 0:0.6.2-r0 to 0:0.5.0-r0) [version-going-backwards]
ERROR: opkg-utils-0.5.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8138425865174807033==--

