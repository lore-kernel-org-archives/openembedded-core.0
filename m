Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1093C47088
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:13:01 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web12.24663.1665871974979398968
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=m3jM0mbe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010183ddb5127b-44db6d37-a827-4bd6-aa1b-48f8e5259cbe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871975;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lHJBvKiCQZtQyU32zVtjKPaAxiJb5gJN19L+bMYqKdg=;
	b=m3jM0mbeN1Cm9gBKTgGGsfM1rF4/qsn/ZHigwcjsmR5iW3VZlrsFnU5tCoi897OH
	6oqnHrJjNbIimtOKzLJsRStrMJ4GqnpJ89c81gBxRfkc58VoSx/pwQ3sNbVGmx+Gvr9
	DVxB8AJvQOzWlRLfe+8VrzZ+hvhW/MuFnx6x+0Dc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871975;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lHJBvKiCQZtQyU32zVtjKPaAxiJb5gJN19L+bMYqKdg=;
	b=Lv0hxX1SMKZIzvwizKfgUOA2FiRn+J8/2c4l+KM8Em4l4vQmbpW0b5NogsjAPjWa
	TFIPcYYTAZSOBSALLr2X6NOqsPbvgtS99dLYl8iyAvpmHFzlVFVOhLJe7Zlq0DnShq/
	TBo//NU+o/d+5XSv+MhkOUATNgw4f5DFY1g6NJY8=
Content-Type: multipart/mixed; boundary="===============7706614646569491420=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsoup: upgrading to 3.2.1 FAILED
Message-ID: <01010183ddb5127b-44db6d37-a827-4bd6-aa1b-48f8e5259cbe-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:12:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171872

--===============7706614646569491420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libsoup* to *3.2.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libsoup-upgrade-3.0.7-3.2.1.patch
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
--===============7706614646569491420==
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
meta-yocto-bsp       = "tmp-auh-upgrades:29437ff7719c6d58f7c40c93a7e5121307560a85"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 175 Local 168 Mirrors 0 Missed 7 Current 261 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1194 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.1.bb:do_fetch)
NOTE: Running task 1394 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.1.bb:do_write_config)
NOTE: recipe libsoup-3.2.1-r0: task do_fetch: Started
NOTE: recipe libsoup-3.2.1-r0: task do_write_config: Started
NOTE: recipe libsoup-3.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1582 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.1.bb:do_unpack)
NOTE: Running task 1583 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-3.2.1-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-3.2.1-r0: task do_unpack: Started
NOTE: recipe libsoup-3.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-3.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1584 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.1.bb:do_patch)
NOTE: recipe libsoup-3.2.1-r0: task do_patch: Started
NOTE: recipe libsoup-3.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1585 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1586 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.1.bb:do_populate_lic)
NOTE: recipe libsoup-3.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-3.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.2.1-r0: task do_populate_lic: Started
NOTE: recipe libsoup-3.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsoup-3.2.1-r0: task do_populate_lic: Succeeded
NOTE: Running task 1587 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.1.bb:do_configure)
NOTE: recipe libsoup-3.2.1-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_7.1.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysr
 oot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.49.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.63.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.
 bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glib-2.0', 'glibc', 'libxml2', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'gobject-introspection', 'libpsl', 'nghttp2', 'sqlite3', 'gettext-native', 'glib-2.0-native', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'gobject-introspection-native', 'gtk-doc-native', 'libtool-native', 'gnu-config-native', 'gmp-native', 'mpfr-native', 'zstd-native', 'zlib-native', 'texinfo-dummy-native', 'libmpc-native', 'linux-libc-headers', 'flex-native', 'binutils-cross-i686', 'python3', 'zlib', 'libffi-native', 'libgcc', 're2c-native', 'attr-native', 'libpcre-native', 'util-linux-native', 'gettext-minimal-native', 'icu', 'bash-completion', 'libpcre', 'libffi', 'util-linux', 'libnsl2-native', 'util-linux-libuuid-native', 'libtirpc-native', 'readline-native', 'gdbm-native', 'sqlite3-native', 'openssl-native', 'ncurses-native', 'bzip2-native', 'opkg-utils', 'autoconf
 -archive', 'python3-setuptools-native', 'python3-picobuild-native', 'python3-wheel-native', 'python3-installer-native', 'm4-native', 'readline', 'libtirpc', 'libnsl2', 'xz', 'ncurses', 'libxcrypt', 'openssl', 'bzip2', 'gdbm', 'util-linux-libuuid', 'libcap-ng-native', 'libpcre2-native', 'libpam', 'libcap-ng', 'perl-native', 'python3-flit-core-native', 'flex', 'cracklib', 'make-native', 'unzip-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| gtkdocize: neither configure.ac nor configure.in exist
| NOTE: Executing meson -Dgtk_doc=false -Dintrospection=enabled -Dgssapi=disabled -Dvapi=disabled -Dtls_check=false...
| The Meson build system
| Version: 0.63.2
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libsoup/3.2.1-r0/libsoup-3.2.1
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libsoup/3.2.1-r0/build
| Build type: cross build
| 
| ../libsoup-3.2.1/meson.build:1:0: ERROR: Unknown options: "gtk_doc"
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libsoup/3.2.1-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libsoup/3.2.1-r0/temp/run.do_configure.2879472:183 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libsoup/3.2.1-r0/temp/run.do_configure.2879472, line 183
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libsoup/3.2.1-r0/temp/run.do_configure.2879472, line 172
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libsoup/3.2.1-r0/temp/run.do_configure.2879472, line 158
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libsoup/3.2.1-r0/temp/run.do_configure.2879472, line 196
NOTE: recipe libsoup-3.2.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1587 tasks of which 1579 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.1.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libsoup-3.2.1-r0 do_configure: meson failed
ERROR: libsoup-3.2.1-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libsoup/3.2.1-r0/temp/run.do_configure.2879472', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libsoup/3.2.1-r0/temp/log.do_configure.2879472
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.1.bb:do_configure) failed with exit code '1'

--===============7706614646569491420==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsoup-upgrade-3.0.7-3.2.1.patch"

RnJvbSBhNTE1ZTBmNGM1NDY0MzE2ZDlhNjhjNWEwN2UxYmViMzlmNjhhNzlhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMjE6MTY6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJzb3VwOiB1cGdyYWRlIDMuMC43IC0+IDMuMi4xCgotLS0KIC4uLi9saWJzb3VwL3tsaWJzb3Vw
XzMuMC43LmJiID0+IGxpYnNvdXBfMy4yLjEuYmJ9ICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYnNvdXAve2xpYnNvdXBfMy4wLjcuYmIgPT4gbGlic291cF8zLjIuMS5i
Yn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJzb3VwL2xpYnNv
dXBfMy4wLjcuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJzb3VwL2xpYnNvdXBfMy4yLjEu
YmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGlic291cC9saWJzb3VwXzMuMC43LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJzb3VwL2xpYnNvdXBfMy4yLjEuYmIKaW5kZXggNTljYzRhMWQwYS4uNDc1OTA4ZmU0NCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlic291cC9saWJzb3VwXzMuMC43LmJiCisr
KyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnNvdXAvbGlic291cF8zLjIuMS5iYgpAQCAtMTIs
NyArMTIsNyBAQCBERVBFTkRTID0gImdsaWItMi4wIGdsaWItMi4wLW5hdGl2ZSBsaWJ4bWwyIHNx
bGl0ZTMgbGlicHNsIG5naHR0cDIiCiBTSFJUX1ZFUiA9ICIke0BkLmdldFZhcignUFYnKS5zcGxp
dCgnLicpWzBdfS4ke0BkLmdldFZhcignUFYnKS5zcGxpdCgnLicpWzFdfSIKIAogU1JDX1VSSSA9
ICIke0dOT01FX01JUlJPUn0vbGlic291cC8ke1NIUlRfVkVSfS9saWJzb3VwLSR7UFZ9LnRhci54
eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJlYmRmOTBjZjM1OTljMTFhY2JiNjgxOGE5ZDllM2Zj
OWQyYzY4ZTU2ZWI4MjliOTM5NjI5NzI2ODNlMWJmN2M4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImIxZWIzZDJjM2JlNDlmYmJkMDUxYTcxZjY1MzJjOTYyNmJjZWNlYTY5NzgzMTkwNjkwY2Q3ZTRk
ZmRmMjhmMjkiCiAKIFBST1ZJREVTID0gImxpYnNvdXAtMy4wIgogQ1ZFX1BST0RVQ1QgPSAibGli
c291cCIKLS0gCjIuMzEuMQoK

--===============7706614646569491420==--

