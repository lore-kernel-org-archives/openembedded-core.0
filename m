Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1615.1793425339087318390
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 22:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KEjC4UsS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kcTM6H1z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a1907aefb3-bb0718e9-ac46-4af0-90cb-53df153e3a00-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793425338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hITNKHijs5At9JQyEQBRhsC0XjXg655sUsmbJ4GHxXw=;
	b=KEjC4UsSjIy86w6cFYyHTDT0gUUyuoPpie8fmWeBKoE7PERk6D5uGiuE67W1CcZ4
	FMipDT7tNAigxLq+m5BjI1Yb7UQxmFTqhr7W1WAS6W7gLfiiJuqxTROSa5lHa8EFsjo
	qirLVQAOiBgON6ZwNNHm8UWZsm4vV2VoK6wme1IE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793425338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hITNKHijs5At9JQyEQBRhsC0XjXg655sUsmbJ4GHxXw=;
	b=kcTM6H1zQCY22G6qviTLpTJL1JcG87PC2Vz3en5yw/5RjbSLSp1dMa+uVSkIBoYl
	5NFTFiTpYKZVWgczjRaElyECx8cve1pcmhpjzhk/Au4EMVPfK6vx93cwXf6KtmCGGhl
	HkFpdaQ7Oge8Kz3MGJwyAb2xCORd5M6onT/hrMxw=
Content-Type: multipart/mixed; boundary="===============8210810922643139678=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 336 SUCCEEDED
Message-ID: <010101a1907aefb3-bb0718e9-ac46-4af0-90cb-53df153e3a00-000000@us-west-2.amazonses.com>
Date: Sat, 31 Oct 2026 05:42:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.31-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 05:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249141

--===============8210810922643139678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *336* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-332-336.patch
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
From ce3ed61057e2a4a741d5fba0d2786f6671e69cfd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 31 Oct 2026 05:42:11 +0000
Subject: [PATCH] diffoscope: upgrade 332 -> 336

---
 .../diffoscope/{diffoscope_332.bb => diffoscope_336.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_332.bb => diffoscope_336.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_332.bb b/meta/recipes-support/diffoscope/diffoscope_336.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_332.bb
rename to meta/recipes-support/diffoscope/diffoscope_336.bb
index a43b20b460..03a3f37fe3 100644
--- a/meta/recipes-support/diffoscope/diffoscope_332.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_336.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "da858807ce2535f1bb5c3942020b01c7aef14f870257c964b70cd4e1f2333206"
+SRC_URI[sha256sum] = "eed72e799bcdb4c688b33c99e6174b216c0ddec711d5006f8bc6163f3ec030b0"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.47.1


--===============8210810922643139678==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-332-336.patch"

RnJvbSBjZTNlZDYxMDU3ZTJhNGE3NDFkNWZiYTBkMjc4NmY2NjcxZTY5Y2ZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMzEgT2N0IDIwMjYgMDU6NDI6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDMzMiAtPiAzMzYKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMzMyLmJiID0+IGRpZmZvc2NvcGVfMzM2LmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8zMzIuYmIgPT4gZGlmZm9zY29wZV8z
MzYuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzMzMi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8zMzYuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMzMi5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMzNi5iYgppbmRleCBhNDNiMjBi
NDYwLi4wM2EzZjM3ZmUzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMzMyLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8zMzYuYmIKQEAgLTEwLDcgKzEwLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vQ09QWUlORzttZDU9ZDMyMjM5YmNiNjczNDYzYWI4NzRlODBkNDdmYWU1MDQiCiAK
IGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGE4NTg4
MDdjZTI1MzVmMWJiNWMzOTQyMDIwYjAxYzdhZWYxNGY4NzAyNTdjOTY0YjcwY2Q0ZTFmMjMzMzIw
NiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlZWQ3MmU3OTliY2RiNGM2ODhiMzNjOTllNjE3NGIy
MTZjMGRkZWM3MTFkNTAwNmY4YmM2MTYzZjNlYzAzMGIwIgogCiBSREVQRU5EUzoke1BOfSArPSAi
XAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjQ3LjEKCg==

--===============8210810922643139678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 332 [default] to 336 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PV changed from "332" to "336"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 332 [default] to 336 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PV changed from "332" to "336"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 332 [default] to 336 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PV changed from "332" to "336"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 332 [default] to 336 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PV changed from "332" to "336"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PKGV changed from 332 [default] to 336 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PV changed from "332" to "336"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 332 [default] to 336 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "332" to "336"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1433312 to 1448530 (+1%)
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGV changed from 332 [default] to 336 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PV changed from "332" to "336"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-332.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-336.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/diffoscope-332.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-336.dist-info
packages/x86-64-v3-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-332.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-336.tar.gz"
packages/x86-64-v3-poky-linux/diffoscope: PKGV changed from 332 [default] to 336 [default]
packages/x86-64-v3-poky-linux/diffoscope: PV changed from "332" to "336"
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-332.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-336.dist-info

--===============8210810922643139678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-332.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-336.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/diffoscope-332.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-336.dist-info
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-332.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-336.dist-info

--===============8210810922643139678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1997 targets, 66 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-14f40322f992796768d88aa6dcb3b06facdf2634"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:14f40322f992796768d88aa6dcb3b06facdf2634"
meta-yocto-bsp       
meta-poky            = "master:dd6c2950bb507f8c311bd82410a032ed6eb38063"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 845 Local 747 Mirrors 0 Missed 98 Current 225 (88% match, 90% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 265 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 266 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_336.bb:do_populate_lic_setscene)
NOTE: Running setscene task 290 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 307 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 345 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 357 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_create_spdx_setscene)
NOTE: Running setscene task 364 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_package_qa_setscene)
NOTE: Running setscene task 366 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 375 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/scdoc/scdoc_1.11.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 381 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 391 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 407 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_create_spdx_setscene)
NOTE: Running setscene task 409 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patchelf/patchelf_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 416 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_packagedata_setscene)
NOTE: recipe diffoscope-336-r0: task do_populate_lic_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.44.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnu-config-native-20260629+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-1.12.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.197-r0: task do_create_spdx_setscene: Started
NOTE: recipe scdoc-native-1.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_package_qa_setscene: Started
NOTE: recipe patchelf-native-0.19.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe diffoscope-336-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 420 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/xxhash/xxhash_0.8.4.bb:do_packagedata_setscene)
NOTE: recipe libxt-1_1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnu-config-native-20260629+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 429 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe desktop-file-utils-0.28-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 430 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/xxhash/xxhash_0.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe scdoc-native-1.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 433 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 436 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libgcrypt-1.12.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 446 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_6.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.197-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 456 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_create_recipe_spdx_setscene)
NOTE: recipe patchelf-native-0.19.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.10-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 460 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 462 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 463 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/scdoc/scdoc_1.11.5.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-pytest-9.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 466 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb:do_packagedata_setscene)
NOTE: recipe xxhash-0.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xxhash-0.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_packagedata_setscene: Started
NOTE: recipe rpm-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 468 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_populate_sysroot_setscene)
NOTE: recipe desktop-file-utils-0.28-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgcrypt-1.12.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libarchive-3.8.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-1.12.4-r0: task do_packagedata_setscene: Started
NOTE: recipe scdoc-native-1.11.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 471 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe rpm-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 473 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patchelf/patchelf_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xxhash-0.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 474 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 480 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb:do_populate_sysroot_setscene)
NOTE: recipe desktop-file-utils-0.28-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xxhash-0.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 490 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_packagedata_setscene)
NOTE: recipe desktop-file-utils-0.28-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe scdoc-native-1.11.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 494 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 499 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 503 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: recipe libxt-1_1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.8.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 508 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_create_spdx_setscene)
NOTE: Running setscene task 509 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.12.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 526 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 528 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/xxhash/xxhash_0.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-magic-0.4.27-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.12.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe patchelf-native-0.19.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe file-5.48-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.197-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.14.10-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 530 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 532 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 534 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe xxhash-0.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe patchelf-native-0.19.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 535 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.48-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 542 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.197-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 551 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 556 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 563 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 564 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_packagedata_setscene)
NOTE: recipe xxhash-0.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 578 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.10.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libgcrypt-1.12.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 588 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.4.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 590 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: recipe lua-5.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 592 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libxt-1_1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 597 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe file-5.48-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 598 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_create_spdx_setscene)
NOTE: recipe lua-5.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 601 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.10-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 603 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_create_spdx_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 606 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.14.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 608 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_create_recipe_spdx_setscene)
NOTE: recipe file-5.48-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 613 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.8.10-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.54.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 614 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 615 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_spdx_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 617 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 620 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe binutils-2.47-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 625 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 626 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 628 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.14.10-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 629 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 630 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 631 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe gcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 633 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.4.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 634 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 638 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 642 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe cmake-native-4.4.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 647 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 648 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.12.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 649 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe cmake-native-4.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 650 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 654 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 656 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_package_setscene)
NOTE: recipe libgcrypt-1.12.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 657 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 660 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 664 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 665 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 669 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 670 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 671 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 674 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 679 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 683 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe coreutils-9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 685 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.20.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-native-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 687 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.4.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe sqlite3-3_3.54.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 694 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 698 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 699 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-native-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 702 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 704 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_packagedata_setscene)
NOTE: Running setscene task 705 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 709 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 710 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 712 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 713 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe cmake-native-4.4.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 718 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 720 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.49-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cmake-native-4.4.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 721 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 729 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.20.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 731 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 744 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 748 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 750 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/gettext/gettext_1.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe util-linux-2.42.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 751 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 752 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 754 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 757 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.42.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.49-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 759 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 762 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 764 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_package_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gettext-native-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 767 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 769 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 770 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 771 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 774 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gettext-native-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 777 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 780 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 785 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 791 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 795 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 797 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 798 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.49-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 799 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 801 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perl-native-5.44.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpcre2-10.49-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 806 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 808 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 809 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 810 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_packagedata_setscene)
NOTE: recipe perl-native-5.44.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpcre2-10.49-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 722 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_recipe_qa)
NOTE: Running setscene task 820 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 727 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.1.bb:do_fetch)
NOTE: Running task 728 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_fetch)
NOTE: Running setscene task 822 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 823 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 827 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 828 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.9.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 759 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_recipe_qa)
NOTE: recipe util-linux-2.42.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 830 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.49-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 831 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_recipe_qa: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Started
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lua-5.5.1-r0: task do_fetch: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 832 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_packagedata_setscene)
NOTE: recipe expat-2.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 834 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_recipe_qa: Started
NOTE: recipe expat-2.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.19-r0: task do_fetch: Succeeded
NOTE: Running setscene task 835 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_packagedata_setscene)
NOTE: recipe lua-5.5.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 838 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 840 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 843 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 847 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 850 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 852 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 853 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/bison/bison_3.8.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe util-linux-2.42.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 854 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 857 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.9.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 863 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 864 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_recipe_qa_setscene)
NOTE: recipe gnu-config-native-20260629+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.42.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 866 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_packagedata_setscene)
NOTE: recipe zlib-native-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 778 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_fetch)
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 868 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bison-native-3.8.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 869 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnu-config-native-20260629+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 781 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.1.bb:do_unpack)
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-native-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 794 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_unpack)
NOTE: Running task 795 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_fetch)
NOTE: recipe bison-native-3.8.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_fetch: Started
NOTE: Running setscene task 871 of 1070 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/flex/flex_2.6.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 870 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_336.bb:do_recipe_qa)
NOTE: Running task 875 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 876 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_6.0.2.bb:do_fetch)
NOTE: Running setscene task 873 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: Running task 890 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_recipe_qa)
NOTE: recipe lua-5.5.1-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 896 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_recipe_qa)
NOTE: Running task 900 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe lua-5.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-5.1-r0: task do_fetch: Succeeded
NOTE: Running task 901 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.1.bb:do_patch)
NOTE: Running task 902 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_unpack)
NOTE: recipe flex-native-2.6.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe diffoscope-336-r0: task do_recipe_qa: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe rpm-1_6.0.2-r0: task do_fetch: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vim-9.2.0993-r0: task do_recipe_qa: Started
NOTE: recipe popt-1.19-r0: task do_unpack: Succeeded
NOTE: Running setscene task 876 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_recipe_qa_setscene)
NOTE: Running task 903 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: Running task 904 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_recipe_qa: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe flex-native-2.6.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.5.1-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe popt-1.19-r0: task do_patch: Started
NOTE: Running task 1018 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1054 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: Running task 1062 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_patch)
NOTE: Running task 1073 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1091 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/debugedit/debugedit_5.3.bb:do_recipe_qa)
NOTE: recipe diffoscope-336-r0: task do_recipe_qa: Succeeded
NOTE: recipe vim-9.2.0993-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1092 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_336.bb:do_fetch)
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1098 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_fetch)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe lua-5.5.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 880 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_recipe_qa_setscene)
NOTE: Running task 1113 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_fetch)
NOTE: Running task 1114 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe perl-5.44.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: Running setscene task 882 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 884 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_patch: Started
NOTE: recipe rpm-1_6.0.2-r0: task do_fetch: Succeeded
NOTE: recipe debugedit-5.3-r0: task do_recipe_qa: Started
NOTE: recipe diffoscope-336-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_fetch: Started
NOTE: recipe diffoscope-336-r0: task do_fetch: Succeeded
NOTE: recipe vim-9.2.0993-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpam-1.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1302 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: Running task 1317 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_336.bb:do_unpack)
NOTE: Running task 1318 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_6.0.2.bb:do_unpack)
NOTE: Running task 1321 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1329 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: Running task 1330 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_check_backend)
NOTE: recipe binutils-2.47-r0: task do_package_setscene: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 889 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 890 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_packagedata_setscene)
NOTE: recipe debugedit-5.3-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 891 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_populate_sysroot_setscene)
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe diffoscope-336-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_check_backend: Started
NOTE: recipe rpm-1_6.0.2-r0: task do_unpack: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_check_backend: Succeeded
NOTE: Running task 1336 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/debugedit/debugedit_5.3.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe binutils-2.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1383 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe elfutils-0.197-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lua-5.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 894 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.1.bb:do_deploy_source_date_epoch unihash changed to add5f815fb8417689f24e0b72e29a4cdf19062f7e14f741d680b47092d52c3f0
NOTE: recipe python3-libarchive-c-5.1-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-336-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.197-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe debugedit-5.3-r0: task do_fetch: Started
NOTE: recipe binutils-2.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe debugedit-5.3-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 885 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_recipe_qa_setscene)
NOTE: Running task 1407 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1408 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_check_backend)
NOTE: Running task 1409 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_336.bb:do_patch)
NOTE: Running task 1410 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/debugedit/debugedit_5.3.bb:do_unpack)
NOTE: recipe popt-1.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_deploy_source_date_epoch unihash changed to 97092198c0b999f0fc1cce7bb00087ccad3e3420cbb6a51c119469fd65cfd590
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.197-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch unihash changed to ed5af30257f28f3bbafa08fe44783eab49f7bde124c32c49ffe78c9f00c6718f
NOTE: recipe squashfs-tools-4.7.5-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-336-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_check_backend: Started
NOTE: recipe debugedit-5.3-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_check_backend: Succeeded
NOTE: Running setscene task 890 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 891 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 892 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 895 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 896 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 898 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 899 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 901 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.197-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 903 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_populate_sysroot_setscene)
NOTE: recipe debugedit-5.3-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 905 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 906 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe diffoscope-336-r0: task do_patch: Succeeded
NOTE: Running setscene task 907 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_deploy_source_date_epoch unihash changed to 789e2bea64beaba3805b6859aa531a31d89b37219b3d898f908b5bb9696a4a01
NOTE: Running setscene task 895 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.10.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.54.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libarchive/3.8.10/temp/log.do_packagedata_setscene.2234497
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.10.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 897 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 902 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 907 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 908 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.10.bb:do_package_setscene)
NOTE: Running setscene task 920 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 921 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 923 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 924 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 926 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 927 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 928 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 933 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.197-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.10-r0: task do_package_setscene: Started
NOTE: recipe rpm-1_6.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1453 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_fetch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.197-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.54.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1487 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_6.0.2.bb:do_patch)
NOTE: Running task 1488 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_unpack)
NOTE: Running task 1489 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_336.bb:do_deploy_source_date_epoch)
NOTE: Running task 1490 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1491 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_336.bb:do_check_backend)
NOTE: Running setscene task 935 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 937 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 939 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 940 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 942 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 944 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.47-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe diffoscope-336-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe rpm-1_6.0.2-r0: task do_patch: Started
NOTE: recipe binutils-2.47-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-336-r0: task do_check_backend: Started
NOTE: Running setscene task 945 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_populate_sysroot_setscene)
NOTE: recipe diffoscope-336-r0: task do_check_backend: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 946 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 948 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_packagedata_setscene)
NOTE: recipe file-5.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running setscene task 949 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_packagedata_setscene)
NOTE: recipe openssl-4.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 950 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 951 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1507 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_unpack)
NOTE: Running task 1508 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 953 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-4.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 956 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_recipe_qa_setscene)
NOTE: recipe diffoscope-336-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1509 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/debugedit/debugedit_5.3.bb:do_patch)
NOTE: recipe binutils-2.47-r0: task do_unpack: Started
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: Running setscene task 958 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1510 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_create_recipe_spdx)
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 960 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.23.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 961 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 964 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_populate_sysroot_setscene)
NOTE: recipe debugedit-5.3-r0: task do_patch: Started
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 966 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 968 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 969 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.23.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 970 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe debugedit-5.3-r0: task do_patch: Succeeded
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 971 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe lz4-1_1.10.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 975 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 976 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 977 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 979 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 980 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_packagedata_setscene)
NOTE: recipe lz4-1_1.10.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running setscene task 982 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-4.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe squashfs-tools-4.7.5-r0: task do_unpack: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1526 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_unpack)
NOTE: Running setscene task 983 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 985 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1528 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_patch)
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1535 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe lz4-1_1.10.0-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_patch: Started
NOTE: Running task 1546 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/debugedit/debugedit_5.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1548 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.1.bb:do_create_recipe_spdx)
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1554 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_create_recipe_spdx)
NOTE: Running task 1558 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_336.bb:do_create_recipe_spdx)
NOTE: recipe libunistring-1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1562 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_create_recipe_spdx)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 989 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1568 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_create_recipe_spdx)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_patch: Succeeded
NOTE: Running task 1569 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_deploy_source_date_epoch)
NOTE: recipe debugedit-5.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe openssl-4.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 991 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe lua-5.5.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe popt-1.19-r0: task do_create_recipe_spdx: Started
NOTE: recipe diffoscope-336-r0: task do_create_recipe_spdx: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vim-9.2.0993-r0: task do_create_recipe_spdx: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 992 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe binutils-2.47-r0: task do_create_recipe_spdx: Started
NOTE: recipe rpm-1_6.0.2-r0: task do_patch: Succeeded
NOTE: recipe openssl-4.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 994 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running task 1575 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_6.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-4.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1581 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_6.0.2.bb:do_generate_toolchain_file)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rpm-1_6.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.5.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe popt-1.19-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe diffoscope-336-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe debugedit-5.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1582 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_create_recipe_spdx)
NOTE: Running task 1583 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_create_recipe_spdx)
NOTE: Running task 1584 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_6.0.2.bb:do_create_recipe_spdx)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/debugedit/debugedit_5.3.bb:do_deploy_source_date_epoch unihash changed to a37621fd65198ea212fb7cbb2e82ffb38be82ad351e7dad6d44a9d225cb73091
NOTE: recipe vim-9.2.0993-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rpm-1_6.0.2-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1590 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_create_recipe_spdx)
NOTE: recipe binutils-2.47-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libunistring-1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 996 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_recipe_qa_setscene)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_create_recipe_spdx: Started
NOTE: recipe rpm-1_6.0.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe rpm-1_6.0.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe python3-libarchive-c-5.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe libunistring-1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rpm-1_6.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_6.0.2.bb:do_deploy_source_date_epoch unihash changed to 386e0bdabc46e439858af462b634815192c3c913c4f6a0b18980a04082e5e924
NOTE: recipe libunistring-1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.8.10-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 990 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 993 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 997 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1001 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1002 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1003 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1004 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-magic-0.4.27-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1005 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1006 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_packagedata_setscene)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-libarchive-c-5.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1007 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1008 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe rpm-1_6.0.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1597 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_patch: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1012 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1014 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_deploy_source_date_epoch unihash changed to 2ff650ae8ecc4dd2ddba44ebde1076289297ba51bae3f02eea09192187cf062d
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1017 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1020 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1021 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1022 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1025 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_patch: Succeeded
NOTE: Running task 1608 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1027 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1029 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1030 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1031 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_deploy_source_date_epoch unihash changed to 95f2232a174fd080ebaecf3fa2ff12b5a078316163e43e0fd578b1963efe2489
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1033 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1035 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1037 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1038 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1040 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1042 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1043 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1045 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running setscene task 1047 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1048 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1049 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1050 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1052 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1646 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1056 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1059 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1060 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1061 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7e86448afe1b3e8fcf2e9f542240cb9b328cc75e1ab3c65f36609a2d1377b4f7
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1066 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1068 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1070 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2059 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2061 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2062 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2127 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2147 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.10.bb:do_packagedata)
NOTE: Running task 2253 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_prepare_recipe_sysroot)
NOTE: recipe lz4-1_1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2275 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_336.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2276 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2337 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/debugedit/debugedit_5.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.8.10-r0: task do_packagedata: Started
NOTE: recipe binutils-2.47-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-336-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2408 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_configure)
NOTE: recipe lua-5.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe debugedit-5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2409 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.1.bb:do_configure)
NOTE: recipe lz4-1_1.10.0-r0: task do_configure: Started
NOTE: recipe popt-1.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.5.1-r0: task do_configure: Started
NOTE: Running task 2410 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_configure)
NOTE: recipe libarchive-3.8.10-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 2415 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_configure_ptest_base)
NOTE: recipe lua-5.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2416 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.1.bb:do_configure_ptest_base)
NOTE: recipe debugedit-5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2417 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/debugedit/debugedit_5.3.bb:do_configure)
NOTE: recipe lz4-1_1.10.0-r0: task do_configure_ptest_base: Started
NOTE: recipe lua-5.5.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2418 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_configure)
NOTE: recipe lz4-1_1.10.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe diffoscope-336-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2419 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_compile)
NOTE: recipe binutils-2.47-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.5.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2420 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe debugedit-5.3-r0: task do_configure: Started
NOTE: Running task 2421 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_336.bb:do_configure)
NOTE: Running task 2422 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.1.bb:do_compile)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_configure: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe diffoscope-336-r0: task do_configure: Started
NOTE: recipe lua-5.5.1-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: recipe diffoscope-336-r0: task do_configure: Succeeded
NOTE: Running task 2423 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_configure_ptest_base)
NOTE: Running task 2424 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_336.bb:do_compile)
NOTE: Running task 2425 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_configure_ptest_base: Started
NOTE: recipe diffoscope-336-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2426 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_compile)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 2427 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe diffoscope-336-r0: task do_compile: Succeeded
NOTE: Running task 2428 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_336.bb:do_install)
NOTE: recipe lua-5.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2429 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.1.bb:do_compile_ptest_base)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_compile: Succeeded
NOTE: Running task 2430 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_compile_ptest_base)
NOTE: recipe diffoscope-336-r0: task do_install: Started
NOTE: recipe lua-5.5.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.5.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2431 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.1.bb:do_install)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2432 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_install)
NOTE: recipe lua-5.5.1-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2433 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: Running task 2434 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_populate_sysroot)
NOTE: recipe python3-magic-0.4.27-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.5.1-r0: task do_install: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: Running task 2435 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.1.bb:do_install_ptest_base)
NOTE: recipe lua-5.5.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_install: Succeeded
NOTE: Running task 2436 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_install_ptest_base)
NOTE: recipe diffoscope-336-r0: task do_install: Succeeded
NOTE: recipe lua-5.5.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2437 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.1.bb:do_package)
NOTE: Running task 2438 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.1.bb:do_populate_sysroot)
NOTE: Running task 2439 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_336.bb:do_package)
NOTE: Running task 2440 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_336.bb:do_populate_sysroot)
NOTE: recipe python3-magic-0.4.27-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-5.1-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.5.1-r0: task do_package: Started
NOTE: recipe diffoscope-336-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-336-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2441 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_package)
NOTE: Running task 2442 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_populate_sysroot)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_package: Started
NOTE: recipe lua-5.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.1.bb:do_populate_sysroot unihash changed to ff418c0eae5dcd77d85d594fe47076c0be423c97b7df65aab8a0669e5a195c87
NOTE: recipe diffoscope-336-r0: task do_populate_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-libarchive-c-5.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: Running task 2443 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata unihash changed to a84dabbae1daa6a6d8c11263f31de2bb5ea8776d8f49178d7f974cd8d87244da
NOTE: Setscene tasks completed
NOTE: Running task 2444 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_create_spdx)
NOTE: Running task 2445 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_ipk)
NOTE: Running task 2446 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_deb)
NOTE: Running task 2447 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: Running task 2448 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_qa)
NOTE: recipe python3-magic-0.4.27-r0: task do_create_spdx: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_ipk: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_deb: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_qa: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-libarchive-c-5.1-r0: task do_package: Succeeded
NOTE: Running task 2449 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_packagedata)
NOTE: recipe diffoscope-336-r0: task do_package: Succeeded
NOTE: Running task 2450 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_336.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_qa: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_qa unihash changed to cf13081f2124a3f2aa4b9d7b03c013975107b7f600cd32f90f8bf8996cfa0f25
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_ipk unihash changed to 609aaaa154ef37355560384c70454a167850f8d26aafc4f33198ce0942306e99
NOTE: recipe diffoscope-336-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_deb unihash changed to 778bcce0d60ac883e5c1f6a57afdefa983d28670261b6e8f1cdc6b756685b8e4
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm unihash changed to 2fade014fc619c9c5a40b1a3b1dc91d560039b86e022d95808898c4c2e5dc4f3
NOTE: recipe python3-libarchive-c-5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2451 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_create_spdx)
NOTE: Running task 2452 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_package_write_ipk)
NOTE: Running task 2453 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_package_write_deb)
NOTE: Running task 2454 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_package_write_rpm)
NOTE: Running task 2455 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_package_qa)
NOTE: recipe diffoscope-336-r0: task do_packagedata: Succeeded
NOTE: Running task 2456 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_336.bb:do_create_spdx)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_create_spdx: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_package_write_ipk: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_package_write_deb: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_package_qa: Started
NOTE: recipe diffoscope-336-r0: task do_create_spdx: Started
NOTE: recipe debugedit-5.3-r0: task do_configure: Succeeded
NOTE: Running task 2457 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/debugedit/debugedit_5.3.bb:do_compile)
NOTE: recipe lua-5.5.1-r0: task do_package: Succeeded
NOTE: recipe python3-libarchive-c-5.1-r0: task do_create_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.1.bb:do_package unihash changed to a1431d603bfc37421d9227569ecc833bb134f1527695e9e2d6939238165376ed
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.1.bb:do_packagedata became valid
NOTE: Running setscene task 1070 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.1.bb:do_packagedata_setscene)
NOTE: recipe debugedit-5.3-r0: task do_compile: Started
NOTE: recipe diffoscope-336-r0: task do_create_spdx: Succeeded
NOTE: recipe lua-5.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-libarchive-c-5.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-libarchive-c-5.1-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb:do_package_qa unihash changed to edd06be3df62b2deb0764efa839f2e472af25cc746b5fc67a16e51ab2be7c5a5
NOTE: recipe python3-libarchive-c-5.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe lua-5.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2459 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.1.bb:do_create_spdx)
NOTE: recipe python3-libarchive-c-5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lua-5.5.1-r0: task do_create_spdx: Started
NOTE: recipe lua-5.5.1-r0: task do_create_spdx: Succeeded
NOTE: recipe popt-1.19-r0: task do_configure: Succeeded
NOTE: Running task 2460 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_configure_ptest_base)
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Started
NOTE: recipe popt-1.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2461 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_compile)
NOTE: recipe popt-1.19-r0: task do_compile: Started
NOTE: recipe debugedit-5.3-r0: task do_compile: Succeeded
NOTE: Running task 2462 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/debugedit/debugedit_5.3.bb:do_install)
NOTE: recipe debugedit-5.3-r0: task do_install: Started
NOTE: recipe debugedit-5.3-r0: task do_install: Succeeded
NOTE: Running task 2463 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/debugedit/debugedit_5.3.bb:do_package)
NOTE: recipe debugedit-5.3-r0: task do_package: Started
NOTE: recipe popt-1.19-r0: task do_compile: Succeeded
NOTE: Running task 2464 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_compile_ptest_base)
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Started
NOTE: recipe binutils-2.47-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2465 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_patch)
NOTE: Running task 2466 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_install)
NOTE: recipe binutils-2.47-r0: task do_patch: Started
NOTE: recipe popt-1.19-r0: task do_install: Started
NOTE: recipe binutils-2.47-r0: task do_patch: Succeeded
NOTE: Running task 2468 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_configure)
NOTE: recipe binutils-2.47-r0: task do_configure: Started
NOTE: recipe popt-1.19-r0: task do_install: Succeeded
NOTE: Running task 2469 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_install_ptest_base)
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Started
NOTE: recipe debugedit-5.3-r0: task do_package: Succeeded
NOTE: recipe popt-1.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2470 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/debugedit/debugedit_5.3.bb:do_packagedata)
NOTE: Running task 2471 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_package)
NOTE: Running task 2472 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot)
NOTE: recipe debugedit-5.3-r0: task do_packagedata: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.19-r0: task do_package: Started
NOTE: recipe debugedit-5.3-r0: task do_packagedata: Succeeded
NOTE: recipe popt-1.19-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot unihash changed to a61b19e14a5557d83881cb2aa0338506f7c320aad3c8a09e4a644c7507e57693
NOTE: Setscene tasks completed
NOTE: Running task 2473 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_6.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_6.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2474 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_compile_ptest_base)
NOTE: recipe rpm-1_6.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2475 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_6.0.2.bb:do_configure)
NOTE: recipe lz4-1_1.10.0-r0: task do_compile_ptest_base: Started
NOTE: recipe rpm-1_6.0.2-r0: task do_configure: Started
NOTE: recipe binutils-2.47-r0: task do_configure: Succeeded
NOTE: Running task 2476 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_compile)
NOTE: recipe binutils-2.47-r0: task do_compile: Started
NOTE: recipe popt-1.19-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_package unihash changed to 5fbf2ed4ae071b33c6e3bd150fcc77cf78945ba135923ed6f137eef735c70be8
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_packagedata became valid
NOTE: Running setscene task 1070 of 1070 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_packagedata_setscene)
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2478 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx)
NOTE: recipe popt-1.19-r0: task do_create_spdx: Started
NOTE: recipe popt-1.19-r0: task do_create_spdx: Succeeded
NOTE: recipe vim-9.2.0993-r0: task do_fetch: Succeeded
NOTE: Running task 2479 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_unpack)
NOTE: Running task 2480 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.2.0993-r0: task do_unpack: Started
NOTE: recipe vim-9.2.0993-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2481 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_install)
NOTE: recipe vim-9.2.0993-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lz4-1_1.10.0-r0: task do_install: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_install: Succeeded
NOTE: Running task 2482 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_install_ptest_base)
NOTE: recipe lz4-1_1.10.0-r0: task do_install_ptest_base: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2483 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_package)
NOTE: Running task 2484 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_populate_sysroot)
NOTE: recipe lz4-1_1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_package: Started
NOTE: recipe rpm-1_6.0.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2485 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_6.0.2.bb:do_compile)
NOTE: recipe rpm-1_6.0.2-r0: task do_compile: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2486 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.2.0993-r0: task do_unpack: Succeeded
NOTE: Running task 2487 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_patch)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-9.2.0993-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2488 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_configure)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_configure: Started
NOTE: recipe vim-9.2.0993-r0: task do_patch: Succeeded
NOTE: Running task 2489 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_configure: Succeeded
NOTE: Running task 2490 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_compile)
NOTE: recipe vim-9.2.0993-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_compile: Started
NOTE: recipe vim-9.2.0993-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_deploy_source_date_epoch unihash changed to f13299f9a059e91f2d4884e5d9dff43c1c1b46adb9fade163bf16a17976926fc
NOTE: Setscene tasks completed
NOTE: Running task 2491 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_configure)
NOTE: recipe vim-9.2.0993-r0: task do_configure: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_package: Succeeded
NOTE: Running task 2492 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_packagedata)
NOTE: recipe lz4-1_1.10.0-r0: task do_packagedata: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_packagedata unihash changed to e5ae26c1beb8579e42ccfe3d1a62ea94127b0b97cedd0c5390537db66909cd0e
NOTE: Setscene tasks completed
NOTE: Running task 2493 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/lz4/lz4_1.10.0.bb:do_create_spdx)
NOTE: recipe lz4-1_1.10.0-r0: task do_create_spdx: Started
NOTE: recipe lz4-1_1.10.0-r0: task do_create_spdx: Succeeded
NOTE: recipe squashfs-tools-4.7.5-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2494 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_install)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_install: Succeeded
NOTE: Running task 2495 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_package)
NOTE: Running task 2496 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_populate_sysroot)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_populate_sysroot: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_package: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.7.5-r0: task do_package: Succeeded
NOTE: Running task 2497 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2498 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_create_spdx)
NOTE: Running task 2499 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_package_write_ipk)
NOTE: Running task 2500 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_package_write_deb)
NOTE: Running task 2501 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_package_write_rpm)
NOTE: Running task 2502 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_package_qa)
NOTE: recipe squashfs-tools-4.7.5-r0: task do_create_spdx: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_package_write_deb: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_package_write_ipk: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_package_qa: Started
NOTE: recipe squashfs-tools-4.7.5-r0: task do_create_spdx: Succeeded
NOTE: recipe squashfs-tools-4.7.5-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb:do_package_qa unihash changed to 8d13578a17a7938869307e4990ebc44ac74d8d9781931182670f86649d1affb4
NOTE: recipe squashfs-tools-4.7.5-r0: task do_package_write_deb: Succeeded
NOTE: recipe squashfs-tools-4.7.5-r0: task do_package_write_ipk: Succeeded
NOTE: recipe squashfs-tools-4.7.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_6.0.2-r0: task do_compile: Succeeded
NOTE: Running task 2503 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_6.0.2.bb:do_install)
NOTE: recipe rpm-1_6.0.2-r0: task do_install: Started
NOTE: recipe vim-9.2.0993-r0: task do_configure: Succeeded
NOTE: Running task 2504 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_compile)
NOTE: recipe vim-9.2.0993-r0: task do_compile: Started
NOTE: recipe rpm-1_6.0.2-r0: task do_install: Succeeded
NOTE: Running task 2505 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_6.0.2.bb:do_package)
NOTE: Running task 2506 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_6.0.2.bb:do_populate_sysroot)
NOTE: recipe rpm-1_6.0.2-r0: task do_package: Started
NOTE: recipe rpm-1_6.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_6.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_6.0.2-r0: task do_package: Succeeded
NOTE: Running task 2507 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_6.0.2.bb:do_packagedata)
NOTE: recipe rpm-1_6.0.2-r0: task do_packagedata: Started
NOTE: recipe rpm-1_6.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2508 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_6.0.2.bb:do_create_spdx)
NOTE: Running task 2509 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_6.0.2.bb:do_package_write_ipk)
NOTE: Running task 2510 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_6.0.2.bb:do_package_write_deb)
NOTE: Running task 2511 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_6.0.2.bb:do_package_write_rpm)
NOTE: Running task 2512 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_6.0.2.bb:do_package_qa)
NOTE: recipe rpm-1_6.0.2-r0: task do_create_spdx: Started
NOTE: recipe rpm-1_6.0.2-r0: task do_package_write_ipk: Started
NOTE: recipe rpm-1_6.0.2-r0: task do_package_write_deb: Started
NOTE: recipe rpm-1_6.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_6.0.2-r0: task do_package_qa: Started
NOTE: recipe rpm-1_6.0.2-r0: task do_create_spdx: Succeeded
NOTE: recipe rpm-1_6.0.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe rpm-1_6.0.2-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_6.0.2.bb:do_package_qa unihash changed to 7221d7a0593992a1afc59cc1fe5b0eafe86e784b537a6cdc803e66bc55b32e3b
NOTE: recipe rpm-1_6.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-9.2.0993-r0: task do_compile: Succeeded
NOTE: Running task 2513 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_install)
NOTE: recipe vim-9.2.0993-r0: task do_install: Started
NOTE: recipe rpm-1_6.0.2-r0: task do_package_write_deb: Succeeded
NOTE: recipe vim-9.2.0993-r0: task do_install: Succeeded
NOTE: Running task 2514 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_package)
NOTE: Running task 2515 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_populate_sysroot)
NOTE: recipe vim-9.2.0993-r0: task do_populate_sysroot: Started
NOTE: recipe vim-9.2.0993-r0: task do_package: Started
NOTE: recipe vim-9.2.0993-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vim-9.2.0993-r0: task do_package: Succeeded
NOTE: Running task 2516 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_packagedata)
NOTE: recipe vim-9.2.0993-r0: task do_packagedata: Started
NOTE: recipe vim-9.2.0993-r0: task do_packagedata: Succeeded
NOTE: Running task 2517 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_create_spdx)
NOTE: Running task 2518 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_package_write_ipk)
NOTE: Running task 2519 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_package_write_deb)
NOTE: Running task 2520 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_package_write_rpm)
NOTE: Running task 2521 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_package_qa)
NOTE: recipe vim-9.2.0993-r0: task do_create_spdx: Started
NOTE: recipe vim-9.2.0993-r0: task do_package_write_ipk: Started
NOTE: recipe vim-9.2.0993-r0: task do_package_write_deb: Started
NOTE: recipe vim-9.2.0993-r0: task do_package_write_rpm: Started
NOTE: recipe vim-9.2.0993-r0: task do_package_qa: Started
NOTE: recipe vim-9.2.0993-r0: task do_package_write_ipk: Succeeded
NOTE: recipe vim-9.2.0993-r0: task do_create_spdx: Succeeded
NOTE: recipe vim-9.2.0993-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_package_qa unihash changed to bd2b397f93b2deb6cfabaa8e1b8fe73331ac98289db2950de3b3864ea4b31157
NOTE: recipe binutils-2.47-r0: task do_compile: Succeeded
NOTE: Running task 2522 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_install)
NOTE: recipe binutils-2.47-r0: task do_install: Started
NOTE: recipe vim-9.2.0993-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-9.2.0993-r0: task do_package_write_deb: Succeeded
NOTE: recipe binutils-2.47-r0: task do_install: Succeeded
NOTE: Running task 2525 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_populate_sysroot)
NOTE: Running task 2526 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_package_write_ipk)
NOTE: Running task 2527 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_package_write_deb)
NOTE: Running task 2528 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_package_write_rpm)
NOTE: Running task 2529 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_package_qa)
NOTE: Running task 2534 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_336.bb:do_package_write_ipk)
NOTE: Running task 2535 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_336.bb:do_package_write_deb)
NOTE: recipe binutils-2.47-r0: task do_populate_sysroot: Started
NOTE: Running task 2536 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_336.bb:do_package_write_rpm)
NOTE: Running task 2537 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_336.bb:do_package_qa)
NOTE: recipe binutils-2.47-r0: task do_package_write_ipk: Started
NOTE: recipe binutils-2.47-r0: task do_package_write_deb: Started
NOTE: recipe binutils-2.47-r0: task do_package_write_rpm: Started
NOTE: recipe binutils-2.47-r0: task do_package_qa: Started
NOTE: recipe diffoscope-336-r0: task do_package_write_ipk: Started
NOTE: recipe diffoscope-336-r0: task do_package_write_deb: Started
NOTE: recipe diffoscope-336-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-336-r0: task do_package_qa: Started
NOTE: recipe binutils-2.47-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2538 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_create_spdx)
NOTE: recipe binutils-2.47-r0: task do_create_spdx: Started
NOTE: recipe diffoscope-336-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-336-r0: task do_package_write_ipk: Succeeded
NOTE: recipe diffoscope-336-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-336-r0: task do_package_write_deb: Succeeded
NOTE: recipe binutils-2.47-r0: task do_package_write_ipk: Succeeded
NOTE: recipe binutils-2.47-r0: task do_create_spdx: Succeeded
NOTE: Running task 2539 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_336.bb:do_create_package_spdx)
NOTE: recipe binutils-2.47-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-336-r0: task do_create_package_spdx: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_package_qa unihash changed to 9448a9f5112ccbbabdc4dd56d17e590ae0a4f5aa904152ef34c0548a82bd078f
NOTE: recipe diffoscope-336-r0: task do_create_package_spdx: Succeeded
NOTE: recipe binutils-2.47-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.47-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 2540 of 2540 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/diffoscope/diffoscope_336.bb:do_build)
NOTE: Tasks Summary: Attempted 2540 tasks of which 2343 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 11 ERROR messages, returning a non-zero exit code.
ERROR: libarchive-3.8.10-r0 do_packagedata_setscene: QA Issue: Package version for package libarchive-src went backwards which would break package feeds (from 0:3.8.11-r0 to 0:3.8.10-r0) [version-going-backwards]
ERROR: libarchive-3.8.10-r0 do_packagedata_setscene: QA Issue: Package version for package libarchive-dbg went backwards which would break package feeds (from 0:3.8.11-r0 to 0:3.8.10-r0) [version-going-backwards]
ERROR: libarchive-3.8.10-r0 do_packagedata_setscene: QA Issue: Package version for package bsdcpio went backwards which would break package feeds (from 0:3.8.11-r0 to 0:3.8.10-r0) [version-going-backwards]
ERROR: libarchive-3.8.10-r0 do_packagedata_setscene: QA Issue: Package version for package bsdtar went backwards which would break package feeds (from 0:3.8.11-r0 to 0:3.8.10-r0) [version-going-backwards]
ERROR: libarchive-3.8.10-r0 do_packagedata_setscene: QA Issue: Package version for package libarchive-ptest went backwards which would break package feeds (from 0:3.8.11-r0 to 0:3.8.10-r0) [version-going-backwards]
ERROR: libarchive-3.8.10-r0 do_packagedata_setscene: QA Issue: Package version for package libarchive-staticdev went backwards which would break package feeds (from 0:3.8.11-r0 to 0:3.8.10-r0) [version-going-backwards]
ERROR: libarchive-3.8.10-r0 do_packagedata_setscene: QA Issue: Package version for package libarchive-dev went backwards which would break package feeds (from 0:3.8.11-r0 to 0:3.8.10-r0) [version-going-backwards]
ERROR: libarchive-3.8.10-r0 do_packagedata_setscene: QA Issue: Package version for package libarchive-doc went backwards which would break package feeds (from 0:3.8.11-r0 to 0:3.8.10-r0) [version-going-backwards]
ERROR: libarchive-3.8.10-r0 do_packagedata_setscene: QA Issue: Package version for package libarchive-locale went backwards which would break package feeds (from 0:3.8.11-r0 to 0:3.8.10-r0) [version-going-backwards]
ERROR: libarchive-3.8.10-r0 do_packagedata_setscene: QA Issue: Package version for package libarchive went backwards which would break package feeds (from 0:3.8.11-r0 to 0:3.8.10-r0) [version-going-backwards]
ERROR: libarchive-3.8.10-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8210810922643139678==--
