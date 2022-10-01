Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E810C48BCF
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:53:53 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web12.420.1664643227316000309
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Nebe7KQP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 010101839477dadf-a9914141-05f0-49fb-a2e7-fc671655c38e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643226;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RqIP+nIcfpW+Ikx7HybHnv4E03qahOn+QR3EZmww3WI=;
	b=Nebe7KQPCsM+LR4nSSCc/aA1gZY0nLYlQtPKmjkTCvCoCZtXTajgq/xcokcgMwGW
	oiYVkhScZ0DzVrS6j4g2gnyp9NJajShiMDcLZYd6hOZMI+7+Wa9VZbBdfGmL5b76lRU
	SMOwFGywK2EAWqAGMq3CTG+QDeEhxN5EVDJZDvWs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643226;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RqIP+nIcfpW+Ikx7HybHnv4E03qahOn+QR3EZmww3WI=;
	b=BUHm11x9B+th1dHJug8V+To4y12f1Q0ie1KovNZRwdLAJY2oeYkTyuhqs2iogO8n
	Iht0w0g6hYjt0uPJd50+Skt/qsPL8JpCuEw5CuPAtcrSOarH1ODFXqMXgTjBueim0AH
	9JIBh1oLbxNc1sH8sPg06DaZudukO0iwJjF269XY=
Content-Type: multipart/mixed; boundary="===============0968549913410723173=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangrc.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dbus: upgrading to 1.3.2 FAILED
Message-ID: 
 <010101839477dadf-a9914141-05f0-49fb-a2e7-fc671655c38e-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:46 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:53:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171275

--===============0968549913410723173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dbus* to *1.3.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-dbus-upgrade-1.2.18-1.3.2.patch
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
--===============0968549913410723173==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dbus-upgrade-1.2.18-1.3.2.patch"

RnJvbSBiNGY5N2M5MGZmZmNlZjQ1NDE1OTg4NDYyNDQzMzIwMGM2MDc3ODY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAwODoxMjo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZGJ1czogdXBncmFkZSAxLjIuMTggLT4gMS4zLjIKCi0tLQogLi4uMy1kYnVzXzEuMi4x
OC5iYiA9PiBweXRob24zLWRidXNfMS4zLjIuYmJ9IHwgMjUgKysrKysrKysrKysrKysrKystLQog
MSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1kYnVzXzEuMi4xOC5iYiA9PiBw
eXRob24zLWRidXNfMS4zLjIuYmJ9ICg0NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWRidXNfMS4yLjE4LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWRidXNfMS4zLjIuYmIKc2ltaWxhcml0eSBpbmRleCA0NCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWRidXNfMS4yLjE4
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZGJ1c18x
LjMuMi5iYgppbmRleCBjNDY4N2RlMTNjLi5hMGFlNWQ5NDI1IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZGJ1c18xLjIuMTguYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWRidXNfMS4zLjIuYmIKQEAgLTEsMTMgKzEs
MzQgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBk
YXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVy
ZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2Ug
dXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hh
bmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4K
KyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykK
KyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBDT1BZSU5HCisjICsrKyBDT1BZSU5HCisjIEBA
IC0xLDMgKzEsNyBAQAorIyArVGhpcyBwcm9qZWN0J3MgbGljZW5zaW5nIGlzIFJFVVNFLWNvbXBs
aWFudCA8aHR0cHM6Ly9yZXVzZS5zb2Z0d2FyZS8+LgorIyArU2VlIGluZGl2aWR1YWwgZmlsZXMg
Zm9yIGZ1bGwgZGV0YWlscyBvZiBjb3B5cmlnaHQgYW5kIGxpY2Vuc2luZywKKyMgK2FuZCBzZWUg
TElDRU5TRVMvKi50eHQgZm9yIHRoZSBsaWNlbnNlIHRleHQuCisjICsKKyMgIEFzIG9mIHZlcnNp
b24gMC44Mi40LCBkYnVzLXB5dGhvbiBpdHNlbGYgaXMgcmVsZWFzZWQgdW5kZXIgdGhlIGZvbGxv
d2luZworIyAgcGVybWlzc2l2ZSBub24tY29weWxlZnQgbGljZW5zZSAodGhlIHNhbWUgb25lIHRo
YXQgd2FzIHByb3Bvc2VkIGZvcgorIyAgRC1CdXMgY29yZSBidXQgd2Fzbid0IGFjaGlldmVkKToK
KyMgCisjCisKIFNVTU1BUlkgPSAiUHl0aG9uIGJpbmRpbmdzIGZvciB0aGUgREJ1cyBpbnRlci1w
cm9jZXNzIGNvbW11bmljYXRpb24gc3lzdGVtIgogU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBI
T01FUEFHRSA9ICJodHRwOi8vd3d3LmZyZWVkZXNrdG9wLm9yZy9Tb2Z0d2FyZS9kYnVzIgogTElD
RU5TRSA9ICJNSVQiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1iMDMy
NDA1MTg5OTRkZjZkOGM5NzQ2NzU2NzVlNWNhNCIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0NPUFlJTkc7bWQ1PTk3ZjU4OTUxMzAwYWE1MmE5ZjllM2E2MmJkNWM4NDZjIgogREVQRU5EUyA9
ICJleHBhdCBkYnVzIGdsaWItMi4wIHZpcnR1YWwvbGliaW50bCIKIAogU1JDX1VSSSA9ICJodHRw
Oi8vZGJ1cy5mcmVlZGVza3RvcC5vcmcvcmVsZWFzZXMvZGJ1cy1weXRob24vZGJ1cy1weXRob24t
JHtQVn0udGFyLmd6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTJiZGQxZTY4YjQ1NTk2Yzgz
MzMwN2E1ZmY0YjIxN2VlNjkyOWExNTAyZjUzNDFiYWUyOGZkMTIwYWNmNzI2MCIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICJhZDY3ODE5MzA4NjE4YjUwNjk1MzdiZTIzN2Y4ZTY4Y2ExYzdmY2M5NWVl
NGExMjFmZTY4NDViMTQxODI0OGY4IgogCiBTID0gIiR7V09SS0RJUn0vZGJ1cy1weXRob24tJHtQ
Vn0iCiAKLS0gCjIuMzEuMQoK

--===============0968549913410723173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (884 cached, 1 parsed). 1661 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:27b688e10ff659e4861effcbfe6abf776b324590"
workspace            = "master:5200799866b92259e855051112520006e1aaaac0"

Initialising tasks...done.
Sstate summary: Wanted 143 Local 136 Mirrors 0 Missed 7 Current 317 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1479 of 1672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_fetch)
NOTE: recipe python3-dbus-1.3.2-r0: task do_fetch: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 1659 of 1672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_unpack)
NOTE: Running task 1660 of 1672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-dbus-1.3.2-r0: task do_unpack: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1661 of 1672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_patch)
NOTE: recipe python3-dbus-1.3.2-r0: task do_patch: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_patch: Succeeded
NOTE: Running task 1662 of 1672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1663 of 1672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_populate_lic)
NOTE: recipe python3-dbus-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_populate_lic: Started
NOTE: recipe python3-dbus-1.3.2-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-dbus-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1664 of 1672 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_configure)
NOTE: recipe python3-dbus-1.3.2-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-
 worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf/autoconf_2.71.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.
 10.6.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['dbus', 'expat', 'glib-2.0', 'glibc', 'gcc-cross-i686', 'gcc-runtime', 'libtool-cross', 'libtool-native', 'python3', 'quilt-native', 'autoconf-native', 'automake-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'm4-native', 'texinfo-dummy-native', 'gnu-config-native', 'readline', 'opkg-utils', 'zlib', 'xz', 'libffi', 'sqlite3', 'libnsl2', 'gdbm', 'libxcrypt', 'bzip2', 'openssl', 'util-linux-libuuid', 'libtirpc', 'ncurses', 'attr-native', 'update-rc.d', 'shadow-native', 'libsm', 'initscripts', 'systemd', 'base-passwd', 'shadow-sysroot', 'libx11', 'autoconf-archive', 'base-files', 'shadow', 'bash-completion', 'libpcre', 'util-linux', 'libgcc', 'linux-libc-headers', 'libmpc-native', 'mpfr-native', 'zstd-native', 'binutils-cross-i686', 'xz-native', 'gmp-native', 'flex-native', 'zlib-native', 'readline-native', 'openssl-native', 'util-linux-libuuid-native', 'bzip2-native', 'sqlite3-native', 'libtirpc-native', '
 ncurses-native', 'libnsl2-native', 'libffi-native', 'gdbm-native', 'gettext-minimal-native', 'xorgproto', 'libice', 'util-macros', 'xtrans', 'libpam', 'kmod', 'acl', 'libxkbcommon', 'libseccomp', 'zstd', 'libcap', 'libxcb', 'attr', 'libcap-ng', 'perl-native', 'cracklib', 'flex', 'wayland-protocols', 'libxml2', 'wayland', 'xkeyboard-config', 'libpthread-stubs', 'xcb-proto', 'libxau', 'libxdmcp', 'make-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-glibc', 'i686-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.16.5
| Copyright (C) 2021 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <https://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
| 
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.16
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint --exclude=gtkdocize -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/dbus-python-1.3.2/m4/ -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/dbus-python-1.3.2/m4/ -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot-native/usr/share/aclocal/ --force -I m4
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, 'build-aux'.
| libtoolize: copying file 'build-aux/ltmain.sh'
| libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
| libtoolize: copying file 'm4/libtool.m4'
| libtoolize: copying file 'm4/ltoptions.m4'
| libtoolize: copying file 'm4/ltsugar.m4'
| libtoolize: copying file 'm4/ltversion.m4'
| libtoolize: copying file 'm4/lt~obsolete.m4'
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/dbus-python-1.3.2/m4/ -I /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot-native/usr/share/aclocal/ --force -I m4
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/dbus-python-1.3.2/m4/ --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/dbus-python-1.3.2/m4/ --include=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| configure.ac:25: installing 'build-aux/compile'
| configure.ac:27: installing 'build-aux/missing'
| Makefile.am: installing 'build-aux/depcomp'
| autoreconf: 'build-aux/config.sub' is updated
| autoreconf: 'build-aux/config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../dbus-python-1.3.2/configure  --build=x86_64-linux 		  --host=i686-poky-linux 		  --target=i686-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking 		  --with-libtool-sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot  --disable-documentation --disable-static
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/ix86-common
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/poky/meta/site/common
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot/usr/share/i686-poky-linux_config_site.d/ncurses_config
| checking whether make supports nested variables... yes
| checking whether to enable maintainer-specific portions of Makefiles... yes
| checking for i686-poky-linux-gcc... i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot accepts -g... yes
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot option to enable C11 features... none needed
| checking whether i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot understands -c and -o together... yes
| checking for stdio.h... (cached) yes
| checking for stdlib.h... (cached) yes
| checking for string.h... (cached) yes
| checking for inttypes.h... (cached) yes
| checking for stdint.h... (cached) yes
| checking for strings.h... (cached) yes
| checking for sys/stat.h... (cached) yes
| checking for sys/types.h... (cached) yes
| checking for unistd.h... (cached) yes
| checking for wchar.h... yes
| checking for minix/config.h... no
| checking whether it is safe to define __EXTENSIONS__... yes
| checking whether _XOPEN_SOURCE should be defined... no
| checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c
| checking whether build environment is sane... yes
| checking for i686-poky-linux-strip... i686-poky-linux-strip
| checking for a race-free mkdir -p... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports the include directive... yes (GNU style)
| checking whether UID '6000' is supported by ustar format... yes
| checking whether GID '6000' is supported by ustar format... yes
| checking how to create a ustar tar archive... gnutar
| checking dependency style of i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot... none
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... i686-poky-linux-gnu
| checking for native Windows host... no
| checking how to print strings... printf
| checking for a sed that does not truncate output... (cached) sed
| checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep
| checking for egrep... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep -E
| checking for fgrep... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/grep -F
| checking for ld used by i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot... i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot
| checking if the linker (i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot  ) is GNU ld... yes
| checking for BSD- or MS-compatible name lister (nm)... i686-poky-linux-gcc-nm
| checking the name lister (i686-poky-linux-gcc-nm) interface... BSD nm
| checking whether ln -s works... yes
| checking the maximum length of command line arguments... 1572864
| checking how to convert x86_64-pc-linux-gnu file names to i686-poky-linux-gnu format... func_convert_file_noop
| checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
| checking for i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot   option to reload object files... -r
| checking for i686-poky-linux-file... no
| checking for file... file
| configure: WARNING: using cross tools not prefixed with host triplet
| checking for i686-poky-linux-objdump... i686-poky-linux-objdump
| checking how to recognize dependent libraries... pass_all
| checking for i686-poky-linux-dlltool... no
| checking for dlltool... no
| checking how to associate runtime and link libraries... printf %s\n
| checking for i686-poky-linux-ar... i686-poky-linux-gcc-ar
| checking for archiver @FILE support... @
| checking for i686-poky-linux-strip... (cached) i686-poky-linux-strip
| checking for i686-poky-linux-ranlib... i686-poky-linux-gcc-ranlib
| checking command to parse i686-poky-linux-gcc-nm output from i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot object... ok
| checking for sysroot... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot
| checking for a working dd... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/dd
| checking how to truncate binary pipes... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/dd bs=4096 count=1
| checking for i686-poky-linux-mt... no
| checking for mt... no
| checking if : is a manifest tool... no
| checking for dlfcn.h... yes
| checking for objdir... .libs
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot supports -fno-rtti -fno-exceptions... no
| checking for i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot option to produce PIC... -fPIC -DPIC
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot PIC flag -fPIC -DPIC works... yes
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot static flag -static works... yes
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot supports -c -o file.o... yes
| checking if i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot supports -c -o file.o... (cached) yes
| checking whether the i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot linker (i686-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot  ) supports shared libraries... yes
| checking whether -lc should be explicitly linked in... no
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking whether stripping libraries is possible... yes
| checking if libtool supports shared libraries... yes
| checking whether to build shared libraries... yes
| checking whether to build static libraries... no
| checking for inline... inline
| checking for gawk... (cached) gawk
| checking for python... /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot-native/usr/bin/python3-native/python3
| checking for a version of Python >= '2.1.0'... yes
| checking for a version of Python >= '2.7'... yes
| checking for the sysconfig Python package... yes
| checking for Python include path... -I/usr/include/python3.10
| checking for Python library path... -L/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/recipe-sysroot/usr/lib -lpython3.10
| checking for Python site-packages path... /usr/lib/python3.10/site-packages
| checking for Python platform specific site-packages path... /usr/lib/python3.10/site-packages
| checking python extra libraries... -lcrypt -ldl  -lpthread -lm -lm
| checking python extra linking flags... -Xlinker -export-dynamic
| checking consistency of all components of python development environment... no
| configure: error: in `/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/build':
| configure: error:
|   Could not link test program to Python. Maybe the main Python library has been
|   installed in some non-standard library path. If so, pass it to configure,
|   via the LIBS environment variable.
|   Example: ./configure LIBS="-L/usr/non-standard-path/python/lib"
|   ============================================================================
|    ERROR!
|    You probably have to install the development version of the Python package
|    for your distribution.  The exact name of this package varies among them.
|   ============================================================================
| 
| See `config.log' for more details
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/build/config.log
| ERROR: configure failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/temp/run.do_configure.3922632:297 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/temp/run.do_configure.3922632, line 297
| 	#2: oe_runconf, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/temp/run.do_configure.3922632, line 273
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/temp/run.do_configure.3922632, line 243
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/temp/run.do_configure.3922632, line 163
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/temp/run.do_configure.3922632, line 301
NOTE: recipe python3-dbus-1.3.2-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1664 tasks of which 1657 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-dbus-1.3.2-r0 do_configure: configure failed
ERROR: python3-dbus-1.3.2-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/temp/run.do_configure.3922632', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbus/1.3.2-r0/temp/log.do_configure.3922632
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.3.2.bb:do_configure) failed with exit code '1'

--===============0968549913410723173==--

