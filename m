Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5062BCD8CAB
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:49 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1580.1780328146928067376
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=J+i0Kzpj;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=MJ2hHSzt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019e83d3a446-4dd8b938-682b-4c3b-b1e6-c1d171be3fa0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=apuOLvvQ6z9q94YR0zgspaFk3dZ1ywU71zoG0FSK06g=;
	b=J+i0Kzpjdh7gRXYW9DMkLYnH62ORb/ECONr9qVaZaRRS6weSQFRNHFOi7Lz7Fygt
	G24bTuU+4BEHTuI+rb+maAjsQ+jFJXypcLD8NYwGf8DXq7i6daSFZpc1r36PmwFAboQ
	iUi/jSmg/7UvDEHhD8a/yBdCjXn1XdhXeUljo52M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=apuOLvvQ6z9q94YR0zgspaFk3dZ1ywU71zoG0FSK06g=;
	b=MJ2hHSztsjkO6VrvjZXKuH+d7MBAyz3zfF7vRlmFi9ERq1k4SauPZYN09GQDhlJO
	vNF2OWAxt9jDJyRKOl/A6QUTGY1977kgFAMuj4aHAg46NV0WZEyU++NVHXvrhhTSI11
	6LSJeCrQP4X1VHQEOCskNQhGPqjm9pWi6H9JkSoI=
Content-Type: multipart/mixed; boundary="===============4438892771892202475=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] less: upgrading to 702 FAILED
Message-ID: <0101019e83d3a446-4dd8b938-682b-4c3b-b1e6-c1d171be3fa0-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237911

--===============4438892771892202475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *less* to *702* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-less-upgrade-692-702.patch
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
From 0af48d143fddab0d8da2aac814b970e5cad8e7bc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 10:39:18 +0000
Subject: [PATCH] less: upgrade 692 -> 702

---
 meta/recipes-extended/less/{less_692.bb => less_702.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/less/{less_692.bb => less_702.bb} (95%)

diff --git a/meta/recipes-extended/less/less_692.bb b/meta/recipes-extended/less/less_702.bb
similarity index 95%
rename from meta/recipes-extended/less/less_692.bb
rename to meta/recipes-extended/less/less_702.bb
index 6f621905a0..0f637201c2 100644
--- a/meta/recipes-extended/less/less_692.bb
+++ b/meta/recipes-extended/less/less_702.bb
@@ -29,7 +29,7 @@ SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "61300f603798ecf1d7786570789f0ff3f5a1acf075a6fb9f756837d166e37d14"
+SRC_URI[sha256sum] = "242a64c00f02d96f8ee208cf638ae1728b727c7f5fdf82a7d4f4cae32fb084e2"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.47.1


--===============4438892771892202475==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-less-upgrade-692-702.patch"

RnJvbSAwYWY0OGQxNDNmZGRhYjBkOGRhMmFhYzgxNGI5NzBlNWNhZDhlN2JjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxMDozOToxOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxl
c3M6IHVwZ3JhZGUgNjkyIC0+IDcwMgoKLS0tCiBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGVzcy97
bGVzc182OTIuYmIgPT4gbGVzc183MDIuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xl
c3Mve2xlc3NfNjkyLmJiID0+IGxlc3NfNzAyLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9sZXNzL2xlc3NfNjkyLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2xlc3MvbGVzc183MDIuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2xlc3MvbGVzc182OTIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1l
eHRlbmRlZC9sZXNzL2xlc3NfNzAyLmJiCmluZGV4IDZmNjIxOTA1YTAuLjBmNjM3MjAxYzIgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sZXNzL2xlc3NfNjkyLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9sZXNzL2xlc3NfNzAyLmJiCkBAIC0yOSw3ICsyOSw3IEBAIFNS
Q19VUkkgPSAiaHR0cDovL3d3dy5ncmVlbndvb2Rzb2Z0d2FyZS5jb20vJHtCUE59LyR7QlBOfS0k
e1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKICAgICAgICAgICAg
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjEzMDBmNjAzNzk4ZWNmMWQ3Nzg2NTcwNzg5ZjBm
ZjNmNWExYWNmMDc1YTZmYjlmNzU2ODM3ZDE2NmUzN2QxNCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICIyNDJhNjRjMDBmMDJkOTZmOGVlMjA4Y2Y2MzhhZTE3MjhiNzI3YzdmNWZkZjgyYTdkNGY0Y2Fl
MzJmYjA4NGUyIgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cDovL3d3dy5ncmVlbndvb2Rz
b2Z0d2FyZS5jb20vbGVzcy9kb3dubG9hZC5odG1sIgogCi0tIAoyLjQ3LjEKCg==

--===============4438892771892202475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1975 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.0.99+snapshot-cbf48d2b989f534f52b53fe02fc6f22205c54504"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:cbf48d2b989f534f52b53fe02fc6f22205c54504"
meta-yocto-bsp       
meta-poky            = "master:d13ca2a2e0f478046d920b8fc7dd3098952b5ad8"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 144 Local 130 Mirrors 0 Missed 14 Current 633 (90% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 690 of 777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_spdx_setscene)
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1344 of 1967 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_702.bb:do_recipe_qa)
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe less-702-r0: task do_recipe_qa: Started
NOTE: Setscene tasks completed
NOTE: Running task 1908 of 1967 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_702.bb:do_create_recipe_spdx)
NOTE: recipe less-702-r0: task do_create_recipe_spdx: Started
NOTE: recipe less-702-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1946 of 1967 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_702.bb:do_fetch)
NOTE: recipe less-702-r0: task do_fetch: Started
NOTE: recipe less-702-r0: task do_fetch: Succeeded
NOTE: Running task 1947 of 1967 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_702.bb:do_unpack)
NOTE: Running task 1948 of 1967 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_702.bb:do_prepare_recipe_sysroot)
NOTE: recipe less-702-r0: task do_unpack: Started
NOTE: recipe less-702-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe less-702-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe less-702-r0: task do_unpack: Succeeded
NOTE: Running task 1949 of 1967 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_702.bb:do_patch)
NOTE: recipe less-702-r0: task do_patch: Started
NOTE: recipe less-702-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe less-702-r0: task do_patch: Succeeded
NOTE: Running task 1950 of 1967 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_702.bb:do_deploy_source_date_epoch)
NOTE: Running task 1951 of 1967 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_702.bb:do_populate_lic)
NOTE: recipe less-702-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe less-702-r0: task do_populate_lic: Started
NOTE: recipe less-702-r0: task do_populate_lic: Succeeded
NOTE: recipe less-702-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1952 of 1967 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_702.bb:do_configure)
NOTE: recipe less-702-r0: task do_configure: Started
NOTE: recipe less-702-r0: task do_configure: Succeeded
NOTE: Running task 1953 of 1967 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_702.bb:do_configure_ptest_base)
NOTE: recipe less-702-r0: task do_configure_ptest_base: Started
NOTE: recipe less-702-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1954 of 1967 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_702.bb:do_compile)
NOTE: recipe less-702-r0: task do_compile: Started
NOTE: recipe less-702-r0: task do_compile: Succeeded
NOTE: Running task 1955 of 1967 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_702.bb:do_compile_ptest_base)
NOTE: recipe less-702-r0: task do_compile_ptest_base: Started
NOTE: recipe less-702-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1956 of 1967 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_702.bb:do_install)
NOTE: recipe less-702-r0: task do_install: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-native_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/b
 uild/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf/autoconf_2.73.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/automake/automake_1.18.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'glibc', 'ncurses', 'binutils-cross-x86_64', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-cross', 'libtool-native', 'm4-native', 'opkg-utils', 'quilt-native', 'texinfo-dummy-native', 'linux-libc-headers', 'zlib-native', 'autoconf-native', 'automake-native', 'flex-native', 'gnu-config-native', 'patch-native', 'pseudo-native', 'xz-native', 'zstd-native', 'attr-native', 'gmp-native', 'libmpc-native', 'mpfr-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| NOTE: make -j 16 -l 75 LESSTEST=1 bindir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/702/image/usr/bin mandir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/702/image/usr/share/man install
| ../sources/less-702/mkinstalldirs /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/702/image/usr/bin /usr/libexec /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/702/image/usr/share/man/man1
| mkdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/702/image/usr
| mkdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/702/image/usr/bin
| mkdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/702/image/usr/share
| mkdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/702/image/usr/share/man
| mkdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/702/image/usr/share/man/man1
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c less /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/702/image/usr/bin/less
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c lesskey /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/702/image/usr/bin/lesskey
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c lessecho /usr/libexec/lessecho
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install: cannot create regular file '/usr/libexec/lessecho': Permission denied
| make: *** [Makefile:87: install] Error 1
| ERROR: oe_runmake failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/702/temp/run.do_install.2991130:172 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/702/temp/run.do_install.2991130, line 172
| 	#2: die, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/702/temp/run.do_install.2991130, line 156
| 	#3: oe_runmake, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/702/temp/run.do_install.2991130, line 151
| 	#4: do_install, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/702/temp/run.do_install.2991130, line 146
| 	#5: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/702/temp/run.do_install.2991130, line 185
NOTE: recipe less-702-r0: task do_install: Failed
NOTE: Tasks Summary: Attempted 1956 tasks of which 1943 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601103855.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601103855.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_702.bb:do_install
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/702/temp/log.do_install.2991130
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: less-702-r0 do_install: oe_runmake failed
ERROR: less-702-r0 do_install: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/702/temp/run.do_install.2991130' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/less/702/temp/log.do_install.2991130
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/less/less_702.bb:do_install) failed with exit code '1'

--===============4438892771892202475==--

