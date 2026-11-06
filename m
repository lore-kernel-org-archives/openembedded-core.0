Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.471.1793944900168934914
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 22:01:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ahsVHFJK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=JhtIM88k;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a1af72ceaf-957a713a-2b3b-4dc2-8d38-74a7063be7ff-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793944899;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8BT6viMJVjoXbmM7RJJCabcx0DlHDQuuY5jsBNRmobU=;
	b=ahsVHFJKibgvt8O4IHtgec1Lq4Rime/BRvD5fbJfIDC/vwUBC3fGqIDuM3dioonZ
	GBUahveXGBq3VXc7JRtz/ytvzV/kmZRl7S/Ly9b7nl5klSb/FLqjtqtlIBRww1jr1Fo
	rERVlwxM46+J0I12fY6xuWYF23uKTQvT7gEChqwM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793944899;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8BT6viMJVjoXbmM7RJJCabcx0DlHDQuuY5jsBNRmobU=;
	b=JhtIM88kSHCH8XcivJHc77s4b9r1+FMAIkzJqpD0am4Tr8ZwKMu8mxYj2uHkFae1
	eG7r+qo/qOsUkopUoTb5fp6f8H5a3IXDgI6HzEHa5WRE4ihT3JE+r4HLNLCSeumIiJY
	7+DZWQpLf/uTVljKLrD6BG4hNXCe/cugDNmTfaxQ=
Content-Type: multipart/mixed; boundary="===============8677698798161489474=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonpointer: upgrading to 3.9 SUCCEEDED
Message-ID: <010101a1af72ceaf-957a713a-2b3b-4dc2-8d38-74a7063be7ff-000000@us-west-2.amazonses.com>
Date: Fri, 6 Nov 2026 06:01:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.06-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 06:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249592

--===============8677698798161489474==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-jsonpointer* to *3.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jsonpointer-upgrade-3.8-3.9.patch
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
From eec7d2fd91e078117942ce16cbe3eb564b3bf1e6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 6 Nov 2026 05:45:58 +0000
Subject: [PATCH] python3-jsonpointer: upgrade 3.8 -> 3.9

---
 .../{python3-jsonpointer_3.8.bb => python3-jsonpointer_3.9.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonpointer_3.8.bb => python3-jsonpointer_3.9.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-jsonpointer_3.8.bb b/meta/recipes-devtools/python/python3-jsonpointer_3.9.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-jsonpointer_3.8.bb
rename to meta/recipes-devtools/python/python3-jsonpointer_3.9.bb
index b9fdf6347e..56256a1a18 100644
--- a/meta/recipes-devtools/python/python3-jsonpointer_3.8.bb
+++ b/meta/recipes-devtools/python/python3-jsonpointer_3.9.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi ptest setuptools3
 
-SRC_URI[sha256sum] = "a627a255641390bfb4d51d4cfbb90648078ae855b45804ef7e19ea13a4cca355"
+SRC_URI[sha256sum] = "b4c52dd58837669881f9677c0e83d73fa0b369feb67563ec4a8b1c13eb3c5a23"
 
 SRC_URI += " \
 	file://run-ptest \
-- 
2.47.1


--===============8677698798161489474==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-jsonpointer: PKGV changed from 3.8 [default] to 3.9 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jsonpointer/jsonpointer-3.8.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/j/jsonpointer/jsonpointer-3.9.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/python3-jsonpointer: PV changed from "3.8" to "3.9"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dbg: PKGV changed from 3.8 [default] to 3.9 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dbg: PV changed from "3.8" to "3.9"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dev: PKGV changed from 3.8 [default] to 3.9 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-dev: PV changed from "3.8" to "3.9"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-doc: PKGV changed from 3.8 [default] to 3.9 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-doc: PV changed from "3.8" to "3.9"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-locale: PKGV changed from 3.8 [default] to 3.9 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-locale: PV changed from "3.8" to "3.9"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGSIZE changed from 49029 to 51265 (+5%)
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PKGV changed from 3.8 [default] to 3.9 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-ptest: PV changed from "3.8" to "3.9"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-src: PKGV changed from 3.8 [default] to 3.9 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-src: PV changed from "3.8" to "3.9"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-staticdev: PKGV changed from 3.8 [default] to 3.9 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer-staticdev: PV changed from "3.8" to "3.9"
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PKGSIZE changed from 41996 to 42100 (+0%)
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: FILELIST: directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/licenses -> /usr/lib/python3.14/site-packages/jsonpointer-3.9.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info -> /usr/lib/python3.14/site-packages/jsonpointer-3.9.dist-info
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PKGV changed from 3.8 [default] to 3.9 [default]
packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: PV changed from "3.8" to "3.9"
Changes to packages/x86-64-v3-poky-linux/python3-jsonpointer (sysroot):
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info moved to /usr/lib/python3.14/site-packages/jsonpointer-3.9.dist-info

--===============8677698798161489474==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jsonpointer-upgrade-3.8-3.9.patch"

RnJvbSBlZWM3ZDJmZDkxZTA3ODExNzk0MmNlMTZjYmUzZWI1NjRiM2JmMWU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgNiBOb3YgMjAyNiAwNTo0NTo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtanNvbnBvaW50ZXI6IHVwZ3JhZGUgMy44IC0+IDMuOQoKLS0tCiAuLi4ve3B5dGhvbjMt
anNvbnBvaW50ZXJfMy44LmJiID0+IHB5dGhvbjMtanNvbnBvaW50ZXJfMy45LmJifSAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWpzb25wb2ludGVyXzMuOC5iYiA9
PiBweXRob24zLWpzb25wb2ludGVyXzMuOS5iYn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnBvaW50ZXJfMy44LmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWpzb25wb2ludGVyXzMuOS5iYgpzaW1pbGFy
aXR5IGluZGV4IDg5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtanNvbnBvaW50ZXJfMy44LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtanNvbnBvaW50ZXJfMy45LmJiCmluZGV4IGI5ZmRmNjM0N2UuLjU2MjU2
YTFhMTggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1q
c29ucG9pbnRlcl8zLjguYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWpzb25wb2ludGVyXzMuOS5iYgpAQCAtNSw3ICs1LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PTMyYjE1Yzg0M2I3YTMyOTEzMGY0ZTI2NmEyODFlYmIz
IgogCiBpbmhlcml0IHB5cGkgcHRlc3Qgc2V0dXB0b29sczMKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImE2MjdhMjU1NjQxMzkwYmZiNGQ1MWQ0Y2ZiYjkwNjQ4MDc4YWU4NTViNDU4MDRlZjdlMTll
YTEzYTRjY2EzNTUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjRjNTJkZDU4ODM3NjY5ODgxZjk2
NzdjMGU4M2Q3M2ZhMGIzNjlmZWI2NzU2M2VjNGE4YjFjMTNlYjNjNWEyMyIKIAogU1JDX1VSSSAr
PSAiIFwKIAlmaWxlOi8vcnVuLXB0ZXN0IFwKLS0gCjIuNDcuMQoK

--===============8677698798161489474==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 960 .bb files complete (0 cached, 960 parsed). 2003 targets, 66 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-0fd912bf03b1ab9072d96b388f990fb0e1b08dd2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:0fd912bf03b1ab9072d96b388f990fb0e1b08dd2"
meta-yocto-bsp       
meta-poky            = "master:dd6c2950bb507f8c311bd82410a032ed6eb38063"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 487 Local 377 Mirrors 0 Missed 110 Current 269 (77% match, 85% complete)
done.
Removing 7 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 274 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 283 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 295 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 328 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 340 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.9.bb:do_populate_lic_setscene)
NOTE: Running setscene task 345 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 359 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 362 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 364 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 369 of 756 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe ca-certificates-20260816-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2026f-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-jsonpointer-3.9-r0: task do_populate_lic_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 372 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 376 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 380 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 382 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 386 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ca-certificates-20260816-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 387 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-jsonpointer-3.9-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 389 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 394 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.4.5.bb:do_create_spdx_setscene)
NOTE: recipe gcc-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 400 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 402 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 403 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2026f-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 404 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 406 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cmake-native-4.4.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe elfutils-0.197-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-4.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cmake-native-4.4.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 408 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 411 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_packagedata_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 417 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 424 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 429 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 430 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 435 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 436 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe elfutils-0.197-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 438 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 439 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 447 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 449 of 756 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 459 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 465 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 468 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.197-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 469 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 470 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 475 of 756 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 478 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 484 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 488 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 489 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe elfutils-0.197-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 491 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 492 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 494 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-3.8.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 506 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 512 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 517 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 520 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 521 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 524 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 525 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 527 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 529 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 541 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_spdx_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 546 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 549 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.23.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 551 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 555 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 556 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 557 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 559 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 561 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 563 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_package_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.20.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 564 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 565 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 566 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 570 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 571 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 573 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 575 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 576 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 577 of 756 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 579 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 580 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 582 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 583 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.20.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 587 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 588 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-native-2.42.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 591 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 592 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 593 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 598 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 601 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 604 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 606 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 609 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 613 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_create_spdx_setscene)
NOTE: recipe libpam-1.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 614 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-arm-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 615 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 617 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 628 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_fetch)
NOTE: Running task 629 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_fetch)
NOTE: Running setscene task 619 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 621 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 622 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_recipe_qa_setscene)
NOTE: Running task 648 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_fetch)
NOTE: Running task 650 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_fetch)
NOTE: Running task 654 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_fetch)
NOTE: Running task 660 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_fetch)
NOTE: recipe gcc-cross-arm-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 741 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_fetch)
NOTE: recipe python3-3.14.10-r0: task do_package_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_fetch: Started
NOTE: Running task 743 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: recipe libseccomp-2.6.1-r0: task do_fetch: Started
NOTE: recipe libunistring-1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_fetch: Started
NOTE: Running task 745 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_fetch)
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.42.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_fetch: Started
NOTE: Running setscene task 628 of 756 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.37.0.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.23.0-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Succeeded
NOTE: recipe json-c-0.19-r0: task do_fetch: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_fetch: Succeeded
NOTE: Running task 751 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.10.bb:do_fetch)
NOTE: Running setscene task 632 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe nettle-4.0-r0: task do_fetch: Succeeded
NOTE: Running task 753 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_unpack)
NOTE: Running task 754 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_unpack)
NOTE: Running task 755 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_unpack)
NOTE: recipe gnutls-3.8.13-r0: task do_fetch: Started
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_fetch: Succeeded
NOTE: Running task 765 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_unpack)
NOTE: recipe libpsl-0.23.3-r0: task do_fetch: Succeeded
NOTE: Running task 770 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_unpack)
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Started
NOTE: recipe libunistring-1.5-r0: task do_fetch: Started
NOTE: Running task 771 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_unpack)
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 772 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_unpack)
NOTE: recipe gcc-cross-arm-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.8.10-r0: task do_fetch: Started
NOTE: recipe gtk-doc-native-1.37.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_unpack: Started
NOTE: Running task 773 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_write_config)
NOTE: recipe nettle-4.0-r0: task do_unpack: Started
NOTE: recipe curl-8.23.0-r0: task do_unpack: Started
NOTE: recipe libunistring-1.5-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.8.10-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 774 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_unpack)
NOTE: Running setscene task 635 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running task 775 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.10.bb:do_unpack)
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Started
NOTE: recipe json-c-0.19-r0: task do_unpack: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_unpack: Started
NOTE: recipe gcc-cross-arm-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 776 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_patch)
NOTE: recipe gnutls-3.8.13-r0: task do_unpack: Started
NOTE: Running task 803 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.9.bb:do_recipe_qa)
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Started
NOTE: recipe libpsl-0.23.3-r0: task do_write_config: Started
NOTE: recipe nettle-4.0-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.5-r0: task do_unpack: Started
NOTE: Running task 804 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_patch)
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 805 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_patch)
NOTE: recipe gtk-doc-native-1.37.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.8.10-r0: task do_unpack: Started
NOTE: Running setscene task 640 of 756 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_write_config: Succeeded
NOTE: recipe json-c-0.19-r0: task do_patch: Started
NOTE: recipe python3-jsonpointer-3.9-r0: task do_recipe_qa: Started
NOTE: Running task 823 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_fetch)
NOTE: recipe libpam-1.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 642 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 837 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_fetch)
NOTE: recipe libseccomp-2.6.1-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Succeeded
NOTE: recipe nettle-4.0-r0: task do_patch: Started
NOTE: Running task 838 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_unpack)
NOTE: Running task 839 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_patch)
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Started
NOTE: recipe lzlib-1.16-r0: task do_fetch: Started
NOTE: recipe libxslt-native-1.1.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe qemu-native-11.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_fetch: Succeeded
NOTE: Running task 845 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_fetch)
NOTE: recipe file-5.48-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_unpack: Started
NOTE: recipe json-c-0.19-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Started
NOTE: recipe python3-jsonpointer-3.9-r0: task do_recipe_qa: Succeeded
NOTE: Running task 846 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_generate_toolchain_file)
NOTE: Running task 848 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.9.bb:do_fetch)
NOTE: recipe libunistring-1.5-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_unpack: Succeeded
NOTE: Running task 849 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_patch)
NOTE: Running task 850 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_patch)
NOTE: recipe libpsl-0.23.3-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.8.10-r0: task do_unpack: Succeeded
NOTE: Running task 851 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_patch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_fetch: Started
NOTE: Running task 852 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.10.bb:do_patch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 853 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_fetch)
NOTE: recipe libxslt-native-1.1.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 645 of 756 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 859 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_fetch)
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Succeeded
NOTE: recipe json-c-0.19-r0: task do_generate_toolchain_file: Started
NOTE: recipe python3-jsonpointer-3.9-r0: task do_fetch: Started
NOTE: Running task 861 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_fetch)
NOTE: recipe nettle-4.0-r0: task do_patch: Succeeded
NOTE: Running task 863 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_fetch)
NOTE: recipe libunistring-1.5-r0: task do_patch: Started
NOTE: recipe python3-jsonpointer-3.9-r0: task do_fetch: Succeeded
NOTE: Running task 864 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.9.bb:do_unpack)
NOTE: recipe curl-8.23.0-r0: task do_patch: Started
NOTE: recipe libpsl-0.23.3-r0: task do_patch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Started
NOTE: recipe json-c-0.19-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libarchive-3.8.10-r0: task do_patch: Started
NOTE: Running task 866 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_fetch)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Started
NOTE: Running task 880 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_unpack)
NOTE: recipe libxml2-native-2.15.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_fetch: Started
NOTE: recipe file-5.48-r0: task do_fetch: Succeeded
NOTE: Running task 882 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_unpack)
NOTE: recipe libunistring-1.5-r0: task do_patch: Succeeded
NOTE: recipe python3-jsonpointer-3.9-r0: task do_unpack: Started
NOTE: Running task 884 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_unpack)
NOTE: recipe libpsl-0.23.3-r0: task do_patch: Succeeded
NOTE: recipe python3-jsonpointer-3.9-r0: task do_unpack: Succeeded
NOTE: Running task 886 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_unpack)
NOTE: Running task 887 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.9.bb:do_patch)
NOTE: recipe elfutils-0.197-r0: task do_fetch: Started
NOTE: recipe lzlib-1.16-r0: task do_unpack: Started
NOTE: recipe elfutils-0.197-r0: task do_fetch: Succeeded
NOTE: Running task 888 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_unpack)
NOTE: recipe lzlib-1.16-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_patch: Succeeded
NOTE: Running task 889 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_patch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_unpack: Started
NOTE: Running task 894 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe file-5.48-r0: task do_unpack: Started
NOTE: recipe qemu-native-11.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 646 of 756 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 899 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_patch)
NOTE: recipe libxml2-native-2.15.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_unpack: Started
NOTE: recipe python3-jsonpointer-3.9-r0: task do_patch: Started
NOTE: Running task 929 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe elfutils-0.197-r0: task do_unpack: Started
NOTE: recipe lzlib-1.16-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_patch: Started
NOTE: Running task 930 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libarchive-3.8.10-r0: task do_patch: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_unpack: Succeeded
NOTE: Running task 949 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_fetch)
NOTE: Running task 950 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_patch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jsonpointer-3.9-r0: task do_patch: Succeeded
NOTE: Running task 951 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.9.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-native-1_2.90.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 952 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_unpack)
NOTE: recipe lzlib-1.16-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: Running task 953 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.9.bb:do_check_backend)
NOTE: recipe musl-legacy-error-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_patch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_fetch: Succeeded
NOTE: Running task 960 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_unpack)
NOTE: Running task 962 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_fetch: Started
NOTE: Running noexec task 964 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_configure)
NOTE: Running noexec task 965 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_compile)
NOTE: Running task 966 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_install)
NOTE: Running task 967 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_unpack)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_unpack: Succeeded
NOTE: Running task 968 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_patch)
NOTE: recipe gnutls-3.8.13-r0: task do_patch: Started
NOTE: recipe python3-jsonpointer-3.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 969 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libseccomp-2.6.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-jsonpointer-3.9-r0: task do_check_backend: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 970 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_patch)
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Started
NOTE: recipe fts-1.2.7-r0: task do_unpack: Started
NOTE: recipe python3-jsonpointer-3.9-r0: task do_check_backend: Succeeded
NOTE: Running task 981 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_fetch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_install: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_patch: Started
NOTE: recipe glib-2.0-native-1_2.90.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 647 of 756 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 648 of 756 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_patch: Started
NOTE: recipe libmpc-1.4.1-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_patch: Succeeded
NOTE: Running task 989 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libmpc-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 1004 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_fetch)
NOTE: Running task 1005 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_unpack)
NOTE: recipe python3-jsonpointer-3.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_install: Succeeded
NOTE: Running task 1016 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_fetch)
NOTE: Running task 1019 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe libpcre2-native-10.49-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_patch: Succeeded
NOTE: Running task 1023 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_create_recipe_spdx)
NOTE: recipe meson-native-1.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libmpc-1.4.1-r0: task do_unpack: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_fetch: Started
NOTE: recipe binutils-2.47-r0: task do_fetch: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_fetch: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_fetch: Started
NOTE: Running task 1024 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1025 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe libmpc-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.47-r0: task do_fetch: Succeeded
NOTE: Running task 1026 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_patch)
NOTE: recipe gnutls-3.8.13-r0: task do_patch: Succeeded
NOTE: Running task 1028 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_recipe_spdx)
NOTE: Running task 1030 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_create_recipe_spdx)
NOTE: recipe libpcre2-native-10.49-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_fetch: Succeeded
NOTE: recipe file-5.48-r0: task do_unpack: Succeeded
NOTE: Running task 1057 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_unpack)
NOTE: Running task 1060 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: Running task 1061 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_patch)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libmpc-1.4.1-r0: task do_patch: Started
NOTE: recipe meson-native-1.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx: Started
NOTE: recipe xz-5.8.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_unpack: Started
NOTE: Running task 1146 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe file-5.48-r0: task do_patch: Started
NOTE: recipe binutils-2.47-r0: task do_unpack: Started
NOTE: Running noexec task 1160 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_fetch)
NOTE: Running task 1161 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_package)
NOTE: recipe musl-locales-1.0+git-r0: task do_fetch: Succeeded
NOTE: Running task 1162 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe file-5.48-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_package: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1200 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_patch)
NOTE: recipe musl-locales-1.0+git-r0: task do_unpack: Started
NOTE: recipe fts-1.2.7-r0: task do_unpack: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 1201 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_patch)
NOTE: Running task 1202 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_patch)
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1203 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_create_recipe_spdx)
NOTE: recipe unzip-1_6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1204 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Started
NOTE: recipe fts-1.2.7-r0: task do_patch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r0: task do_patch: Started
NOTE: recipe elfutils-0.197-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.14.10-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1205 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_patch: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.197-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1209 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_unpack: Succeeded
NOTE: Running task 1210 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_patch)
NOTE: recipe python3-3.14.10-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1211 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.9.bb:do_create_recipe_spdx)
NOTE: Running task 1212 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_create_recipe_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_patch: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-jsonpointer-3.9-r0: task do_create_recipe_spdx: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_unpack: Succeeded
NOTE: Running task 1213 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_patch)
NOTE: recipe musl-locales-1.0+git-r0: task do_patch: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_patch: Succeeded
NOTE: recipe python3-jsonpointer-3.9-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_patch: Succeeded
NOTE: Running task 1215 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_generate_toolchain_file)
NOTE: recipe elfutils-0.197-r0: task do_patch: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_generate_toolchain_file: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_patch: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_package unihash changed to 17d20b66bc4b3677e29411c8f6514f450dc782c967828a77dc44e9776e98176f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata became valid
NOTE: Running setscene task 648 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1220 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-3.14.10-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 649 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 650 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 651 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 652 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 653 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 654 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 656 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 657 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 658 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 659 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 660 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 661 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 662 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 663 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Running setscene task 665 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/zlib/1.3.2/temp/log.do_packagedata_setscene.2581933
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 666 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 667 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 668 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 669 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_package_setscene)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7e86448afe1b3e8fcf2e9f542240cb9b328cc75e1ab3c65f36609a2d1377b4f7
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash b300d578ec29b6dd5862f658fd25cc318926d2e563ebe748a3ad49e87d015d23 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '1318d5c04186e0e06b8d58144f96522c797c0cf9c16121e2b8fb0502124b1c88', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'b300d578ec29b6dd5862f658fd25cc318926d2e563ebe748a3ad49e87d015d23'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 1318d5c04186e0e06b8d58144f96522c797c0cf9c16121e2b8fb0502124b1c88 -> b300d578ec29b6dd5862f658fd25cc318926d2e563ebe748a3ad49e87d015d23 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running setscene task 670 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_package_setscene)
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 671 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 672 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 673 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 674 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_package_setscene)
NOTE: Running setscene task 675 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_package_setscene)
NOTE: Running setscene task 676 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_package_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 677 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-4.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_package_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-4.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_package_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_package_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_package_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_package_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 678 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_package_setscene)
NOTE: Running setscene task 679 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_package_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 680 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_package_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 681 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_setscene)
NOTE: recipe python3-3.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1222 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_fetch)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 682 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_package_setscene)
NOTE: recipe gdbm-1.26-r0: task do_package_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_package_setscene: Started
NOTE: recipe openssl-4.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 685 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_package_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_fetch: Started
NOTE: recipe xz-5.8.4-r0: task do_package_setscene: Started
NOTE: recipe openssl-4.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_fetch: Succeeded
NOTE: Running task 1223 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 686 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 688 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-4.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 689 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 690 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 691 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 692 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.14.10-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 693 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 694 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 695 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 696 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.10.0-r0: task do_package_setscene: Succeeded
NOTE: recipe sqlite3-3_3.54.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 697 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 698 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_unpack: Succeeded
NOTE: Running task 1234 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_patch)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 699 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_package_setscene)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 700 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.10.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1236 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_fetch)
NOTE: recipe libffi-3.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 701 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 702 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1238 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_fetch)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-2.47-r0: task do_patch: Started
NOTE: Running task 1240 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_fetch)
NOTE: recipe expat-2.10.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 703 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_fetch: Started
NOTE: recipe ncurses-6.6-r0: task do_package_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_fetch: Started
NOTE: Running task 1241 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_unpack)
NOTE: recipe libedit-20260512-3.1-r0: task do_fetch: Succeeded
NOTE: Running task 1242 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_unpack)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.54.1-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 704 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running task 1244 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_fetch)
NOTE: Running task 1246 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_fetch)
NOTE: Running task 1247 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_unpack: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_unpack: Started
NOTE: recipe expat-2.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1249 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_fetch)
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_unpack: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1250 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_patch)
NOTE: recipe gdbm-1.26-r0: task do_package_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 705 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1251 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1253 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe expat-2.10.0-r0: task do_fetch: Started
NOTE: recipe expat-2.10.0-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_patch: Started
NOTE: Running task 1254 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_unpack)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_unpack: Started
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1255 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe libffi-3.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1256 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_patch)
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 706 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.10.0-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_patch: Started
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Succeeded
NOTE: Running task 1257 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_unpack)
NOTE: recipe libedit-20260512-3.1-r0: task do_patch: Succeeded
NOTE: recipe expat-2.10.0-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_patch: Started
NOTE: Running task 1259 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_patch)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 1260 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1262 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_fetch)
NOTE: recipe expat-2.10.0-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe libffi-3.8.0-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_fetch: Started
NOTE: recipe expat-2.10.0-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_fetch: Succeeded
NOTE: Running task 1267 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_unpack)
NOTE: recipe xz-5.8.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 707 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-2.47-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_unpack: Started
NOTE: recipe xz-5.8.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_unpack: Succeeded
NOTE: Running task 1269 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_patch)
NOTE: recipe xz-5.8.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 708 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_unpack: Succeeded
NOTE: Running task 1270 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_patch)
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_patch: Started
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1272 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_fetch)
NOTE: recipe gdbm-1.26-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 1274 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe xz-5.8.4-r0: task do_fetch: Started
NOTE: recipe python3-3.14.10-r0: task do_unpack: Succeeded
NOTE: Running task 1275 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_patch)
NOTE: recipe xz-5.8.4-r0: task do_fetch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Succeeded
NOTE: Running task 1276 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_unpack)
NOTE: Running task 1277 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe zstd-1.5.7-r0: task do_patch: Started
NOTE: recipe xz-5.8.4-r0: task do_unpack: Started
NOTE: recipe python3-3.14.10-r0: task do_patch: Started
NOTE: recipe xz-5.8.4-r0: task do_unpack: Succeeded
NOTE: Running task 1278 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_patch: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_patch: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_patch: Succeeded
NOTE: recipe python3-3.14.10-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 709 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 710 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 711 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 712 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 713 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 715 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 717 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 718 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 720 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1285 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_fetch)
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 722 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 724 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 725 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 726 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.6-r0: task do_fetch: Succeeded
NOTE: Running task 1296 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_unpack)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_unpack: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 729 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 730 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 731 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 733 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 734 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 743 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 745 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 747 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 748 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 750 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-arm-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_unpack: Succeeded
NOTE: Running task 1324 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_patch)
NOTE: recipe ncurses-6.6-r0: task do_patch: Started
NOTE: recipe ncurses-6.6-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-arm-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 752 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 755 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 756 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-arm-2.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-arm-2.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1465 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1466 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1467 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1528 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1537 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1538 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1539 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1565 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata)
NOTE: Running task 1566 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1569 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1570 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1571 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1575 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot)
NOTE: recipe nettle-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1647 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1655 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_spdx)
NOTE: recipe libtasn1-4.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1659 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-c-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.8.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata: Started
NOTE: recipe lzlib-1.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.14.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmpc-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.6-r0: task do_create_spdx: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzlib-1.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1660 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_configure)
NOTE: recipe libseccomp-2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1661 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_configure)
NOTE: Running task 1662 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_configure)
NOTE: Running task 1663 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_configure)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_configure: Started
NOTE: Running task 1664 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.8.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1665 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_configure)
NOTE: recipe libmpc-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1666 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_configure)
NOTE: recipe json-c-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1667 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.10.bb:do_configure)
NOTE: recipe libunistring-1.5-r0: task do_configure: Started
NOTE: Running task 1668 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_configure)
NOTE: Running task 1669 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_configure)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1670 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_configure)
NOTE: recipe libseccomp-2.6.1-r0: task do_configure: Started
NOTE: recipe nettle-4.0-r0: task do_configure: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot unihash changed to 6ccc9f2d2b591ced868977eea49adbc57287846c1be40350153e5deb34e8b0c5
NOTE: recipe unzip-1_6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_configure: Started
NOTE: Setscene tasks completed
NOTE: Running task 1672 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_configure)
NOTE: recipe lzlib-1.16-r0: task do_configure: Succeeded
NOTE: Running task 1675 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_create_spdx)
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Started
NOTE: recipe libarchive-3.8.10-r0: task do_configure: Started
NOTE: recipe json-c-0.19-r0: task do_configure: Started
NOTE: Running task 1676 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_compile)
NOTE: recipe libmpc-1.4.1-r0: task do_configure: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1677 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_configure)
NOTE: recipe python3-3.14.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_create_spdx: Started
NOTE: recipe lzlib-1.16-r0: task do_compile: Started
NOTE: Running task 1678 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: Running task 1679 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_configure)
NOTE: recipe libtasn1-4.21.0-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r0: task do_configure: Started
NOTE: recipe python3-3.14.10-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r0: task do_configure: Succeeded
NOTE: Running task 1680 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 1681 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_create_spdx)
NOTE: recipe unzip-1_6.0-r0: task do_compile: Started
NOTE: recipe libffi-3.8.0-r0: task do_create_spdx: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_configure: Succeeded
NOTE: Running task 1682 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_compile)
NOTE: recipe musl-locales-1.0+git-r0: task do_compile: Started
NOTE: recipe libffi-3.8.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1683 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_spdx)
NOTE: recipe musl-locales-1.0+git-r0: task do_compile: Succeeded
NOTE: Running task 1684 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_create_spdx)
NOTE: recipe gdbm-1.26-r0: task do_create_spdx: Started
NOTE: recipe xz-5.8.4-r0: task do_create_spdx: Started
NOTE: recipe gdbm-1.26-r0: task do_create_spdx: Succeeded
NOTE: Running task 1685 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_create_spdx)
NOTE: recipe expat-2.10.0-r0: task do_create_spdx: Started
NOTE: recipe ncurses-6.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 1686 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_create_spdx)
NOTE: recipe xz-5.8.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 1687 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx)
NOTE: recipe libedit-20260512-3.1-r0: task do_create_spdx: Started
NOTE: recipe expat-2.10.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1689 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_create_spdx)
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_create_spdx: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1692 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1693 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_install)
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_install: Succeeded
NOTE: Running task 1717 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_package)
NOTE: recipe lzlib-1.16-r0: task do_compile: Succeeded
NOTE: Running task 1718 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_install)
NOTE: recipe musl-locales-1.0+git-r0: task do_package: Started
NOTE: recipe lzlib-1.16-r0: task do_install: Started
NOTE: recipe lzlib-1.16-r0: task do_install: Succeeded
NOTE: Running task 1719 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_populate_sysroot)
NOTE: Running task 1720 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_package)
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot: Started
NOTE: recipe lzlib-1.16-r0: task do_package: Started
NOTE: recipe nettle-4.0-r0: task do_configure: Succeeded
NOTE: Running task 1721 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_configure_ptest_base)
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_populate_sysroot unihash changed to 20067ce26b7c452eab2f9fbb80b6447c739d4d1abf728b7a8b883c48664c76c5
NOTE: Setscene tasks completed
NOTE: Running task 1722 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-4.0-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-4.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe file-5.48-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1723 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_compile)
NOTE: recipe nettle-4.0-r0: task do_compile: Started
NOTE: recipe file-5.48-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1724 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_configure)
NOTE: recipe file-5.48-r0: task do_configure: Started
NOTE: recipe json-c-0.19-r0: task do_configure: Succeeded
NOTE: Running task 1725 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_configure_ptest_base)
NOTE: recipe json-c-0.19-r0: task do_configure_ptest_base: Started
NOTE: recipe json-c-0.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1726 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_compile)
NOTE: recipe json-c-0.19-r0: task do_compile: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1727 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_compile)
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Started
NOTE: recipe json-c-0.19-r0: task do_compile: Succeeded
NOTE: Running task 1728 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_compile_ptest_base)
NOTE: recipe lzlib-1.16-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_package unihash changed to 655f6b81c7fee43a690aece2bfbcad8e189ccce2afa489c59b69ef15bdd923ef
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata became valid
NOTE: recipe json-c-0.19-r0: task do_compile_ptest_base: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_package: Succeeded
NOTE: Running setscene task 747 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_package unihash changed to 91f74cc7c92a79f7cfc567cddb63d10d1375c1e4c7ca1ef21e0e6dfd0a4f452f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata became valid
NOTE: Running setscene task 756 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1729 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_install)
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_install: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1732 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_install)
NOTE: recipe json-c-0.19-r0: task do_install: Succeeded
NOTE: Running task 1733 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_install_ptest_base)
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Started
NOTE: recipe json-c-0.19-r0: task do_install_ptest_base: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 1734 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot)
NOTE: Running task 1735 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_compile)
NOTE: Running task 1736 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_package)
NOTE: recipe json-c-0.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1737 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_populate_sysroot)
NOTE: Running task 1738 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_package)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_package: Started
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot: Started
NOTE: recipe json-c-0.19-r0: task do_package: Started
NOTE: recipe fts-1.2.7-r0: task do_configure: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot unihash changed to 0737e4baebfdb95b7fbe0e4cca7562d7bbc76a896b9a8efa14e9189ddc44c5b2
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 1739 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_compile)
NOTE: Running task 1740 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_install)
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_populate_sysroot unihash changed to 9d44fd8b191ca6182fce48cb6643be2b4ebbd4209497ad8f32ba895364b94127
NOTE: recipe fts-1.2.7-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Succeeded
NOTE: Running task 1741 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot)
NOTE: Running task 1742 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_package)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_package: Started
NOTE: recipe fts-1.2.7-r0: task do_compile: Succeeded
NOTE: Running task 1743 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_install)
NOTE: recipe fts-1.2.7-r0: task do_install: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot unihash changed to c57131feb65f35abd02fb187d11536b8a317e3b924feed95bf5e82d28494eac5
NOTE: Setscene tasks completed
NOTE: recipe libmpc-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1744 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_compile)
NOTE: recipe libseccomp-2.6.1-r0: task do_configure: Succeeded
NOTE: Running task 1745 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_configure_ptest_base)
NOTE: recipe fts-1.2.7-r0: task do_install: Succeeded
NOTE: Running task 1746 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot)
NOTE: Running task 1747 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_package)
NOTE: recipe libmpc-1.4.1-r0: task do_compile: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_configure_ptest_base: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_package: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1748 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_compile)
NOTE: recipe libseccomp-2.6.1-r0: task do_compile: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot unihash changed to afb972c15ff63096a7567dfab7fba5a6d2c286c648509a008cf9dbc990c01a5b
NOTE: recipe argp-standalone-1.4.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_package unihash changed to 147ef2952ff241c35567648640d5304d05340ee57c810cfe7eca5450855d10a1
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata became valid
NOTE: Running setscene task 756 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libmpc-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1750 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_install)
NOTE: recipe libmpc-1.4.1-r0: task do_install: Started
NOTE: recipe unzip-1_6.0-r0: task do_compile: Succeeded
NOTE: Running task 1751 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: recipe unzip-1_6.0-r0: task do_install: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_package unihash changed to 2a8f21e90f66a6b0d86d623981908b00e3f2838e6d958d4c5e57ac23626f542d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata became valid
NOTE: recipe json-c-0.19-r0: task do_package: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_install: Succeeded
NOTE: Running setscene task 756 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_package unihash changed to cab92d4f90bbdd8e4132c2ebfe5c58bb3e17af38a82e25beca82151c7fdff8e1
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_packagedata became valid
NOTE: Running setscene task 756 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_packagedata_setscene)
NOTE: Running task 1752 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_install: Succeeded
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_package: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1753 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_populate_sysroot)
NOTE: Running task 1755 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_package)
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libmpc-1.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe libmpc-1.4.1-r0: task do_package: Started
NOTE: recipe fts-1.2.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_package unihash changed to b2a88cd2212ea5d245fa926d660f39d16551a36d6fa462a8725ab586ededb587
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata became valid
NOTE: Running setscene task 756 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_populate_sysroot unihash changed to 5fa37f4388c57ddad24a73fdc7d386a480b6b34ed6a69ac6e1e4fff9674d3b31
NOTE: Running task 1757 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gcc-16.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-16.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1759 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_configure)
NOTE: recipe gcc-16.2.0-r0: task do_configure: Started
NOTE: recipe nettle-4.0-r0: task do_compile: Succeeded
NOTE: Running task 1760 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_compile_ptest_base)
NOTE: recipe nettle-4.0-r0: task do_compile_ptest_base: Started
NOTE: recipe unzip-1_6.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_package unihash changed to a33d951aba6b54bc3713b4197100d03c22509156748bf03d4e10a4040d2f767b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata became valid
NOTE: Running setscene task 756 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1761 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_compile_ptest_base)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_package: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_compile_ptest_base: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_package unihash changed to d6a355acd1eb15c3e04fa2355de35f0bf41df18a5ebe5b04fd2b3aaa388f7dc2
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata became valid
NOTE: Running setscene task 751 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1763 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_install)
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe nettle-4.0-r0: task do_install: Started
NOTE: recipe nettle-4.0-r0: task do_install: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1765 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_install)
NOTE: Running task 1766 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_install_ptest_base)
NOTE: recipe nettle-4.0-r0: task do_install_ptest_base: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_install: Started
NOTE: recipe gcc-16.2.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1767 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_compile)
NOTE: recipe gcc-16.2.0-r0: task do_compile: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_install: Succeeded
NOTE: Running task 1768 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_install_ptest_base)
NOTE: recipe libseccomp-2.6.1-r0: task do_install_ptest_base: Started
NOTE: recipe file-5.48-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1769 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_compile)
NOTE: recipe file-5.48-r0: task do_compile: Started
NOTE: recipe nettle-4.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1770 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_populate_sysroot)
NOTE: Running task 1771 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_package)
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-4.0-r0: task do_package: Started
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_populate_sysroot unihash changed to 6bb7c222c7c29dccae9c509dd0d52a592703952c07a92475d810de78d238e21e
NOTE: Setscene tasks completed
NOTE: recipe file-5.48-r0: task do_compile: Succeeded
NOTE: Running task 1772 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_install)
NOTE: recipe file-5.48-r0: task do_install: Started
NOTE: recipe file-5.48-r0: task do_install: Succeeded
NOTE: Running task 1773 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_populate_sysroot)
NOTE: Running task 1774 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_package)
NOTE: recipe file-5.48-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.48-r0: task do_package: Started
NOTE: recipe file-5.48-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_populate_sysroot unihash changed to b78f2f658f29543c8a725782074fccebe7ee4ff1a8550fabc6049c6f9a116075
NOTE: Setscene tasks completed
NOTE: recipe libseccomp-2.6.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1775 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_populate_sysroot)
NOTE: Running task 1776 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_package)
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_package: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_configure: Succeeded
NOTE: Running task 1777 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_compile)
NOTE: recipe libtasn1-4.21.0-r0: task do_compile: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_populate_sysroot unihash changed to 563966ee96b6ce18bf8abc94357520863843763eba053bc819619e6167853ff4
NOTE: Setscene tasks completed
NOTE: recipe file-5.48-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_package unihash changed to aed38b4bef3379972d470bad0a25bde7862f083723347fb73da4ff965a37e05f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_packagedata became valid
NOTE: Running setscene task 756 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_packagedata_setscene)
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe nettle-4.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_package unihash changed to f3f690f5fb8ffbd161a6d133245710b06e7699d431cfa461dc2bc9a594bcda53
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_packagedata became valid
NOTE: Running setscene task 756 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_packagedata_setscene)
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.10-r0: task do_configure: Succeeded
NOTE: Running task 1779 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.10.bb:do_configure_ptest_base)
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libarchive-3.8.10-r0: task do_configure_ptest_base: Started
NOTE: recipe libarchive-3.8.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1781 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.10.bb:do_compile)
NOTE: recipe libarchive-3.8.10-r0: task do_compile: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_package unihash changed to e8eb0ce5c166b2267a2d7754a013db5046f813bde35bfcfb3c502a398ad7ab26
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_packagedata became valid
NOTE: Running setscene task 756 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libtasn1-4.21.0-r0: task do_compile: Succeeded
NOTE: Running task 1783 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_install)
NOTE: recipe libtasn1-4.21.0-r0: task do_install: Started
NOTE: recipe libarchive-3.8.10-r0: task do_compile: Succeeded
NOTE: Running task 1784 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.10.bb:do_compile_ptest_base)
NOTE: recipe libarchive-3.8.10-r0: task do_compile_ptest_base: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_install: Succeeded
NOTE: Running task 1785 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_populate_sysroot)
NOTE: Running task 1786 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_package)
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_package: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_populate_sysroot unihash changed to ffa3fdd601b086a42c4883c124519bc5657d1d7fdbbff07c418e6c740aa9b896
NOTE: Setscene tasks completed
NOTE: recipe libtasn1-4.21.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_package unihash changed to 39390d61a9c1c4925d7ce629d93ed446c1aebb19f8565323a8cd21bfb3268b4d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata became valid
NOTE: Running setscene task 756 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libunistring-1.5-r0: task do_configure: Succeeded
NOTE: Running task 1788 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_compile)
NOTE: recipe libunistring-1.5-r0: task do_compile: Started
NOTE: recipe python3-3.14.10-r0: task do_configure: Succeeded
NOTE: Running task 1789 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_configure_ptest_base)
NOTE: recipe python3-3.14.10-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.14.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1790 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_compile)
NOTE: recipe python3-3.14.10-r0: task do_compile: Started
NOTE: recipe libarchive-3.8.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1791 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.10.bb:do_install)
NOTE: recipe libarchive-3.8.10-r0: task do_install: Started
NOTE: recipe libarchive-3.8.10-r0: task do_install: Succeeded
NOTE: Running task 1792 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.10.bb:do_install_ptest_base)
NOTE: recipe libarchive-3.8.10-r0: task do_install_ptest_base: Started
NOTE: recipe libarchive-3.8.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1793 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.10.bb:do_populate_sysroot)
NOTE: Running task 1794 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.10.bb:do_package)
NOTE: recipe libarchive-3.8.10-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.8.10-r0: task do_package: Started
NOTE: recipe libarchive-3.8.10-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.10.bb:do_populate_sysroot unihash changed to ebe1c6c28e2865d50d92d549ba60a7cb5ccab9560bbd78d4e1f42cd51543e9da
NOTE: Setscene tasks completed
NOTE: recipe libarchive-3.8.10-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.10.bb:do_package unihash changed to 32e0d7f5db5b0c4d783f1552bfe7db8db4a251f7f703a447451ce29860957a23
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.10.bb:do_packagedata became valid
NOTE: Running setscene task 756 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.10.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-3.14.10-r0: task do_compile: Succeeded
NOTE: Running task 1796 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_compile_ptest_base)
NOTE: recipe python3-3.14.10-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-3.14.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1797 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_install)
NOTE: recipe python3-3.14.10-r0: task do_install: Started
NOTE: recipe libunistring-1.5-r0: task do_compile: Succeeded
NOTE: Running task 1798 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_install)
NOTE: recipe libunistring-1.5-r0: task do_install: Started
NOTE: recipe libunistring-1.5-r0: task do_install: Succeeded
NOTE: Running task 1799 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_populate_sysroot)
NOTE: Running task 1800 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_package)
NOTE: recipe libunistring-1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-1.5-r0: task do_package: Started
NOTE: recipe libunistring-1.5-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_populate_sysroot unihash changed to c3cea7ccf5629feb321d691c8ec269254f2595dec73ae947018cef6d1e5fcd00
NOTE: Setscene tasks completed
NOTE: Running task 1801 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1802 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_configure)
NOTE: recipe libidn2-2.3.8-r0: task do_configure: Started
NOTE: recipe libunistring-1.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_package unihash changed to 5fe12bd16d6eeb2e63b31711799fa75520923257495eb5864ab674604527e40a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_packagedata became valid
NOTE: Running setscene task 755 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-3.14.10-r0: task do_install: Succeeded
NOTE: Running task 1804 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_install_ptest_base)
NOTE: recipe python3-3.14.10-r0: task do_install_ptest_base: Started
NOTE: recipe python3-3.14.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1805 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_populate_sysroot)
NOTE: recipe python3-3.14.10-r0: task do_populate_sysroot: Started
NOTE: recipe python3-3.14.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1808 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1809 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1810 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_create_spdx)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jsonpointer-3.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.14.10-r0: task do_create_spdx: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jsonpointer-3.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1811 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_configure)
NOTE: Running task 1812 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.9.bb:do_configure)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_configure: Started
NOTE: recipe python3-jsonpointer-3.9-r0: task do_configure: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_configure: Succeeded
NOTE: Running task 1813 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_compile)
NOTE: recipe python3-jsonpointer-3.9-r0: task do_configure: Succeeded
NOTE: Running task 1814 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.9.bb:do_configure_ptest_base)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_compile: Started
NOTE: recipe python3-jsonpointer-3.9-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-jsonpointer-3.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1815 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.9.bb:do_compile)
NOTE: recipe python3-jsonpointer-3.9-r0: task do_compile: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_compile: Succeeded
NOTE: Running task 1816 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_install)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_install: Started
NOTE: recipe python3-jsonpointer-3.9-r0: task do_compile: Succeeded
NOTE: Running task 1817 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.9.bb:do_compile_ptest_base)
NOTE: recipe python3-jsonpointer-3.9-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_install: Succeeded
NOTE: recipe python3-jsonpointer-3.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1818 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package)
NOTE: Running task 1819 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_populate_sysroot)
NOTE: Running task 1820 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.9.bb:do_install)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_populate_sysroot: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package: Started
NOTE: recipe python3-jsonpointer-3.9-r0: task do_install: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-jsonpointer-3.9-r0: task do_install: Succeeded
NOTE: Running task 1821 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.9.bb:do_install_ptest_base)
NOTE: recipe python3-jsonpointer-3.9-r0: task do_install_ptest_base: Started
NOTE: recipe python3-jsonpointer-3.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1822 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.9.bb:do_package)
NOTE: Running task 1823 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.9.bb:do_populate_sysroot)
NOTE: recipe python3-jsonpointer-3.9-r0: task do_package: Started
NOTE: recipe python3-jsonpointer-3.9-r0: task do_populate_sysroot: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package: Succeeded
NOTE: Running task 1824 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_packagedata)
NOTE: recipe python3-jsonpointer-3.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_packagedata unihash changed to 38fc0f2214a49ab60e8a0d007528636fd2c954fc53ef1f7b704b20aecc450554
NOTE: Setscene tasks completed
NOTE: Running task 1825 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_ipk)
NOTE: Running task 1826 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_deb)
NOTE: Running task 1827 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_rpm)
NOTE: Running task 1828 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_qa)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_ipk: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_deb: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_qa: Started
NOTE: recipe python3-3.14.10-r0: task do_create_spdx: Succeeded
NOTE: Running task 1829 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_create_spdx)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx: Started
NOTE: recipe python3-jsonpointer-3.9-r0: task do_package: Succeeded
NOTE: Running task 1830 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.9.bb:do_packagedata)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_qa unihash changed to 407885ab42d9af1dc05c4804a2174558bdaeb1b974bc4c2d99f2531d19b23a27
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_deb unihash changed to f4e9f403c383e062e0c53c0b79eebebfba1035b68d3fe0fde9bb7d51cf9da5e8
NOTE: recipe python3-jsonpointer-3.9-r0: task do_packagedata: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_rpm unihash changed to 481eed5db8d617fd12cdc2df5e8574075901aba571258d66764f4f4038967859
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_ipk unihash changed to 2e2c9baa45e192383882528861a81899901e84f49e166e2677f410ab45a6c63d
NOTE: recipe python3-jsonpointer-3.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1831 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.9.bb:do_create_spdx)
NOTE: Running task 1832 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.9.bb:do_package_write_ipk)
NOTE: Running task 1833 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.9.bb:do_package_write_deb)
NOTE: Running task 1834 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.9.bb:do_package_write_rpm)
NOTE: Running task 1835 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.9.bb:do_package_qa)
NOTE: recipe python3-jsonpointer-3.9-r0: task do_create_spdx: Started
NOTE: recipe python3-jsonpointer-3.9-r0: task do_package_write_ipk: Started
NOTE: recipe python3-jsonpointer-3.9-r0: task do_package_write_deb: Started
NOTE: recipe python3-jsonpointer-3.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonpointer-3.9-r0: task do_package_qa: Started
NOTE: recipe python3-jsonpointer-3.9-r0: task do_create_spdx: Succeeded
NOTE: Running task 1836 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.9.bb:do_create_package_spdx)
NOTE: recipe python3-jsonpointer-3.9-r0: task do_create_package_spdx: Started
NOTE: recipe python3-jsonpointer-3.9-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-jsonpointer-3.9-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-jsonpointer-3.9-r0: task do_package_qa: Succeeded
NOTE: recipe python3-jsonpointer-3.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonpointer-3.9-r0: task do_create_package_spdx: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1837 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_compile)
NOTE: recipe libidn2-2.3.8-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.8-r0: task do_compile: Succeeded
NOTE: Running task 1838 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_install)
NOTE: recipe libidn2-2.3.8-r0: task do_install: Started
NOTE: recipe libidn2-2.3.8-r0: task do_install: Succeeded
NOTE: Running task 1839 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot)
NOTE: Running task 1840 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_package)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.8-r0: task do_package: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot unihash changed to 03610e875ffd516d2032d583078927ef6dfd4bebf88bf1e65e21b9ac061c1f2f
NOTE: Setscene tasks completed
NOTE: Running task 1841 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1842 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.23.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.8.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.23.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1843 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_configure)
NOTE: recipe gnutls-3.8.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1844 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_configure)
NOTE: recipe libpsl-0.23.3-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.13-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.8-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_package unihash changed to c67a85786ab4b5235f300817bb3992a964789516db921f4c1708b33675c483b4
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata became valid
NOTE: Running setscene task 755 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libpsl-0.23.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1846 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_compile)
NOTE: recipe libpsl-0.23.3-r0: task do_compile: Started
NOTE: recipe libpsl-0.23.3-r0: task do_compile: Succeeded
NOTE: Running task 1847 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_install)
NOTE: recipe libpsl-0.23.3-r0: task do_install: Started
NOTE: recipe libpsl-0.23.3-r0: task do_install: Succeeded
NOTE: Running task 1848 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_populate_sysroot)
NOTE: Running task 1849 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_package)
NOTE: recipe libpsl-0.23.3-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.23.3-r0: task do_package: Started
NOTE: recipe libpsl-0.23.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_populate_sysroot unihash changed to 302ea69cbfb22be3ec6e3a38bf8c6f0c100ba98f15fde40f49376bca6d53d806
NOTE: Setscene tasks completed
NOTE: Running task 1850 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-8.23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1851 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_configure)
NOTE: recipe curl-8.23.0-r0: task do_configure: Started
NOTE: recipe libpsl-0.23.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_package unihash changed to d860fff4fdf7755babd5a6b64fda624e34ee2324520a48652ec9bc15bc2cc7d1
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_packagedata became valid
NOTE: Running setscene task 749 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_packagedata_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe curl-8.23.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1853 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_configure_ptest_base)
NOTE: recipe curl-8.23.0-r0: task do_configure_ptest_base: Started
NOTE: recipe curl-8.23.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1854 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_compile)
NOTE: recipe curl-8.23.0-r0: task do_compile: Started
NOTE: recipe curl-8.23.0-r0: task do_compile: Succeeded
NOTE: Running task 1855 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_compile_ptest_base)
NOTE: recipe curl-8.23.0-r0: task do_compile_ptest_base: Started
NOTE: recipe curl-8.23.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1856 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_configure_ptest_base)
NOTE: Running task 1857 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_install)
NOTE: recipe gnutls-3.8.13-r0: task do_configure_ptest_base: Started
NOTE: recipe curl-8.23.0-r0: task do_install: Started
NOTE: recipe gnutls-3.8.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1858 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_compile)
NOTE: recipe gnutls-3.8.13-r0: task do_compile: Started
NOTE: recipe curl-8.23.0-r0: task do_install: Succeeded
NOTE: Running task 1859 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_install_ptest_base)
NOTE: recipe curl-8.23.0-r0: task do_install_ptest_base: Started
NOTE: recipe curl-8.23.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1860 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_populate_sysroot)
NOTE: Running task 1861 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_package)
NOTE: recipe curl-8.23.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-8.23.0-r0: task do_package: Started
NOTE: recipe curl-8.23.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_populate_sysroot unihash changed to 2f4562c334108ba2438bffc832c56e10cbfc936185e6e168fbf1f1a3adc31dd8
NOTE: Setscene tasks completed
NOTE: recipe curl-8.23.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_package unihash changed to cfed085c6a9622021ba8d481b6c9c4ad1284e7ba35525f771ad775aa2a2844f6
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_packagedata became valid
NOTE: Running setscene task 756 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_packagedata_setscene)
NOTE: recipe curl-8.23.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gnutls-3.8.13-r0: task do_compile: Succeeded
NOTE: Running task 1863 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_compile_ptest_base)
NOTE: recipe gnutls-3.8.13-r0: task do_compile_ptest_base: Started
NOTE: recipe gnutls-3.8.13-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1864 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_install)
NOTE: recipe gnutls-3.8.13-r0: task do_install: Started
NOTE: recipe gnutls-3.8.13-r0: task do_install: Succeeded
NOTE: Running task 1865 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_install_ptest_base)
NOTE: recipe gnutls-3.8.13-r0: task do_install_ptest_base: Started
NOTE: recipe gnutls-3.8.13-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1866 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_populate_sysroot)
NOTE: Running task 1867 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_package)
NOTE: recipe gnutls-3.8.13-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.8.13-r0: task do_package: Started
NOTE: recipe gnutls-3.8.13-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_populate_sysroot unihash changed to 958ad4d94d635f990f7e6eb98cc8d3d6f17f316666468158143f80d34cd5c561
NOTE: Setscene tasks completed
NOTE: Running task 1868 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1869 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_configure)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.13-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_package unihash changed to 03751b164e1b624bfb2ffb1f2caf72db13853e8e6ddae4ea704f728c09ee0a12
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_packagedata became valid
NOTE: Running setscene task 748 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1871 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_compile)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 1872 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_install)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_install: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 1873 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 1874 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_package)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_package: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_populate_sysroot unihash changed to 442aba9f083468bae4c46efd971d561e1205a75f696072b8b942f23ed5af5a8a
NOTE: Setscene tasks completed
NOTE: Running task 1875 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.197-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.197-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1876 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_configure)
NOTE: recipe elfutils-0.197-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_package unihash changed to aa5c98ee937745a4f6e5493f243909007fe6fea4f800a209fb99695eb9a2625c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_packagedata became valid
NOTE: Running setscene task 751 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe elfutils-0.197-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1878 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.197-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.197-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1879 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_compile)
NOTE: recipe elfutils-0.197-r0: task do_compile: Started
NOTE: recipe elfutils-0.197-r0: task do_compile: Succeeded
NOTE: Running task 1880 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.197-r0: task do_compile_ptest_base: Started
NOTE: recipe gcc-16.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1881 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_install)
NOTE: recipe gcc-16.2.0-r0: task do_install: Started
NOTE: recipe gcc-16.2.0-r0: task do_install: Succeeded
NOTE: Running task 1882 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_package)
NOTE: recipe gcc-16.2.0-r0: task do_package: Started
NOTE: recipe elfutils-0.197-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1883 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_install)
NOTE: recipe elfutils-0.197-r0: task do_install: Started
NOTE: recipe elfutils-0.197-r0: task do_install: Succeeded
NOTE: Running task 1884 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.197-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.197-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1885 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_populate_sysroot)
NOTE: Running task 1886 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_package)
NOTE: recipe elfutils-0.197-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.197-r0: task do_package: Started
NOTE: recipe elfutils-0.197-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_populate_sysroot unihash changed to 65e65c983475d77c7477e18da033ba2793b2d3b8ffd175b0b1f04b50a0c32a4c
NOTE: Setscene tasks completed
NOTE: Running task 1887 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.47-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.47-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1888 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_configure)
NOTE: recipe binutils-2.47-r0: task do_configure: Started
NOTE: recipe binutils-2.47-r0: task do_configure: Succeeded
NOTE: Running task 1889 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_compile)
NOTE: recipe binutils-2.47-r0: task do_compile: Started
NOTE: recipe gcc-16.2.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_package unihash changed to e97ea194edb88897abc121ba2b4c98a1d0540cd305b059fbfb29f37141150d68
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_packagedata became valid
NOTE: Running setscene task 756 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe elfutils-0.197-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_package unihash changed to c111a369f0159a2b1f1f64a395c7ac3a9be90ee1a7f10841dd393d81624f17d5
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_packagedata became valid
NOTE: Running setscene task 753 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.197-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.197-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe binutils-2.47-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1892 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_install)
NOTE: recipe binutils-2.47-r0: task do_install: Started
NOTE: recipe binutils-2.47-r0: task do_install: Succeeded
NOTE: Running task 1893 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_package)
NOTE: recipe binutils-2.47-r0: task do_package: Started
NOTE: recipe binutils-2.47-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_package unihash changed to 08bcf8b4c3c06a8f68022665b278dd8f24c136b9a9c4daa62af916f44ba005ed
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_packagedata became valid
NOTE: Running setscene task 756 of 756 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.47-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1895 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_package_write_ipk)
NOTE: Running task 1896 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_package_write_deb)
NOTE: Running task 1897 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_package_write_rpm)
NOTE: Running task 1898 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_package_qa)
NOTE: recipe python3-3.14.10-r0: task do_package_write_deb: Started
NOTE: recipe python3-3.14.10-r0: task do_package_write_ipk: Started
NOTE: recipe python3-3.14.10-r0: task do_package_write_rpm: Started
NOTE: recipe python3-3.14.10-r0: task do_package_qa: Started
NOTE: recipe python3-3.14.10-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-3.14.10-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.10.bb:do_package_qa unihash changed to 8f97f37bc2d95868db912ddb62b4b4197a57cf83072a717d17c144dec1ff6efa
NOTE: recipe python3-3.14.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-3.14.10-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 1899 of 1899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jsonpointer_3.9.bb:do_build)
NOTE: Tasks Summary: Attempted 1899 tasks of which 1564 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: zlib-1.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-src went backwards which would break package feeds (from 0:1.4-r0 to 0:1.3.2-r0) [version-going-backwards]
ERROR: zlib-1.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-dbg went backwards which would break package feeds (from 0:1.4-r0 to 0:1.3.2-r0) [version-going-backwards]
ERROR: zlib-1.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-ptest went backwards which would break package feeds (from 0:1.4-r0 to 0:1.3.2-r0) [version-going-backwards]
ERROR: zlib-1.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-staticdev went backwards which would break package feeds (from 0:1.4-r0 to 0:1.3.2-r0) [version-going-backwards]
ERROR: zlib-1.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-dev went backwards which would break package feeds (from 0:1.4-r0 to 0:1.3.2-r0) [version-going-backwards]
ERROR: zlib-1.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-doc went backwards which would break package feeds (from 0:1.4-r0 to 0:1.3.2-r0) [version-going-backwards]
ERROR: zlib-1.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package zlib-locale went backwards which would break package feeds (from 0:1.4-r0 to 0:1.3.2-r0) [version-going-backwards]
ERROR: zlib-1.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package zlib went backwards which would break package feeds (from 0:1.4-r0 to 0:1.3.2-r0) [version-going-backwards]
ERROR: zlib-1.3.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8677698798161489474==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-jsonpointer/python3-jsonpointer: FILELIST: directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info -> /usr/lib/python3.14/site-packages/jsonpointer-3.9.dist-info, directory renamed /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info/licenses -> /usr/lib/python3.14/site-packages/jsonpointer-3.9.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-jsonpointer (sysroot):
  /usr/lib/python3.14/site-packages/jsonpointer-3.8.dist-info moved to /usr/lib/python3.14/site-packages/jsonpointer-3.9.dist-info

--===============8677698798161489474==--
