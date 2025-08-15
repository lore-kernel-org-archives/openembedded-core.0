Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D134CA0FF0
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:12 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.11406.1755263217886317834
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=kltDw19b;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=eXbEJyF+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010198add7643d-0124f350-5879-4bd2-a07f-8e243ff7c763-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263231;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cO+klD+DeN7SxOq0e60JAbCd0513+pl/6qEmMZR30l0=;
	b=kltDw19bdjPEQieiEQ4KXDecMkGBzWWGNOgHN2aaX5Vy01cZ/lGLZszg54EAkmlY
	quPR93AXjvwo1nNJ9Fudqjde+NUzQDb3ZnRIatQwjqNw5ynG4wkRokARxENF8OwcvfA
	60besSQKyONgDsXi1krpTu0PbQ9DayjKm+Pxvg/Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263231;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cO+klD+DeN7SxOq0e60JAbCd0513+pl/6qEmMZR30l0=;
	b=eXbEJyF+tuGmbYP1Pv6kQ3A+4hI2Ng94ttu6Z4Qi7pLUdEwIlVAS8diEUs4J4Evd
	lSwq5aW2p80kITc+KyvH7IWktDlnMI7HUIeMWgfj66L9lQ4Es9e+/aPwGaG6oTgNn0+
	hVIqyEEMytVI5vrqs6iMRh7imFiOaHAo+h2rs22c=
Content-Type: multipart/mixed; boundary="===============3670503502937179106=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] lighttpd: upgrading to 1.4.80 FAILED
Message-ID: <01010198add7643d-0124f350-5879-4bd2-a07f-8e243ff7c763-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221930

--===============3670503502937179106==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lighttpd* to *1.4.80* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-lighttpd-upgrade-1.4.79-1.4.80.patch
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
From fb72e8904c5f5d4aa7b72344f67aa49b94c71717 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 10:23:48 +0000
Subject: [PATCH] lighttpd: upgrade 1.4.79 -> 1.4.80

---
 .../lighttpd/{lighttpd_1.4.79.bb => lighttpd_1.4.80.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.79.bb => lighttpd_1.4.80.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.79.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.80.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.79.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.80.bb
index cd6790dff9..163db443d0 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.79.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.80.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "3b29a625b3ad88702d1fea4f5f42bb7d87488f2e4efc977d7f185329ca6084bd"
+SRC_URI[sha256sum] = "cc5f0f71e8b2ee6bad545d1e91dfc3f954716c9174e7b352c2147add44f25bf3"
 
 DEPENDS = "virtual/crypt"
 
-- 
2.47.1


--===============3670503502937179106==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1941 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (943 cached, 1 parsed). 1941 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-276ad1fff12f60835b84cc339e851e241221ca0f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:276ad1fff12f60835b84cc339e851e241221ca0f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 122 Local 110 Mirrors 0 Missed 12 Current 301 (90% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1088 of 1239 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lighttpd/lighttpd_1.4.80.bb:do_recipe_qa)
NOTE: Running task 1161 of 1239 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lighttpd/lighttpd_1.4.80.bb:do_write_config)
NOTE: recipe lighttpd-1.4.80-r0: task do_recipe_qa: Started
NOTE: recipe lighttpd-1.4.80-r0: task do_write_config: Started
NOTE: recipe lighttpd-1.4.80-r0: task do_write_config: Succeeded
NOTE: recipe lighttpd-1.4.80-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1220 of 1239 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lighttpd/lighttpd_1.4.80.bb:do_fetch)
NOTE: recipe lighttpd-1.4.80-r0: task do_fetch: Started
NOTE: recipe lighttpd-1.4.80-r0: task do_fetch: Succeeded
NOTE: Running task 1221 of 1239 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lighttpd/lighttpd_1.4.80.bb:do_unpack)
NOTE: Running task 1222 of 1239 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lighttpd/lighttpd_1.4.80.bb:do_prepare_recipe_sysroot)
NOTE: recipe lighttpd-1.4.80-r0: task do_unpack: Started
NOTE: recipe lighttpd-1.4.80-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lighttpd-1.4.80-r0: task do_unpack: Succeeded
NOTE: Running task 1223 of 1239 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lighttpd/lighttpd_1.4.80.bb:do_patch)
NOTE: Running task 1224 of 1239 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lighttpd/lighttpd_1.4.80.bb:do_collect_spdx_deps)
NOTE: recipe lighttpd-1.4.80-r0: task do_patch: Started
NOTE: recipe lighttpd-1.4.80-r0: task do_collect_spdx_deps: Started
NOTE: recipe lighttpd-1.4.80-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lighttpd-1.4.80-r0: task do_patch: Succeeded
NOTE: recipe lighttpd-1.4.80-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1225 of 1239 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lighttpd/lighttpd_1.4.80.bb:do_deploy_source_date_epoch)
NOTE: Running task 1226 of 1239 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lighttpd/lighttpd_1.4.80.bb:do_populate_lic)
NOTE: recipe lighttpd-1.4.80-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lighttpd-1.4.80-r0: task do_populate_lic: Started
NOTE: recipe lighttpd-1.4.80-r0: task do_populate_lic: Succeeded
NOTE: recipe lighttpd-1.4.80-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1227 of 1239 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lighttpd/lighttpd_1.4.80.bb:do_configure)
NOTE: recipe lighttpd-1.4.80-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.42.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd-systemctl-native_257.8.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysr
 oot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_10.0.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.23.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.8.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.13.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/
 pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'gettext-minimal-native', 'glibc', 'initscripts', 'libxcrypt', 'systemd-systemctl-native', 'update-rc.d', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-native', 'm4-native', 'opkg-utils', 'qemu-native', 'quilt-native', 'bzip2', 'texinfo-dummy-native', 'linux-libc-headers', 'attr', 'libpcre2', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'util-linux-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-jinja2-native', 'python3-markupsafe-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native'
 , 'bzip2-native', 'unzip-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libcap-ng-native', 'libcap-native', 'libffi-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dwith_xattr=true -Dwith_bzip=disabled -Dwith_krb5=disabled -Dwith_ldap=disabled -Dwith_libev=disabled -Dwith_lua=false -Dwith_mysql=disabled -Dwith_openssl=true -Dwith_pcre=pcre2 -Dwith_webdav_locks=disabled -Dwith_webdav_props=disabled -Dwith_zlib=enabled -Dwith_zstd=disabled...
| The Meson build system
| Version: 1.8.2
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lighttpd/1.4.80/sources/lighttpd-1.4.80
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lighttpd/1.4.80/build
| Build type: cross build
| 
| ../sources/lighttpd-1.4.80/meson.build:1:0: ERROR: Unknown options: "with_libev"
| 
| A full log can be found at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lighttpd/1.4.80/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lighttpd/1.4.80/temp/run.do_configure.270874:171 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lighttpd/1.4.80/temp/run.do_configure.270874, line 171
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lighttpd/1.4.80/temp/run.do_configure.270874, line 160
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lighttpd/1.4.80/temp/run.do_configure.270874, line 149
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lighttpd/1.4.80/temp/run.do_configure.270874, line 184
NOTE: recipe lighttpd-1.4.80-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1227 tasks of which 1217 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250815102335.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250815102335.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lighttpd/lighttpd_1.4.80.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lighttpd/1.4.80/temp/log.do_configure.270874
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: lighttpd-1.4.80-r0 do_configure: meson failed
ERROR: lighttpd-1.4.80-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lighttpd/1.4.80/temp/run.do_configure.270874' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/lighttpd/1.4.80/temp/log.do_configure.270874
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lighttpd/lighttpd_1.4.80.bb:do_configure) failed with exit code '1'

--===============3670503502937179106==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lighttpd-upgrade-1.4.79-1.4.80.patch"

RnJvbSBmYjcyZTg5MDRjNWY1ZDRhYTdiNzIzNDRmNjdhYTQ5Yjk0YzcxNzE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMTA6MjM6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWdodHRwZDogdXBncmFkZSAxLjQuNzkgLT4gMS40LjgwCgotLS0KIC4uLi9saWdodHRwZC97bGln
aHR0cGRfMS40Ljc5LmJiID0+IGxpZ2h0dHBkXzEuNC44MC5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWdodHRwZC97bGlnaHR0cGRfMS40Ljc5LmJiID0+IGxpZ2h0dHBk
XzEuNC44MC5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGln
aHR0cGQvbGlnaHR0cGRfMS40Ljc5LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpZ2h0dHBk
L2xpZ2h0dHBkXzEuNC44MC5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQvbGlnaHR0cGRfMS40Ljc5LmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQvbGlnaHR0cGRfMS40LjgwLmJiCmluZGV4IGNk
Njc5MGRmZjkuLjE2M2RiNDQzZDAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9s
aWdodHRwZC9saWdodHRwZF8xLjQuNzkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xp
Z2h0dHBkL2xpZ2h0dHBkXzEuNC44MC5iYgpAQCAtMTYsNyArMTYsNyBAQCBTUkNfVVJJID0gImh0
dHA6Ly9kb3dubG9hZC5saWdodHRwZC5uZXQvbGlnaHR0cGQvcmVsZWFzZXMtMS40LngvbGlnaHR0
cGQtJHtQVn0udAogICAgICAgICAgICBmaWxlOi8vbGlnaHR0cGQgXAogICAgICAgICAgICAiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzYjI5YTYyNWIzYWQ4ODcwMmQxZmVhNGY1ZjQyYmI3ZDg3
NDg4ZjJlNGVmYzk3N2Q3ZjE4NTMyOWNhNjA4NGJkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImNj
NWYwZjcxZThiMmVlNmJhZDU0NWQxZTkxZGZjM2Y5NTQ3MTZjOTE3NGU3YjM1MmMyMTQ3YWRkNDRm
MjViZjMiCiAKIERFUEVORFMgPSAidmlydHVhbC9jcnlwdCIKIAotLSAKMi40Ny4xCgo=

--===============3670503502937179106==--

