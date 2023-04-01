Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8937C77B77
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:01 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.32140.1680384535187890442
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=BdLW0Fpg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101873eb9307e-18285f21-5de3-48f7-a69c-2a76dcc0777c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BP6FA1pwohqj4nyUDlg+MEhMdgQJz5V/F9D5rKObisQ=;
	b=BdLW0FpgvajUczOceXtAfpckezwuT9RPffKliKWPEPS3Val0gxUlAcvLcgWTC9fr
	3culz81oIbiq7/+/Dwrhalq6tbjZMdt5R+0ZqlFJ9E0oPS/GqlDtAPBPHyEjdHaxuoT
	Bzid09AtsdPbVivJj4b5xXoUdLTxtBVMwFrxmXNY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BP6FA1pwohqj4nyUDlg+MEhMdgQJz5V/F9D5rKObisQ=;
	b=ZhPB+t5/kGuB+vpjreOuk5XEghubGJb15T/T94/eUIMVMpAWVKxnUoUSVqxUcCfs
	dI8b3WSPoy3Bj+nVcolwvLVPZFKlow/ksHBLvzPbLVdyPg7l8gesNLhfzQKh/XLmcAR
	U2oWogSLjs6JwJuaxmBuP9Af4+L79pBJmEbcuuoM=
Content-Type: multipart/mixed; boundary="===============5090595103219831854=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] at-spi2-core: upgrading to 2.48.0 FAILED
Message-ID: <010101873eb9307e-18285f21-5de3-48f7-a69c-2a76dcc0777c-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:56 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179563

--===============5090595103219831854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *at-spi2-core* to *2.48.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-at-spi2-core-upgrade-2.46.0-2.48.0.patch
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
--===============5090595103219831854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1796 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1796 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-2cbbf6b36e3f08c9760f40679da97b7681028f5d"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2cbbf6b36e3f08c9760f40679da97b7681028f5d"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 155 Local 148 Mirrors 0 Missed 7 Current 291 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 421 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1101 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_fetch)
NOTE: Running task 1120 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_write_config)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_fetch: Succeeded
NOTE: Running task 1121 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_unpack)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.48.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_unpack: Succeeded
NOTE: Running task 1122 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_patch)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_patch: Succeeded
NOTE: Running task 1123 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1124 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_populate_lic)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_lic: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_lic: Succeeded
NOTE: recipe at-spi2-core-2.48.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1590 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1599 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_configure)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-systemctl-native.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_7.2.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-w
 orker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.0.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 
 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['dbus', 'glib-2.0', 'glibc', 'libxml2', 'systemd-systemctl-native', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'gobject-introspection', 'libx11', 'libxi', 'libxtst', 'gettext-native', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'gobject-introspection-native', 'gtk-doc-native', 'libgcc', 'linux-libc-headers', 'zlib-native', 'glib-2.0-native', 'libffi-native', 'flex-native', 'libtool-native', 'gettext-minimal-native', 'autoconf-archive', 'opkg-utils', 'python3', 'libffi', 'zlib', 'attr-native', 'python3-installer-native', 'python3-build-native', 'python3-wheel-native', 'python3-setuptools-native', 'libpcre2', 'bash-completion', 'util-linux', 're2c-native', 'libxcb', 'xtrans', 'util-macros', 'xorgproto', 'texinfo-dummy-native', 'shadow-native', 'expat', 'update-rc.d', 'base-passwd', 'shadow', 'initscripts', 'systemd', 'libsm', 'shadow-sysroot', 'ba
 se-files', 'libmpc-native', 'zstd-native', 'gmp-native', 'gnu-config-native', 'mpfr-native', 'binutils-cross-i686', 'bzip2-native', 'libtirpc-native', 'util-linux-libuuid-native', 'ncurses-native', 'libnsl2-native', 'readline-native', 'openssl-native', 'gdbm-native', 'sqlite3-native', 'libxext', 'libxfixes', 'libpcre2-native', 'util-linux-native', 'm4-native', 'libxcrypt', 'util-linux-libuuid', 'openssl', 'sqlite3', 'libnsl2', 'ncurses', 'gdbm', 'readline', 'xz', 'libtirpc', 'bzip2', 'python3-flit-core-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'libpam', 'libcap-ng', 'libpthread-stubs', 'libxau', 'libxdmcp', 'xcb-proto', 'attr', 'libcap', 'libseccomp', 'libxkbcommon', 'zstd', 'acl', 'kmod', 'libice', 'perl-native', 'libcap-ng-native', 'unzip-native', 'cracklib', 'wayland-protocols', 'wayland', 'xkeyboard-config', 'make-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| gtkdocize: neither configure.ac nor configure.in exist
| NOTE: Executing meson -Dintrospection=yes -Ddocs=false -Dsystemd_user_dir=/usr/lib/systemd/user -Ddbus_daemon=/usr/bin/dbus-daemon -Dx11=yes...
| The Meson build system
| Version: 1.0.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/at-spi2-core/2.48.0-r0/at-spi2-core-2.48.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/at-spi2-core/2.48.0-r0/build
| Build type: cross build
| 
| ../at-spi2-core-2.48.0/meson.build:1:0: ERROR: Value "yes" (of type "string") for combo option "Enable GObject Introspection (depends on GObject)" is not one of the choices. Possible choices are (as string): "enabled", "disabled", "auto".
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/at-spi2-core/2.48.0-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/at-spi2-core/2.48.0-r0/temp/run.do_configure.4093204:182 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/at-spi2-core/2.48.0-r0/temp/run.do_configure.4093204, line 182
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/at-spi2-core/2.48.0-r0/temp/run.do_configure.4093204, line 171
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/at-spi2-core/2.48.0-r0/temp/run.do_configure.4093204, line 157
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/at-spi2-core/2.48.0-r0/temp/run.do_configure.4093204, line 195
NOTE: recipe at-spi2-core-2.48.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1599 tasks of which 1591 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: at-spi2-core-2.48.0-r0 do_configure: meson failed
ERROR: at-spi2-core-2.48.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/at-spi2-core/2.48.0-r0/temp/run.do_configure.4093204', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/at-spi2-core/2.48.0-r0/temp/log.do_configure.4093204
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_configure) failed with exit code '1'

--===============5090595103219831854==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-at-spi2-core-upgrade-2.46.0-2.48.0.patch"

RnJvbSA4MDEzZjI4NjUyNzM2OTM0NWU5M2I2NmExYzI4NTZjZmQ5ZDViNGZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAyMDoyMDoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGF0
LXNwaTItY29yZTogdXBncmFkZSAyLjQ2LjAgLT4gMi40OC4wCgotLS0KIC4uLi9hdGsve2F0LXNw
aTItY29yZV8yLjQ2LjAuYmIgPT4gYXQtc3BpMi1jb3JlXzIuNDguMC5iYn0gICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2F0ay97YXQtc3BpMi1jb3JlXzIuNDYuMC5iYiA9PiBhdC1zcGky
LWNvcmVfMi40OC4wLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2F0ay9hdC1zcGkyLWNvcmVfMi40Ni4wLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXRrL2F0
LXNwaTItY29yZV8yLjQ4LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLXN1cHBvcnQvYXRrL2F0LXNwaTItY29yZV8yLjQ2LjAuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2F0ay9hdC1zcGkyLWNvcmVfMi40OC4wLmJiCmluZGV4IGQ5MTYx
ZTFhY2IuLjhiYmMyMWM4NTMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2F0ay9h
dC1zcGkyLWNvcmVfMi40Ni4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2F0ay9hdC1z
cGkyLWNvcmVfMi40OC4wLmJiCkBAIC0xMSw3ICsxMSw3IEBAIE1BSl9WRVIgPSAiJHtAb2UudXRp
bHMudHJpbV92ZXJzaW9uKCIke1BWfSIsIDIpfSIKIAogU1JDX1VSSSA9ICIke0dOT01FX01JUlJP
Un0vJHtCUE59LyR7TUFKX1ZFUn0vJHtCUE59LSR7UFZ9LnRhci54eiIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImFhMGM4NmM3OWY3YThkNjdiYWU0OWE1YjdhNWFiMDg0MzBjNjA4Y2ZmZTZlMzNi
ZjQ3YTcyZjQxYWIwM2MzZDAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTA1YTViNmYxNzkwYjY4
ZWU4MDNiZmZhOWY1ZmFiNGNlYjU5MWZiNGZhZTBiMmY4YzYxMmM1NGYxZDRlOGEzMCIKIAogREVQ
RU5EUyA9ICJkYnVzIGdsaWItMi4wIGxpYnhtbDIiCiAKLS0gCjIuMzkuMgoK

--===============5090595103219831854==--

