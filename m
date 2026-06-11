Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9393CDB461
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:53 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50410.1781195498830752471
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=e21s6wqw;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gIIlzuKi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019eb7869730-3324d5dd-447c-4a49-91f4-3094df58337c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195511;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sGk4GyS6hC8lAt0VFqkCNm7nEzpKoBJYLxflOcTMd+k=;
	b=e21s6wqwndyv7RZj/jwH1el/n/YCYJZKBZGqzZ3PUnwK9uR099Hlnkkq8iSpkl/k
	4MpRk89zkiOpjeCxtafatFg1hV/RZJs+f1GLaYVnbx3kQMzXnUj5FPN6oyfMFof4zDN
	/RzSncBn7CzJVhg4P2/Y2ipgIGlX82WJ6n+Cg8QQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195511;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sGk4GyS6hC8lAt0VFqkCNm7nEzpKoBJYLxflOcTMd+k=;
	b=gIIlzuKiFhpkXxOAlI/sdK0a+q/BqV6nAIhUA0h4gsXVk6yNu2gTUNQoT+jlxOK7
	dNiyeqpUkT3Eb1U32FXDdEaz/A8QUdK72eRtxpF4YRSkMtVUK3RrfHfwVkStCJ61vNR
	k0+LtZJ44Tx2TkVKItyEX3lNrP1dIqhf2RNfETWg=
Content-Type: multipart/mixed; boundary="===============8308552227703202941=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] less: upgrading to 704 FAILED
Message-ID: <0101019eb7869730-3324d5dd-447c-4a49-91f4-3094df58337c-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238516

--===============8308552227703202941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *less* to *704* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-less-upgrade-692-704.patch
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
From bfd730ddc7e3ea6c1e99c690e1da46616d00a27e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 11:16:53 +0000
Subject: [PATCH] less: upgrade 692 -> 704

---
 meta/recipes-extended/less/{less_692.bb => less_704.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/less/{less_692.bb => less_704.bb} (95%)

diff --git a/meta/recipes-extended/less/less_692.bb b/meta/recipes-extended/less/less_704.bb
similarity index 95%
rename from meta/recipes-extended/less/less_692.bb
rename to meta/recipes-extended/less/less_704.bb
index 6f621905a0..c6dad7eb06 100644
--- a/meta/recipes-extended/less/less_692.bb
+++ b/meta/recipes-extended/less/less_704.bb
@@ -29,7 +29,7 @@ SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "61300f603798ecf1d7786570789f0ff3f5a1acf075a6fb9f756837d166e37d14"
+SRC_URI[sha256sum] = "20a0b0a2bb2525fa53c7eee9beb854b4c9cf172eabb209af7020743547bfe9fb"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.47.1


--===============8308552227703202941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1980 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-e11c9783300622b8a90389ddfa0afd7b0aad1a88"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:e11c9783300622b8a90389ddfa0afd7b0aad1a88"
meta-yocto-bsp       
meta-poky            = "master:59c41245ad231f5320defcb275477e3d25a2203e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 179 Local 165 Mirrors 0 Missed 14 Current 598 (92% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 681 of 777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.42.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 712 of 777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_spdx_setscene)
NOTE: Running task 1287 of 1967 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_704.bb:do_recipe_qa)
NOTE: recipe perl-5.42.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe less-704-r0: task do_recipe_qa: Started
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 765 of 777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe perl-5.42.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1945 of 1967 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_704.bb:do_create_recipe_spdx)
NOTE: recipe less-704-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1946 of 1967 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_704.bb:do_fetch)
NOTE: recipe less-704-r0: task do_create_recipe_spdx: Started
NOTE: recipe less-704-r0: task do_fetch: Started
NOTE: recipe less-704-r0: task do_fetch: Succeeded
NOTE: Running task 1947 of 1967 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_704.bb:do_unpack)
NOTE: Running task 1948 of 1967 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_704.bb:do_prepare_recipe_sysroot)
NOTE: recipe less-704-r0: task do_unpack: Started
NOTE: recipe less-704-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe less-704-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe less-704-r0: task do_unpack: Succeeded
NOTE: Running task 1949 of 1967 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_704.bb:do_patch)
NOTE: recipe less-704-r0: task do_patch: Started
NOTE: recipe less-704-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe less-704-r0: task do_patch: Succeeded
NOTE: Running task 1950 of 1967 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_704.bb:do_deploy_source_date_epoch)
NOTE: Running task 1951 of 1967 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_704.bb:do_populate_lic)
NOTE: recipe less-704-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe less-704-r0: task do_populate_lic: Started
NOTE: recipe less-704-r0: task do_populate_lic: Succeeded
NOTE: recipe less-704-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1952 of 1967 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_704.bb:do_configure)
NOTE: recipe less-704-r0: task do_configure: Started
NOTE: recipe less-704-r0: task do_configure: Succeeded
NOTE: Running task 1953 of 1967 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_704.bb:do_configure_ptest_base)
NOTE: recipe less-704-r0: task do_configure_ptest_base: Started
NOTE: recipe less-704-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1954 of 1967 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_704.bb:do_compile)
NOTE: recipe less-704-r0: task do_compile: Started
NOTE: recipe less-704-r0: task do_compile: Succeeded
NOTE: Running task 1955 of 1967 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_704.bb:do_compile_ptest_base)
NOTE: recipe less-704-r0: task do_compile_ptest_base: Started
NOTE: recipe less-704-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1956 of 1967 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_704.bb:do_install)
NOTE: recipe less-704-r0: task do_install: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-native_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/b
 uild/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf/autoconf_2.73.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/automake/automake_1.18.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'glibc', 'ncurses', 'binutils-cross-x86_64', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-cross', 'libtool-native', 'm4-native', 'opkg-utils', 'quilt-native', 'texinfo-dummy-native', 'linux-libc-headers', 'zlib-native', 'autoconf-native', 'automake-native', 'flex-native', 'gnu-config-native', 'patch-native', 'pseudo-native', 'zstd-native', 'attr-native', 'gmp-native', 'libmpc-native', 'mpfr-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| NOTE: make -j 16 -l 75 LESSTEST=1 bindir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/704/image/usr/bin mandir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/704/image/usr/share/man install
| ../sources/less-704/mkinstalldirs /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/704/image/usr/bin /usr/libexec /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/704/image/usr/share/man/man1
| mkdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/704/image/usr
| mkdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/704/image/usr/bin
| mkdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/704/image/usr/share
| mkdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/704/image/usr/share/man
| mkdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/704/image/usr/share/man/man1
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c less /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/704/image/usr/bin/less
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c lesskey /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/704/image/usr/bin/lesskey
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c lessecho /usr/libexec/lessecho
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install: cannot create regular file '/usr/libexec/lessecho': Permission denied
| make: *** [Makefile:87: install] Error 1
| ERROR: oe_runmake failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/704/temp/run.do_install.1525983:172 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/704/temp/run.do_install.1525983, line 172
| 	#2: die, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/704/temp/run.do_install.1525983, line 156
| 	#3: oe_runmake, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/704/temp/run.do_install.1525983, line 151
| 	#4: do_install, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/704/temp/run.do_install.1525983, line 146
| 	#5: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/704/temp/run.do_install.1525983, line 185
NOTE: recipe less-704-r0: task do_install: Failed
NOTE: Tasks Summary: Attempted 1956 tasks of which 1943 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260611111629.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260611111629.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_704.bb:do_install
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/704/temp/log.do_install.1525983
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: less-704-r0 do_install: oe_runmake failed
ERROR: less-704-r0 do_install: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/704/temp/run.do_install.1525983' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/704/temp/log.do_install.1525983
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_704.bb:do_install) failed with exit code '1'

--===============8308552227703202941==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-less-upgrade-692-704.patch"

RnJvbSBiZmQ3MzBkZGM3ZTNlYTZjMWU5OWM2OTBlMWRhNDY2MTZkMDBhMjdlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTE6MTY6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
ZXNzOiB1cGdyYWRlIDY5MiAtPiA3MDQKCi0tLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xlc3Mv
e2xlc3NfNjkyLmJiID0+IGxlc3NfNzA0LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9s
ZXNzL3tsZXNzXzY5Mi5iYiA9PiBsZXNzXzcwNC5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbGVzcy9sZXNzXzY5Mi5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9sZXNzL2xlc3NfNzA0LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9sZXNzL2xlc3NfNjkyLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvbGVzcy9sZXNzXzcwNC5iYgppbmRleCA2ZjYyMTkwNWEwLi5jNmRhZDdlYjA2IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGVzcy9sZXNzXzY5Mi5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGVzcy9sZXNzXzcwNC5iYgpAQCAtMjksNyArMjksNyBAQCBT
UkNfVVJJID0gImh0dHA6Ly93d3cuZ3JlZW53b29kc29mdHdhcmUuY29tLyR7QlBOfS8ke0JQTn0t
JHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCiAgICAgICAgICAg
ICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjYxMzAwZjYwMzc5OGVjZjFkNzc4NjU3MDc4OWYw
ZmYzZjVhMWFjZjA3NWE2ZmI5Zjc1NjgzN2QxNjZlMzdkMTQiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiMjBhMGIwYTJiYjI1MjVmYTUzYzdlZWU5YmViODU0YjRjOWNmMTcyZWFiYjIwOWFmNzAyMDc0
MzU0N2JmZTlmYiIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHA6Ly93d3cuZ3JlZW53b29k
c29mdHdhcmUuY29tL2xlc3MvZG93bmxvYWQuaHRtbCIKIAotLSAKMi40Ny4xCgo=

--===============8308552227703202941==--

