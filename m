Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.16424.1623585061700516633
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jun 2021 04:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 0E87638C13E6
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Jun 2021 11:51:02 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to 8f3413c31ffd43c4ebde40894ac1b2f7cdf222c3 SUCCEEDED
Message-ID: <MADEUP.168822031CDCDC23.12353@lists.openembedded.org>
X-Groupsio-MsgNum: 152917
Content-Type: multipart/mixed; boundary="===============3944876811829477152=="

--===============3944876811829477152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *puzzles* to *8f3413c31ffd43c4ebde40894ac1b2f7cdf222c3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-puzzles-upgrade-to-latest-revision.patch
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

--===============3944876811829477152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/puzzles: PV changed from "0.0+gitAUTOINC+c0da615a93" to "0.0+gitAUTOINC+8f3413c31f"
packages/core2-32-poky-linux/puzzles: PKGV changed from 0.0+gitAUTOINC+c0da615a93 [default] to 0.0+gitAUTOINC+8f3413c31f [default]
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 13550472 to 13552004 (+0%)
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PV changed from "0.0+gitAUTOINC+c0da615a93" to "0.0+gitAUTOINC+8f3413c31f"
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+c0da615a93 to 0.0+git0+8f3413c31f
packages/core2-32-poky-linux/puzzles/puzzles-dev: PV changed from "0.0+gitAUTOINC+c0da615a93" to "0.0+gitAUTOINC+8f3413c31f"
packages/core2-32-poky-linux/puzzles/puzzles-dev: RDEPENDS: removed "puzzles (['= 2:0.0+git0+c0da615a93-r0'])", added "puzzles (['= 2:0.0+git0+8f3413c31f-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+c0da615a93 to 0.0+git0+8f3413c31f
packages/core2-32-poky-linux/puzzles/puzzles-doc: PV changed from "0.0+gitAUTOINC+c0da615a93" to "0.0+gitAUTOINC+8f3413c31f"
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+c0da615a93 to 0.0+git0+8f3413c31f
packages/core2-32-poky-linux/puzzles/puzzles-locale: PV changed from "0.0+gitAUTOINC+c0da615a93" to "0.0+gitAUTOINC+8f3413c31f"
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+c0da615a93 to 0.0+git0+8f3413c31f
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3474147 to 3477387 (+0%)
packages/core2-32-poky-linux/puzzles/puzzles-src: PV changed from "0.0+gitAUTOINC+c0da615a93" to "0.0+gitAUTOINC+8f3413c31f"
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+c0da615a93 to 0.0+git0+8f3413c31f
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PV changed from "0.0+gitAUTOINC+c0da615a93" to "0.0+gitAUTOINC+8f3413c31f"
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+c0da615a93-r0'])", added "puzzles-dev (['= 2:0.0+git0+8f3413c31f-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+c0da615a93 to 0.0+git0+8f3413c31f
packages/core2-32-poky-linux/puzzles/puzzles: PKGSIZE changed from 6614636 to 6618732 (+0%)
packages/core2-32-poky-linux/puzzles/puzzles: PV changed from "0.0+gitAUTOINC+c0da615a93" to "0.0+gitAUTOINC+8f3413c31f"
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+c0da615a93 to 0.0+git0+8f3413c31f

--===============3944876811829477152==
Content-Type: text/x-diff; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSA4OGVmMjBmY2NiMDJmZWQ2YWUyMGY4ZGI5ZDU3NTBhNTgyZTg4OWU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQGF1aC55b2N0b3Byb2plY3Qu
b3JnPgpEYXRlOiBTdW4sIDEzIEp1biAyMDIxIDExOjMwOjExICswMDAwClN1YmplY3Q6IFtQQVRD
SF0gcHV6emxlczogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNpcGVz
LXNhdG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYiB8IDIzICsrKysrKysrKysrKysrKysrKysrKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiIGIvbWV0YS9y
ZWNpcGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYgppbmRleCA2OWMzZmFhZGNmLi4xMjRh
N2QyODllIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc2F0by9wdXp6bGVzL3B1enpsZXNfZ2l0
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxlc19naXQuYmIKQEAgLTEs
OCArMSwyNyBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVl
biB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBk
aWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBs
ZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRo
ZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicg
dGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRl
ZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIExJQ0VOQ0UKKyMgKysrIExJQ0VOQ0UK
KyMgQEAgLTEsNCArMSw0IEBACisjIC1UaGlzIHNvZnR3YXJlIGlzIGNvcHlyaWdodCAoYykgMjAw
NC0yMDE0IFNpbW9uIFRhdGhhbS4KKyMgK1RoaXMgc29mdHdhcmUgaXMgY29weXJpZ2h0IChjKSAy
MDA0LTIwMjEgU2ltb24gVGF0aGFtLgorIyAgCisjICBQb3J0aW9ucyBjb3B5cmlnaHQgUmljaGFy
ZCBCb3VsdG9uLCBKYW1lcyBIYXJ2ZXksIE1pa2UgUGlubmEsIEpvbmFzCisjICBLw7Zsa2VyLCBE
YXJpdXN6IE9sc3pld3NraSwgTWljaGFlbCBTY2hpZXJsLCBMYW1icm9zIExhbWJyb3UsIEJlcm5k
CisjIAorIworCiBTVU1NQVJZID0gIlNpbW9uIFRhdGhhbSdzIFBvcnRhYmxlIFB1enpsZSBDb2xs
ZWN0aW9uIgogREVTQ1JJUFRJT04gPSAiQ29sbGVjdGlvbiBvZiBzbWFsbCBjb21wdXRlciBwcm9n
cmFtcyB3aGljaCBpbXBsZW1lbnQgb25lLXBsYXllciBwdXp6bGUgZ2FtZXMuIgogSE9NRVBBR0Ug
PSAiaHR0cDovL3d3dy5jaGlhcmsuZ3JlZW5lbmQub3JnLnVrL35zZ3RhdGhhbS9wdXp6bGVzLyIK
IExJQ0VOU0UgPSAiTUlUIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5DRTttZDU9
OTNjMjUyNTExM2UwOTRhNGE3NDRjZjE0ZDRkZTA3ZTIiCitMSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9MSUNFTkNFO21kNT02ZTdkMjRjZjFjOTQ5ODg3ZWU5NDQ3YTFlMmE0YTI0YyIKIAogIyBn
dGsgc3VwcG9ydCBpbmNsdWRlcyBhIGJ1bmNoIG9mIHgxMSBoZWFkZXJzCiBSRVFVSVJFRF9ESVNU
Uk9fRkVBVFVSRVMgPSAieDExIgpAQCAtMTcsNyArMzYsNyBAQCBTUkNfVVJJID0gImdpdDovL2dp
dC50YXJ0YXJ1cy5vcmcvc2ltb24vcHV6emxlcy5naXQ7YnJhbmNoPW1haW4gXAogICAgICAgICAg
ICAiCiAKIFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMgPSAiMSIKLVNSQ1JFViA9ICJjMGRhNjE1YTkz
M2E2Njc2ZTJjNmI5NTczNjgwNjdjYTFiYzEwYWJkIgorU1JDUkVWID0gIjhmMzQxM2MzMWZmZDQz
YzRlYmRlNDA4OTRhYzFiMmY3Y2RmMjIyYzMiCiBQRSA9ICIyIgogUFYgPSAiMC4wK2dpdCR7U1JD
UFZ9IgogCi0tIAoyLjE3LjEKCg==

--===============3944876811829477152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+c0da615a93 to 0.0+git0+8f3413c31f
packages/core2-32-poky-linux/puzzles/puzzles-dev: RDEPENDS: removed "puzzles (['= 2:0.0+git0+c0da615a93-r0'])", added "puzzles (['= 2:0.0+git0+8f3413c31f-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+c0da615a93 to 0.0+git0+8f3413c31f
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+c0da615a93 to 0.0+git0+8f3413c31f
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+c0da615a93 to 0.0+git0+8f3413c31f
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+c0da615a93 to 0.0+git0+8f3413c31f
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+c0da615a93-r0'])", added "puzzles-dev (['= 2:0.0+git0+8f3413c31f-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+c0da615a93 to 0.0+git0+8f3413c31f
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+c0da615a93 to 0.0+git0+8f3413c31f

--===============3944876811829477152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1454 entries from dependency cache.
Parsing recipes...done.
Parsing of 817 .bb files complete (816 cached, 1 parsed). 1454 targets, 31 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-d9cc33e47ab8995fe3ca5e312b54bab55399bc7c"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d9cc33e47ab8995fe3ca5e312b54bab55399bc7c"
workspace            = "master:29c42cf24da05abb499936556dad1902e110c5a7"

Initialising tasks...done.
Sstate summary: Wanted 231 Local 223 Network 0 Missed 8 Current 790 (96% match, 99% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2396 of 3236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_fetch: Succeeded
NOTE: Running task 3222 of 3236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: Running task 3223 of 3236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_unpack: Succeeded
NOTE: Running task 3224 of 3236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_patch: Succeeded
NOTE: Running task 3225 of 3236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 3226 of 3236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 3227 of 3236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_populate_lic: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3228 of 3236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_configure: Succeeded
NOTE: Running task 3229 of 3236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_compile: Succeeded
NOTE: Running task 3230 of 3236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_install: Succeeded
NOTE: Running task 3231 of 3236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 3232 of 3236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_package: Succeeded
NOTE: Running task 3233 of 3236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_packagedata: Started
ERROR: puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0 do_packagedata: QA Issue: Package version for package puzzles-src went backwards which would break package feeds (from 2:0.0+git0+c0da615a93-r0 to 2:0.0+git0+8f3413c31f-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0 do_packagedata: QA Issue: Package version for package puzzles-dbg went backwards which would break package feeds (from 2:0.0+git0+c0da615a93-r0 to 2:0.0+git0+8f3413c31f-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0 do_packagedata: QA Issue: Package version for package puzzles-staticdev went backwards which would break package feeds (from 2:0.0+git0+c0da615a93-r0 to 2:0.0+git0+8f3413c31f-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0 do_packagedata: QA Issue: Package version for package puzzles-dev went backwards which would break package feeds (from 2:0.0+git0+c0da615a93-r0 to 2:0.0+git0+8f3413c31f-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0 do_packagedata: QA Issue: Package version for package puzzles-doc went backwards which would break package feeds (from 2:0.0+git0+c0da615a93-r0 to 2:0.0+git0+8f3413c31f-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0 do_packagedata: QA Issue: Package version for package puzzles-locale went backwards which would break package feeds (from 2:0.0+git0+c0da615a93-r0 to 2:0.0+git0+8f3413c31f-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0 do_packagedata: QA Issue: Package version for package puzzles went backwards which would break package feeds (from 2:0.0+git0+c0da615a93-r0 to 2:0.0+git0+8f3413c31f-r0) [version-going-backwards]
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_packagedata: Succeeded
NOTE: Running task 3234 of 3236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 3235 of 3236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3236 of 3236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 3236 tasks of which 3220 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============3944876811829477152==--
