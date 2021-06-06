Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.26023.1623000257574536168
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 10:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 44A2A38C1290
	for <openembedded-core@lists.openembedded.org>; Sun,  6 Jun 2021 17:24:18 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to 8f3413c31ffd43c4ebde40894ac1b2f7cdf222c3 SUCCEEDED
Message-ID: <MADEUP.16860E22F021A775.23614@lists.openembedded.org>
X-Groupsio-MsgNum: 152739
Content-Type: multipart/mixed; boundary="===============4786704781880674785=="

--===============4786704781880674785==
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

--===============4786704781880674785==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+c0da615a93 to 0.0+git0+8f3413c31f
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+c0da615a93 to 0.0+git0+8f3413c31f
packages/core2-32-poky-linux/puzzles/puzzles-dev: RDEPENDS: removed "puzzles (['= 2:0.0+git0+c0da615a93-r0'])", added "puzzles (['= 2:0.0+git0+8f3413c31f-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+c0da615a93 to 0.0+git0+8f3413c31f
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+c0da615a93 to 0.0+git0+8f3413c31f
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+c0da615a93 to 0.0+git0+8f3413c31f
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+c0da615a93 to 0.0+git0+8f3413c31f
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+c0da615a93-r0'])", added "puzzles-dev (['= 2:0.0+git0+8f3413c31f-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+c0da615a93 to 0.0+git0+8f3413c31f

--===============4786704781880674785==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1452 entries from dependency cache.
Parsing recipes...done.
Parsing of 816 .bb files complete (815 cached, 1 parsed). 1452 targets, 31 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-d23eff5a71818aa68f7b7fedce9d5efb8f229c67"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d23eff5a71818aa68f7b7fedce9d5efb8f229c67"
workspace            = "master:ae7595a603f3fea1750f3f170e0e7c8098a352c7"

Initialising tasks...done.
Sstate summary: Wanted 231 Local 223 Network 0 Missed 8 Current 788 (96% match, 99% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2387 of 3227 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_fetch: Succeeded
NOTE: Running task 3213 of 3227 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: Running task 3214 of 3227 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_unpack: Succeeded
NOTE: Running task 3215 of 3227 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_patch: Succeeded
NOTE: Running task 3216 of 3227 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 3217 of 3227 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 3218 of 3227 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3219 of 3227 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_populate_lic: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_configure: Succeeded
NOTE: Running task 3220 of 3227 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_compile: Succeeded
NOTE: Running task 3221 of 3227 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_install: Succeeded
NOTE: Running task 3222 of 3227 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 3223 of 3227 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_package: Succeeded
NOTE: Running task 3224 of 3227 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_packagedata: Started
ERROR: puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0 do_packagedata: QA Issue: Package version for package puzzles-src went backwards which would break package feeds (from 2:0.0+git0+c0da615a93-r0 to 2:0.0+git0+8f3413c31f-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0 do_packagedata: QA Issue: Package version for package puzzles-dbg went backwards which would break package feeds (from 2:0.0+git0+c0da615a93-r0 to 2:0.0+git0+8f3413c31f-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0 do_packagedata: QA Issue: Package version for package puzzles-staticdev went backwards which would break package feeds (from 2:0.0+git0+c0da615a93-r0 to 2:0.0+git0+8f3413c31f-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0 do_packagedata: QA Issue: Package version for package puzzles-dev went backwards which would break package feeds (from 2:0.0+git0+c0da615a93-r0 to 2:0.0+git0+8f3413c31f-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0 do_packagedata: QA Issue: Package version for package puzzles-doc went backwards which would break package feeds (from 2:0.0+git0+c0da615a93-r0 to 2:0.0+git0+8f3413c31f-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0 do_packagedata: QA Issue: Package version for package puzzles-locale went backwards which would break package feeds (from 2:0.0+git0+c0da615a93-r0 to 2:0.0+git0+8f3413c31f-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0 do_packagedata: QA Issue: Package version for package puzzles went backwards which would break package feeds (from 2:0.0+git0+c0da615a93-r0 to 2:0.0+git0+8f3413c31f-r0) [version-going-backwards]
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_packagedata: Succeeded
NOTE: Running task 3225 of 3227 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 3226 of 3227 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8f3413c31f-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3227 of 3227 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 3227 tasks of which 3211 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============4786704781880674785==
Content-Type: text/x-diff; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSAxMDdiMmYwMzlmNDgxMTFiYmQyNDdmYzA5OTI5N2JkMjE2ODBiOGI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQGF1aC55b2N0b3Byb2plY3Qu
b3JnPgpEYXRlOiBTdW4sIDYgSnVuIDIwMjEgMTY6MTA6MDMgKzAwMDAKU3ViamVjdDogW1BBVENI
XSBwdXp6bGVzOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMt
c2F0by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiIHwgMjMgKysrKysrKysrKysrKysrKysrKysrLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxlc19naXQuYmIgYi9tZXRhL3Jl
Y2lwZXMtc2F0by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiCmluZGV4IDY5YzNmYWFkY2YuLjEyNGE3
ZDI4OWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxlc19naXQu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYgpAQCAtMSw4
ICsxLDI3IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVu
IHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRp
ZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxl
YXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhl
IGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0
YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVk
LicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5DRQorIyArKysgTElDRU5DRQor
IyBAQCAtMSw0ICsxLDQgQEAKKyMgLVRoaXMgc29mdHdhcmUgaXMgY29weXJpZ2h0IChjKSAyMDA0
LTIwMTQgU2ltb24gVGF0aGFtLgorIyArVGhpcyBzb2Z0d2FyZSBpcyBjb3B5cmlnaHQgKGMpIDIw
MDQtMjAyMSBTaW1vbiBUYXRoYW0uCisjICAKKyMgIFBvcnRpb25zIGNvcHlyaWdodCBSaWNoYXJk
IEJvdWx0b24sIEphbWVzIEhhcnZleSwgTWlrZSBQaW5uYSwgSm9uYXMKKyMgIEvDtmxrZXIsIERh
cml1c3ogT2xzemV3c2tpLCBNaWNoYWVsIFNjaGllcmwsIExhbWJyb3MgTGFtYnJvdSwgQmVybmQK
KyMgCisjCisKIFNVTU1BUlkgPSAiU2ltb24gVGF0aGFtJ3MgUG9ydGFibGUgUHV6emxlIENvbGxl
Y3Rpb24iCiBERVNDUklQVElPTiA9ICJDb2xsZWN0aW9uIG9mIHNtYWxsIGNvbXB1dGVyIHByb2dy
YW1zIHdoaWNoIGltcGxlbWVudCBvbmUtcGxheWVyIHB1enpsZSBnYW1lcy4iCiBIT01FUEFHRSA9
ICJodHRwOi8vd3d3LmNoaWFyay5ncmVlbmVuZC5vcmcudWsvfnNndGF0aGFtL3B1enpsZXMvIgog
TElDRU5TRSA9ICJNSVQiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTkNFO21kNT05
M2MyNTI1MTEzZTA5NGE0YTc0NGNmMTRkNGRlMDdlMiIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0xJQ0VOQ0U7bWQ1PTZlN2QyNGNmMWM5NDk4ODdlZTk0NDdhMWUyYTRhMjRjIgogCiAjIGd0
ayBzdXBwb3J0IGluY2x1ZGVzIGEgYnVuY2ggb2YgeDExIGhlYWRlcnMKIFJFUVVJUkVEX0RJU1RS
T19GRUFUVVJFUyA9ICJ4MTEiCkBAIC0xNyw3ICszNiw3IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0
LnRhcnRhcnVzLm9yZy9zaW1vbi9wdXp6bGVzLmdpdDticmFuY2g9bWFpbiBcCiAgICAgICAgICAg
ICIKIAogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIxIgotU1JDUkVWID0gImMwZGE2MTVhOTMz
YTY2NzZlMmM2Yjk1NzM2ODA2N2NhMWJjMTBhYmQiCitTUkNSRVYgPSAiOGYzNDEzYzMxZmZkNDNj
NGViZGU0MDg5NGFjMWIyZjdjZGYyMjJjMyIKIFBFID0gIjIiCiBQViA9ICIwLjArZ2l0JHtTUkNQ
Vn0iCiAKLS0gCjIuMTcuMQoK

--===============4786704781880674785==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/puzzles: PKGV changed from 0.0+gitAUTOINC+c0da615a93 [default] to 0.0+gitAUTOINC+8f3413c31f [default]
packages/core2-32-poky-linux/puzzles: PV changed from "0.0+gitAUTOINC+c0da615a93" to "0.0+gitAUTOINC+8f3413c31f"
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

--===============4786704781880674785==--
