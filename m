Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D13BCD21682
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:16:14 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.11877.1728994566413312475
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:16:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=X0Ds9NcH;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=L6SeKxYH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010192901b7866-19e7f7b2-c362-4953-b9a6-a38051d46083-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994572;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qftCuaWtFPgFWlA95iusBA7NhrlZirXsJQmVNQF3eqs=;
	b=X0Ds9NcHNyXtF24zRLh4ME8kH69SEV+33F8spGVk1Fmoy7qGZVuEf43GbpbRrHjU
	hlzSbBPKwfLBzucNr5RWpBf3PvwmG1rLvRQzVXSRcxBsG68UUreaLQveCxLEKBFz/b8
	9CEkaMVGtH25nXw9yma75QWVl4XVAiXiOhrIxjMQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994572;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qftCuaWtFPgFWlA95iusBA7NhrlZirXsJQmVNQF3eqs=;
	b=L6SeKxYHuOx6QVZKawlL0vOFrw+NMkN+YFQlWkvcosed9ysk8JsR3GTWK7J2oXTv
	cQ9cokCZHGV/AySY3JAwNgjCWsFVpQB6tBazskGqSMKMg/wdZa4/ASXbF9fUTTw+SYU
	MOeyTsAS58V1I8s68PhHE7Q8t8yP0pJlejEJwxq0=
Content-Type: multipart/mixed; boundary="===============1565854589252172899=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wayland-protocols: upgrading to 1.38 FAILED
Message-ID: <01010192901b7866-19e7f7b2-c362-4953-b9a6-a38051d46083-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:16:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205891

--===============1565854589252172899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *wayland-protocols* to *1.38* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-wayland-protocols-upgrade-1.37-1.38.patch
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
From eb56057b305d980d9a1d9d77f3ebb9709e7e372c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Oct 2024 11:33:18 +0000
Subject: [PATCH] wayland-protocols: upgrade 1.37 -> 1.38

---
 .../{wayland-protocols_1.37.bb => wayland-protocols_1.38.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.37.bb => wayland-protocols_1.38.bb} (92%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.37.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb
similarity index 92%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.37.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.38.bb
index 2bf59b9719..36ac5f684d 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.37.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a70e9be924f2e8688e6824dceaf6188faacd5ae218dfac8d0a3d0976211ef326"
+SRC_URI[sha256sum] = "ff17292c05159d2b20ce6cacfe42d7e31a28198fa1429a769b03af7c38581dbe"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
-- 
2.44.1


--===============1565854589252172899==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wayland-protocols-upgrade-1.37-1.38.patch"

RnJvbSBlYjU2MDU3YjMwNWQ5ODBkOWExZDlkNzdmM2ViYjk3MDllN2UzNzJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgT2N0IDIwMjQgMTE6MzM6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
YXlsYW5kLXByb3RvY29sczogdXBncmFkZSAxLjM3IC0+IDEuMzgKCi0tLQogLi4uL3t3YXlsYW5k
LXByb3RvY29sc18xLjM3LmJiID0+IHdheWxhbmQtcHJvdG9jb2xzXzEuMzguYmJ9ICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQve3dheWxhbmQtcHJvdG9jb2xzXzEuMzcuYmIg
PT4gd2F5bGFuZC1wcm90b2NvbHNfMS4zOC5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXlsYW5kLXByb3RvY29sc18xLjM3LmJiIGIvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5bGFuZC1wcm90b2NvbHNfMS4zOC5iYgpzaW1pbGFy
aXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93
YXlsYW5kLXByb3RvY29sc18xLjM3LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
d2F5bGFuZC93YXlsYW5kLXByb3RvY29sc18xLjM4LmJiCmluZGV4IDJiZjU5Yjk3MTkuLjM2YWM1
ZjY4NGQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dheWxhbmQt
cHJvdG9jb2xzXzEuMzcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5
bGFuZC1wcm90b2NvbHNfMS4zOC5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT1jN2IxMmI2NzAyZGEzOGNhMDI4YWNlNTRhYWUzZDQ4NCBc
CiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zdGFibGUvcHJlc2VudGF0aW9uLXRpbWUvcHJl
c2VudGF0aW9uLXRpbWUueG1sO2VuZGxpbmU9MjY7bWQ1PTQ2NDZjZDdkOWVkYzlmYTU1ZGI5NDFm
MmQzYTdkYzUzIgogCiBTUkNfVVJJID0gImh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy93
YXlsYW5kL3dheWxhbmQtcHJvdG9jb2xzLy0vcmVsZWFzZXMvJHtQVn0vZG93bmxvYWRzL3dheWxh
bmQtcHJvdG9jb2xzLSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhNzBlOWJl
OTI0ZjJlODY4OGU2ODI0ZGNlYWY2MTg4ZmFhY2Q1YWUyMThkZmFjOGQwYTNkMDk3NjIxMWVmMzI2
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImZmMTcyOTJjMDUxNTlkMmIyMGNlNmNhY2ZlNDJkN2Uz
MWEyODE5OGZhMTQyOWE3NjliMDNhZjdjMzg1ODFkYmUiCiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9
ICJodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvd2F5bGFuZC93YXlsYW5kLXByb3RvY29s
cy8tL3RhZ3MiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJyZWxlYXNlcy8oP1A8cHZlcj4uKyki
Ci0tIAoyLjQ0LjEKCg==

--===============1565854589252172899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (918 cached, 1 parsed). 1875 targets, 41 skipped, 0 masked, 0 errors.
Removing 1 recipes from the allarch sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:0a71b6efae5614d8b176933b18798907ea74f474"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 89 Local 77 Mirrors 0 Missed 12 Current 201 (86% match, 95% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 588 of 893 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_recipe_qa)
NOTE: Running task 782 of 893 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_write_config)
NOTE: recipe wayland-protocols-1.38-r0: task do_recipe_qa: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_write_config: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_write_config: Succeeded
NOTE: recipe wayland-protocols-1.38-r0: task do_recipe_qa: Succeeded
NOTE: Running task 874 of 893 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_fetch)
NOTE: recipe wayland-protocols-1.38-r0: task do_fetch: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_fetch: Succeeded
NOTE: Running task 875 of 893 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_unpack)
NOTE: Running task 876 of 893 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-protocols-1.38-r0: task do_unpack: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_unpack: Succeeded
NOTE: Running task 877 of 893 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_patch)
NOTE: Running task 878 of 893 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_collect_spdx_deps)
NOTE: recipe wayland-protocols-1.38-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_collect_spdx_deps: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wayland-protocols-1.38-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wayland-protocols-1.38-r0: task do_patch: Succeeded
NOTE: Running task 879 of 893 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_deploy_source_date_epoch)
NOTE: Running task 880 of 893 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_populate_lic)
NOTE: recipe wayland-protocols-1.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_populate_lic: Started
NOTE: recipe wayland-protocols-1.38-r0: task do_populate_lic: Succeeded
NOTE: recipe wayland-protocols-1.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 881 of 893 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_configure)
NOTE: recipe wayland-protocols-1.38-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.0.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.5.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.12.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_populate_sysroot', 'virtual:native:/srv/
 pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'cmake-native', 'libtool-native', 'qemu-native', 'quilt-native', 'texinfo-dummy-native', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'unzip-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'libffi-native', 'libpcre2-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dtests=false ...
| The Meson build system
| Version: 1.5.2
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/wayland-protocols/1.38/wayland-protocols-1.38
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/wayland-protocols/1.38/build
| Build type: cross build
| Project name: wayland-protocols
| Project version: 1.38
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: allarch
| Host machine cpu: allarch
| Target machine cpu family: allarch
| Target machine cpu: allarch
| Found pkg-config: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/wayland-protocols/1.38/recipe-sysroot-native/usr/bin/pkg-config-native) 0.29.2
| Found CMake: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/wayland-protocols/1.38/recipe-sysroot-native/usr/bin/cmake (3.30.2)
| Build-time dependency wayland-scanner found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency wayland-scanner
| 
| ../wayland-protocols-1.38/meson.build:11:14: ERROR: Neither a subproject directory nor a wayland.wrap file was found.
| 
| A full log can be found at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/wayland-protocols/1.38/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/wayland-protocols/1.38/temp/run.do_configure.3449348:170 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/wayland-protocols/1.38/temp/run.do_configure.3449348, line 170
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/wayland-protocols/1.38/temp/run.do_configure.3449348, line 159
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/wayland-protocols/1.38/temp/run.do_configure.3449348, line 148
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/wayland-protocols/1.38/temp/run.do_configure.3449348, line 183
NOTE: recipe wayland-protocols-1.38-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 881 tasks of which 871 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241015113305.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241015113305.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/wayland-protocols/1.38/temp/log.do_configure.3449348
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: wayland-protocols-1.38-r0 do_configure: meson failed
ERROR: wayland-protocols-1.38-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/wayland-protocols/1.38/temp/run.do_configure.3449348' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/wayland-protocols/1.38/temp/log.do_configure.3449348
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb:do_configure) failed with exit code '1'

--===============1565854589252172899==--

