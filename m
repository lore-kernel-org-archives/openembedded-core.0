Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF337C77B72
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:24 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.30357.1675272855166222111
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=CE8qqP6b;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101860e0b20ec-530e006a-069b-4025-bc30-b583f945e982-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272856;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HCMinWjLM/tQf7TOv2B21dHhvNnVMXoeDpmfcrfRK3M=;
	b=CE8qqP6bBlcYGpAQ9rvIyRfOzj/6pH04Xh07CdC6Nb9SizqA3t0u+Qvx0OcQ+nLz
	tfE/YBwRN9bn2cagYzhOX1MX0irQZ8YmNiDefDnaqMB0qGM9WibnW/yGjXr1uAgQYOY
	GTT8mt0PC2YXX8Ek6nqOuR7qP8SyDPR+vGhKDYRI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272856;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HCMinWjLM/tQf7TOv2B21dHhvNnVMXoeDpmfcrfRK3M=;
	b=ak8LMcOTw0rkKj12e69hj0RYNvIQ8w8AX5l4cg8iPQGi6Maa/QDGnRaUu8lyVTGc
	JuWEVkh664y4qYI/2SSUfVkAWBSTo7GxW6y0kGNF1BKdCIiEw71lviRH5S4OB6rFfkW
	sTT9ZpKkRH40g+xXJDLHuMcAeqNa2DBcvFakMb9c=
Content-Type: multipart/mixed; boundary="===============3073850974271487521=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lighttpd: upgrading to 1.4.68 FAILED
Message-ID: <010101860e0b20ec-530e006a-069b-4025-bc30-b583f945e982-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176605

--===============3073850974271487521==
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
--===============3073850974271487521==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lighttpd-upgrade-1.4.67-1.4.68.patch"

RnJvbSA1YjU3ZmU5ODg2MThlYTE1Y2ViODA3YmEyNDJjZjg1ODI2NWFjOTU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxMzoxNjoyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Z2h0dHBkOiB1cGdyYWRlIDEuNC42NyAtPiAxLjQuNjgKCi0tLQogLi4uL2xpZ2h0dHBkL3tsaWdo
dHRwZF8xLjQuNjcuYmIgPT4gbGlnaHR0cGRfMS40LjY4LmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2xpZ2h0dHBkL3tsaWdodHRwZF8xLjQuNjcuYmIgPT4gbGlnaHR0cGRf
MS40LjY4LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWdo
dHRwZC9saWdodHRwZF8xLjQuNjcuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQv
bGlnaHR0cGRfMS40LjY4LmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWdodHRwZC9saWdodHRwZF8xLjQuNjcuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9saWdodHRwZC9saWdodHRwZF8xLjQuNjguYmIKaW5kZXggODM4
ODgxZjIzOC4uM2YzZjk4MDhiOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xp
Z2h0dHBkL2xpZ2h0dHBkXzEuNC42Ny5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGln
aHR0cGQvbGlnaHR0cGRfMS40LjY4LmJiCkBAIC0xOSw3ICsxOSw3IEBAIFNSQ19VUkkgPSAiaHR0
cDovL2Rvd25sb2FkLmxpZ2h0dHBkLm5ldC9saWdodHRwZC9yZWxlYXNlcy0xLjQueC9saWdodHRw
ZC0ke1BWfS50CiAgICAgICAgICAgIGZpbGU6Ly9saWdodHRwZCBcCiAgICAgICAgICAgICIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjdlMDRkNzY3ZjUxYThkODI0YjMyZTI0ODNlZjI5NTA5ODI5
MjBkNDI3ZDEyNzJlZjQ2NjdmNDlkNmY4OWYzNTgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZTU2
ZjM3YWU1MmI2M2UxYWRhNGQ3NmNlNzgwMDVhZmZiNmU1NmVlYTJmNmJkYjBjZTE3ZDZkMzZlOTU4
MzM4NCIKIAogREVQRU5EUyA9ICJ2aXJ0dWFsL2NyeXB0IgogCi0tIAoyLjM3LjMKCg==

--===============3073850974271487521==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1697 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1697 targets, 41 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:9b1e5592c4bafae2db0870de8cf43a6b9dd3f014"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 40 Local 33 Mirrors 0 Missed 7 Current 182 (82% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 811 of 898 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.68.bb:do_fetch)
NOTE: Running task 871 of 898 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.68.bb:do_write_config)
NOTE: recipe lighttpd-1.4.68-r0: task do_fetch: Started
NOTE: recipe lighttpd-1.4.68-r0: task do_write_config: Started
NOTE: recipe lighttpd-1.4.68-r0: task do_fetch: Succeeded
NOTE: Running task 885 of 898 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.68.bb:do_unpack)
NOTE: Running task 886 of 898 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.68.bb:do_prepare_recipe_sysroot)
NOTE: recipe lighttpd-1.4.68-r0: task do_write_config: Succeeded
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
 me/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'glibc', 'initscripts', 'libxcrypt', 'systemd-systemctl-native', 'update-rc.d', 'zlib', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'attr', 'libpcre', 'gettext-native', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'sqlite3-native', 'zlib-native', 'openssl-native', 'readline-native', 'libnsl2-native', 'gdbm-native', 'libffi-native', 'bzip2-native', 'util-linux-libuuid-native', 'libtool-native', 'libtirpc-native', 'ncurses-native', 'bzip2', 'linux-libc-headers', 'libgcc', 're2c-native', 'texinfo-dummy-native', 'gettext-minimal-native', 'binutils-cross-i686', 'flex-native', 'mpfr-native', 'gmp-native', 'libmpc-native', 'zstd-native', 'gnu-config-native', 'opkg-utils', 'glib-2.0-native', 'python3-wheel-native', 'python3-build-native', 'python3-installer-native', 'python3-setuptools-native', 'attr-native', 'perl-native', 'm4-native', 'util-l
 inux-native', 'libpcre2-native', 'python3-flit-core-native', 'python3-pyproject-hooks-native', 'python3-packaging-native', 'make-native', 'libcap-ng-native', 'unzip-native']
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
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lighttpd/1.4.68-r0/temp/run.do_configure.154977:174 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lighttpd/1.4.68-r0/temp/run.do_configure.154977, line 174
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lighttpd/1.4.68-r0/temp/run.do_configure.154977, line 163
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lighttpd/1.4.68-r0/temp/run.do_configure.154977, line 149
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lighttpd/1.4.68-r0/temp/run.do_configure.154977, line 187
NOTE: recipe lighttpd-1.4.68-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 890 tasks of which 882 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.68.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: lighttpd-1.4.68-r0 do_configure: meson failed
ERROR: lighttpd-1.4.68-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lighttpd/1.4.68-r0/temp/run.do_configure.154977', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/lighttpd/1.4.68-r0/temp/log.do_configure.154977
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.68.bb:do_configure) failed with exit code '1'

--===============3073850974271487521==--

