Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 275F9C678DA
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:31 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.145838.1673805744936370517
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ljorOIfr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010185b698c7b9-f7cf1480-7958-4e16-96cf-4c1c9d84d9c1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=X52e2nVQVcdfMJRdF8/k0WUjjEzkuBJHR1JHlyVCfz4=;
	b=ljorOIfrt07zQUppfqBcenRX9p8L1uDK0yuTNfkzxY8ypd87xPzCTIRi8kS3xBIh
	5VFA+T2kVUCXjCrOiE5W0o1NJs66/2he7+a38U9tcBg7v2poHLE1MOxYWzyZ9Nxs4um
	FMivP0U54B3R6QiOHJVBpEiyId+1H8d+2kP9FuMM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=X52e2nVQVcdfMJRdF8/k0WUjjEzkuBJHR1JHlyVCfz4=;
	b=koKyhj4vnWTVNjZ/peGHnlOnQ976n1dFP2xEWnOp7AVwAlskRZPwznLBp81aTsky
	HOJAetJX1mCivY80THbm9c2m3sR7Tf216Ss73GGvPQ7/L4sfSNKz80Y4ZZmpaieZYjO
	hI4qXzMyYvDZyPancsXCwTX/x7pcUnETIzPkUCfM=
Content-Type: multipart/mixed; boundary="===============4297138691407529362=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lighttpd: upgrading to 1.4.68 FAILED
Message-ID: <01010185b698c7b9-f7cf1480-7958-4e16-96cf-4c1c9d84d9c1-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175940

--===============4297138691407529362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lighttpd* to *1.4.68* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-lighttpd-upgrade-1.4.67-1.4.68.patch
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
--===============4297138691407529362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1696 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1696 targets, 41 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:124a958e7ea8281e09cc4b0b93d4f11a1e89744c"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 39 Local 32 Mirrors 0 Missed 7 Current 183 (82% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 811 of 898 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.68.bb:do_fetch)
NOTE: Running task 871 of 898 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.68.bb:do_write_config)
NOTE: recipe lighttpd-1.4.68-r0: task do_fetch: Started
NOTE: recipe lighttpd-1.4.68-r0: task do_write_config: Started
NOTE: recipe lighttpd-1.4.68-r0: task do_write_config: Succeeded
NOTE: recipe lighttpd-1.4.68-r0: task do_fetch: Succeeded
NOTE: Running task 885 of 898 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.68.bb:do_unpack)
NOTE: Running task 886 of 898 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.68.bb:do_prepare_recipe_sysroot)
NOTE: recipe lighttpd-1.4.68-r0: task do_unpack: Started
NOTE: recipe lighttpd-1.4.68-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lighttpd-1.4.68-r0: task do_unpack: Succeeded
NOTE: Running task 887 of 898 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.68.bb:do_patch)
NOTE: recipe lighttpd-1.4.68-r0: task do_patch: Started
NOTE: recipe lighttpd-1.4.68-r0: task do_patch: Succeeded
NOTE: Running task 888 of 898 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.68.bb:do_deploy_source_date_epoch)
NOTE: Running task 889 of 898 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.68.bb:do_populate_lic)
NOTE: recipe lighttpd-1.4.68-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lighttpd-1.4.68-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lighttpd-1.4.68-r0: task do_populate_lic: Started
NOTE: recipe lighttpd-1.4.68-r0: task do_populate_lic: Succeeded
NOTE: recipe lighttpd-1.4.68-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 890 of 898 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.68.bb:do_configure)
NOTE: recipe lighttpd-1.4.68-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-systemctl-native.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pok
 ybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_7.2.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.0.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/ho
 me/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'glibc', 'initscripts', 'libxcrypt', 'systemd-systemctl-native', 'update-rc.d', 'zlib', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'attr', 'libpcre', 'gettext-native', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'libgcc', 'linux-libc-headers', 'texinfo-dummy-native', 'gmp-native', 'flex-native', 'mpfr-native', 'zstd-native', 'zlib-native', 'binutils-cross-i686', 'libmpc-native', 'gnu-config-native', 'libtool-native', 'python3-build-native', 'python3-installer-native', 'python3-setuptools-native', 'python3-wheel-native', 'attr-native', 'opkg-utils', 'gdbm-native', 'openssl-native', 'libnsl2-native', 'ncurses-native', 'bzip2-native', 'util-linux-libuuid-native', 'sqlite3-native', 'libffi-native', 'libtirpc-native', 'readline-native', 'glib-2.0-native', 'gettext-minimal-native', 'bzip2', 're2c-native', 'm4-native', 'python3-flit-core-nat
 ive', 'python3-pyproject-hooks-native', 'python3-packaging-native', 'perl-native', 'util-linux-native', 'libpcre2-native', 'unzip-native', 'make-native', 'libcap-ng-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dwith_xattr=true -Dwith_bzip=false -Dwith_krb5=false -Dwith_ldap=false -Dwith_libev=false -Dwith_lua=false -Dwith_mysql=false -Dwith_openssl=true -Dwith_pcre=true -Dwith_webdav_locks=false -Dwith_webdav_props=false -Dwith_zlib=true -Dwith_zstd=false...
| The Meson build system
| Version: 1.0.0
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lighttpd/1.4.68-r0/lighttpd-1.4.68
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lighttpd/1.4.68-r0/build
| Build type: cross build
| 
| ../lighttpd-1.4.68/meson.build:1:0: ERROR: Value "false" (of type "string") for combo option "with bzip2-support for mod_deflate [default: off]" is not one of the choices. Possible choices are (as string): "enabled", "disabled", "auto".
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lighttpd/1.4.68-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lighttpd/1.4.68-r0/temp/run.do_configure.158564:174 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lighttpd/1.4.68-r0/temp/run.do_configure.158564, line 174
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lighttpd/1.4.68-r0/temp/run.do_configure.158564, line 163
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lighttpd/1.4.68-r0/temp/run.do_configure.158564, line 149
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lighttpd/1.4.68-r0/temp/run.do_configure.158564, line 187
NOTE: recipe lighttpd-1.4.68-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 890 tasks of which 882 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.68.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: lighttpd-1.4.68-r0 do_configure: meson failed
ERROR: lighttpd-1.4.68-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lighttpd/1.4.68-r0/temp/run.do_configure.158564', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lighttpd/1.4.68-r0/temp/log.do_configure.158564
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.68.bb:do_configure) failed with exit code '1'

--===============4297138691407529362==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lighttpd-upgrade-1.4.67-1.4.68.patch"

RnJvbSAxYWJlYWNmMjNkNTI1OTk3Mzk1MDZlYWVhMmNjMWY5ZTEyODNlMTM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMTM6NDc6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWdodHRwZDogdXBncmFkZSAxLjQuNjcgLT4gMS40LjY4CgotLS0KIC4uLi9saWdodHRwZC97bGln
aHR0cGRfMS40LjY3LmJiID0+IGxpZ2h0dHBkXzEuNC42OC5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWdodHRwZC97bGlnaHR0cGRfMS40LjY3LmJiID0+IGxpZ2h0dHBk
XzEuNC42OC5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGln
aHR0cGQvbGlnaHR0cGRfMS40LjY3LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpZ2h0dHBk
L2xpZ2h0dHBkXzEuNC42OC5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQvbGlnaHR0cGRfMS40LjY3LmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQvbGlnaHR0cGRfMS40LjY4LmJiCmluZGV4IDgz
ODg4MWYyMzguLjNmM2Y5ODA4YjggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9s
aWdodHRwZC9saWdodHRwZF8xLjQuNjcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xp
Z2h0dHBkL2xpZ2h0dHBkXzEuNC42OC5iYgpAQCAtMTksNyArMTksNyBAQCBTUkNfVVJJID0gImh0
dHA6Ly9kb3dubG9hZC5saWdodHRwZC5uZXQvbGlnaHR0cGQvcmVsZWFzZXMtMS40LngvbGlnaHR0
cGQtJHtQVn0udAogICAgICAgICAgICBmaWxlOi8vbGlnaHR0cGQgXAogICAgICAgICAgICAiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3ZTA0ZDc2N2Y1MWE4ZDgyNGIzMmUyNDgzZWYyOTUwOTgy
OTIwZDQyN2QxMjcyZWY0NjY3ZjQ5ZDZmODlmMzU4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImU1
NmYzN2FlNTJiNjNlMWFkYTRkNzZjZTc4MDA1YWZmYjZlNTZlZWEyZjZiZGIwY2UxN2Q2ZDM2ZTk1
ODMzODQiCiAKIERFUEVORFMgPSAidmlydHVhbC9jcnlwdCIKIAotLSAKMi4zNy4zCgo=

--===============4297138691407529362==--

