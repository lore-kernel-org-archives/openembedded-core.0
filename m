Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 325F6C2FC1F
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:30 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.834.1686887483995938221
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZH2RtL73;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010188c2545026-bc649a98-6e16-4b29-850f-c0a51fec1ad2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887485;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xNyiHxaIRaxlAIJwJtcWBpCkQF/DMCp68ccIgVkgKP8=;
	b=ZH2RtL73I9iJA0T0+SL60rU8LHS5XwN+kG055wyHEqVaAHTaVtxP7fFmYBo/jWtP
	nRF3lsqeSG01eqZCqyzE3QeqPFJrcGLiXChFdMllU61n4sNSVJfSPvs58vRhLh7wV6p
	s3ewsY6ucjKHtgo5U44ghdYs8gC0vV6HvGWEwWyo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887485;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xNyiHxaIRaxlAIJwJtcWBpCkQF/DMCp68ccIgVkgKP8=;
	b=TGagGeNfUJ5viRbP+qnPY4LhITRSZ1zJYtJjO3J1zKBRMBGnMG4ytHQIk6Nrs3Fj
	b9NcH0LJ7vn49a7b26x3wvTYR8CcwjJk5fqJXtety4a/M8NrF8GLk7jJmkUzL8lVVLT
	RvIBapLgD4t688RB3bfBAUR/zrlqVBS+/s5//yBs=
Content-Type: multipart/mixed; boundary="===============5093402242176926844=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] serf: upgrading to 1.3.10 SUCCEEDED
Message-ID: <01010188c2545026-bc649a98-6e16-4b29-850f-c0a51fec1ad2-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182990

--===============5093402242176926844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *serf* to *1.3.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-serf-upgrade-1.3.9-1.3.10.patch
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
From 33624b895f7df7185763fb5248af92c94a68f586 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 16 Jun 2023 01:40:51 +0000
Subject: [PATCH] serf: upgrade 1.3.9 -> 1.3.10

---
 ...print-in-the-scons-file-to-unbreak-b.patch | 29 -------------------
 ...sl_buckets.c-do-not-use-ERR_GET_FUNC.patch | 28 ------------------
 ...11083-fix-building-with-scons-3.0.0-.patch | 29 -------------------
 .../serf/{serf_1.3.9.bb => serf_1.3.10.bb}    |  6 +---
 4 files changed, 1 insertion(+), 91 deletions(-)
 delete mode 100644 meta/recipes-support/serf/serf/0001-Fix-syntax-of-a-print-in-the-scons-file-to-unbreak-b.patch
 delete mode 100644 meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
 delete mode 100644 meta/recipes-support/serf/serf/0004-Follow-up-to-r1811083-fix-building-with-scons-3.0.0-.patch
 rename meta/recipes-support/serf/{serf_1.3.9.bb => serf_1.3.10.bb} (78%)

diff --git a/meta/recipes-support/serf/serf/0001-Fix-syntax-of-a-print-in-the-scons-file-to-unbreak-b.patch b/meta/recipes-support/serf/serf/0001-Fix-syntax-of-a-print-in-the-scons-file-to-unbreak-b.patch
deleted file mode 100644
index 4a5832ac1a..0000000000
--- a/meta/recipes-support/serf/serf/0001-Fix-syntax-of-a-print-in-the-scons-file-to-unbreak-b.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 99f6e1b0d68281b63218d6adfe68cd9e331ac5be Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 3 Sep 2018 10:50:08 -0700
-Subject: [PATCH] Fix syntax of a print() in the scons file to unbreak building
- with most recent scons version.
-
-* SConstruct Use Python 3.0 valid syntax to make Scons 3.0.0 happy on both python
-  3.0 and 2.7.
-
-Upstream-Status: Backport
-[https://svn.apache.org/viewvc/serf/trunk/SConstruct?r1=1809132&r2=1811083&diff_format=h]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- SConstruct | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/SConstruct b/SConstruct
-index 1670459..18a45fa 100644
---- a/SConstruct
-+++ b/SConstruct
-@@ -184,7 +184,7 @@ CALLOUT_OKAY = not (env.GetOption('clean') or env.GetOption('help'))
- 
- unknown = opts.UnknownVariables()
- if unknown:
--  print 'Warning: Used unknown variables:', ', '.join(unknown.keys())
-+  print('Warning: Used unknown variables:', ', '.join(unknown.keys()))
- 
- apr = str(env['APR'])
- apu = str(env['APU'])
diff --git a/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch b/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
deleted file mode 100644
index 91ccc8a474..0000000000
--- a/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 2f45711a66ff99886b6e4a5708e2db01a63e5af4 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 10 Sep 2021 11:05:10 +0200
-Subject: [PATCH] buckets/ssl_buckets.c: do not use ERR_GET_FUNC
-
-Upstream removed it in
-https://github.com/openssl/openssl/pull/16004
-
-Upstream-Status: Inactive-Upstream [lastrelease: 2015, lastcommit: 2019]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- buckets/ssl_buckets.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/buckets/ssl_buckets.c b/buckets/ssl_buckets.c
-index b01e535..9801f87 100644
---- a/buckets/ssl_buckets.c
-+++ b/buckets/ssl_buckets.c
-@@ -1325,8 +1325,7 @@ static int ssl_need_client_cert(SSL *ssl, X509 **cert, EVP_PKEY **pkey)
-                 return 0;
-             }
-             else {
--                printf("OpenSSL cert error: %d %d %d\n", ERR_GET_LIB(err),
--                       ERR_GET_FUNC(err),
-+                printf("OpenSSL cert error: %d %d\n", ERR_GET_LIB(err),
-                        ERR_GET_REASON(err));
-                 PKCS12_free(p12);
-                 bio_meth_free(biom);
diff --git a/meta/recipes-support/serf/serf/0004-Follow-up-to-r1811083-fix-building-with-scons-3.0.0-.patch b/meta/recipes-support/serf/serf/0004-Follow-up-to-r1811083-fix-building-with-scons-3.0.0-.patch
deleted file mode 100644
index 02fa9e3a06..0000000000
--- a/meta/recipes-support/serf/serf/0004-Follow-up-to-r1811083-fix-building-with-scons-3.0.0-.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 565211fd082ef653ca9c44a345350fc1451f5a0f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 3 Sep 2018 11:12:38 -0700
-Subject: [PATCH] Follow-up to r1811083 fix building with scons 3.0.0 and
- Python3
-
-* SConstruct: Append decode('utf-8) to FILE.get_contents() to avoid
-  TypeError: cannot use a string pattern on a bytes-like object
-
-Upstream-Status: Backport
-[https://svn.apache.org/viewvc/serf/trunk/SConstruct?r1=1811088&r2=1814604]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- SConstruct | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/SConstruct b/SConstruct
-index 877731e..7678bb1 100644
---- a/SConstruct
-+++ b/SConstruct
-@@ -169,7 +169,7 @@ env.Append(BUILDERS = {
- match = re.search('SERF_MAJOR_VERSION ([0-9]+).*'
-                   'SERF_MINOR_VERSION ([0-9]+).*'
-                   'SERF_PATCH_VERSION ([0-9]+)',
--                  env.File('serf.h').get_contents(),
-+                  env.File('serf.h').get_contents().decode('utf-8'),
-                   re.DOTALL)
- MAJOR, MINOR, PATCH = [int(x) for x in match.groups()]
- env.Append(MAJOR=str(MAJOR))
diff --git a/meta/recipes-support/serf/serf_1.3.9.bb b/meta/recipes-support/serf/serf_1.3.10.bb
similarity index 78%
rename from meta/recipes-support/serf/serf_1.3.9.bb
rename to meta/recipes-support/serf/serf_1.3.10.bb
index 669f42b8e7..c6b51452aa 100644
--- a/meta/recipes-support/serf/serf_1.3.9.bb
+++ b/meta/recipes-support/serf/serf_1.3.10.bb
@@ -7,16 +7,12 @@ HOMEPAGE = "http://serf.apache.org/"
 SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://norpath.patch \
            file://env.patch \
-           file://0001-Fix-syntax-of-a-print-in-the-scons-file-to-unbreak-b.patch \
            file://0002-SConstruct-Fix-path-quoting-for-.def-generator.patch \
            file://0003-gen_def.patch \
-           file://0004-Follow-up-to-r1811083-fix-building-with-scons-3.0.0-.patch \
            file://SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch \
-           file://0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch \
            "
 
-SRC_URI[md5sum] = "370a6340ff20366ab088012cd13f2b57"
-SRC_URI[sha256sum] = "549c2d21c577a8a9c0450facb5cca809f26591f048e466552240947bdf7a87cc"
+SRC_URI[sha256sum] = "be81ef08baa2516ecda76a77adf7def7bc3227eeb578b9a33b45f7b41dc064e6"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
-- 
2.39.2


--===============5093402242176926844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1804 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1802 targets, 36 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a5a95bdf9dd0ca45f389c6132d676f800f8fe207"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 30 Local 11 Mirrors 0 Missed 19 Current 300 (36% match, 94% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 826 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_fetch)
NOTE: Running task 895 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_fetch)
NOTE: Running task 1035 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_fetch)
NOTE: recipe apr-util-1.6.3-r0: task do_fetch: Started
NOTE: recipe serf-1.3.10-r0: task do_fetch: Started
NOTE: recipe apr-1.7.3-r0: task do_fetch: Started
NOTE: recipe apr-util-1.6.3-r0: task do_fetch: Succeeded
NOTE: Running task 1109 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_unpack)
NOTE: recipe serf-1.3.10-r0: task do_fetch: Succeeded
NOTE: recipe apr-1.7.3-r0: task do_fetch: Succeeded
NOTE: Running task 1110 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_unpack)
NOTE: Running task 1111 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_unpack)
NOTE: Running task 1112 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe serf-1.3.10-r0: task do_unpack: Started
NOTE: recipe apr-util-1.6.3-r0: task do_unpack: Started
NOTE: recipe apr-1.7.3-r0: task do_unpack: Started
NOTE: recipe apr-1.7.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe serf-1.3.10-r0: task do_unpack: Succeeded
NOTE: recipe apr-util-1.6.3-r0: task do_unpack: Succeeded
NOTE: Running task 1113 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_patch)
NOTE: Running task 1114 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_patch)
NOTE: recipe serf-1.3.10-r0: task do_patch: Started
NOTE: recipe apr-util-1.6.3-r0: task do_patch: Started
NOTE: recipe apr-1.7.3-r0: task do_unpack: Succeeded
NOTE: recipe apr-1.7.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1115 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_patch)
NOTE: Running task 1116 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_collect_spdx_deps)
NOTE: recipe apr-1.7.3-r0: task do_patch: Started
NOTE: recipe apr-1.7.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe apr-util-1.6.3-r0: task do_patch: Succeeded
NOTE: Running task 1117 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_deploy_source_date_epoch)
NOTE: recipe apr-1.7.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe serf-1.3.10-r0: task do_patch: Succeeded
NOTE: Running task 1118 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 1119 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_populate_lic)
NOTE: recipe apr-util-1.6.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe serf-1.3.10-r0: task do_populate_lic: Started
NOTE: recipe serf-1.3.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe serf-1.3.10-r0: task do_populate_lic: Succeeded
NOTE: recipe apr-util-1.6.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_populate_lic unihash changed to 761254ce560f32f5fbba85247c1fcf35f5ea740f624164a70bf91b6133c5de5f
NOTE: recipe serf-1.3.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe apr-1.7.3-r0: task do_patch: Succeeded
NOTE: Running task 1120 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_deploy_source_date_epoch)
NOTE: recipe apr-1.7.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe apr-1.7.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1121 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_configure)
NOTE: recipe apr-1.7.3-r0: task do_configure: Started
NOTE: recipe apr-1.7.3-r0: task do_configure: Succeeded
NOTE: Running task 1122 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_configure_ptest_base)
NOTE: recipe apr-1.7.3-r0: task do_configure_ptest_base: Started
NOTE: recipe apr-1.7.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1123 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_compile)
NOTE: recipe apr-1.7.3-r0: task do_compile: Started
NOTE: recipe apr-1.7.3-r0: task do_compile: Succeeded
NOTE: Running task 1124 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_compile_ptest_base)
NOTE: recipe apr-1.7.3-r0: task do_compile_ptest_base: Started
NOTE: recipe apr-1.7.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1125 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_install)
NOTE: recipe apr-1.7.3-r0: task do_install: Started
NOTE: recipe apr-1.7.3-r0: task do_install: Succeeded
NOTE: Running task 1126 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_install_ptest_base)
NOTE: recipe apr-1.7.3-r0: task do_install_ptest_base: Started
NOTE: recipe apr-1.7.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1127 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_populate_sysroot)
NOTE: Running task 1128 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_package)
NOTE: recipe apr-1.7.3-r0: task do_populate_sysroot: Started
NOTE: recipe apr-1.7.3-r0: task do_package: Started
NOTE: recipe apr-1.7.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1129 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe apr-util-1.6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe apr-util-1.6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1130 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_configure)
NOTE: recipe apr-util-1.6.3-r0: task do_configure: Started
NOTE: recipe apr-1.7.3-r0: task do_package: Succeeded
NOTE: Running task 1131 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_packagedata)
NOTE: recipe apr-1.7.3-r0: task do_packagedata: Started
NOTE: recipe apr-1.7.3-r0: task do_packagedata: Failed
NOTE: recipe apr-util-1.6.3-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1131 tasks of which 1105 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-src went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-dbg went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-ptest went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-staticdev went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-dev went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-doc went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-locale went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-bin went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/apr/1.7.3-r0/temp/log.do_packagedata.3915371
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_packagedata) failed with exit code '1'

--===============5093402242176926844==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-serf-upgrade-1.3.9-1.3.10.patch"

RnJvbSAzMzYyNGI4OTVmN2RmNzE4NTc2M2ZiNTI0OGFmOTJjOTRhNjhmNTg2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTYgSnVuIDIwMjMgMDE6NDA6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
ZXJmOiB1cGdyYWRlIDEuMy45IC0+IDEuMy4xMAoKLS0tCiAuLi5wcmludC1pbi10aGUtc2NvbnMt
ZmlsZS10by11bmJyZWFrLWIucGF0Y2ggfCAyOSAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi5zbF9i
dWNrZXRzLmMtZG8tbm90LXVzZS1FUlJfR0VUX0ZVTkMucGF0Y2ggfCAyOCAtLS0tLS0tLS0tLS0t
LS0tLS0KIC4uLjExMDgzLWZpeC1idWlsZGluZy13aXRoLXNjb25zLTMuMC4wLS5wYXRjaCB8IDI5
IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi9zZXJmL3tzZXJmXzEuMy45LmJiID0+IHNlcmZfMS4z
LjEwLmJifSAgICB8ICA2ICstLS0KIDQgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDkx
IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L3Nl
cmYvc2VyZi8wMDAxLUZpeC1zeW50YXgtb2YtYS1wcmludC1pbi10aGUtc2NvbnMtZmlsZS10by11
bmJyZWFrLWIucGF0Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtc3VwcG9ydC9z
ZXJmL3NlcmYvMDAwMS1idWNrZXRzLXNzbF9idWNrZXRzLmMtZG8tbm90LXVzZS1FUlJfR0VUX0ZV
TkMucGF0Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtc3VwcG9ydC9zZXJmL3Nl
cmYvMDAwNC1Gb2xsb3ctdXAtdG8tcjE4MTEwODMtZml4LWJ1aWxkaW5nLXdpdGgtc2NvbnMtMy4w
LjAtLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvc2VyZi97c2VyZl8xLjMuOS5i
YiA9PiBzZXJmXzEuMy4xMC5iYn0gKDc4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9zZXJmL3NlcmYvMDAwMS1GaXgtc3ludGF4LW9mLWEtcHJpbnQtaW4tdGhlLXNjb25zLWZp
bGUtdG8tdW5icmVhay1iLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc2VyZi9zZXJmLzAw
MDEtRml4LXN5bnRheC1vZi1hLXByaW50LWluLXRoZS1zY29ucy1maWxlLXRvLXVuYnJlYWstYi5w
YXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggNGE1ODMyYWMxYS4uMDAwMDAwMDAw
MAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zZXJmL3NlcmYvMDAwMS1GaXgtc3ludGF4LW9m
LWEtcHJpbnQtaW4tdGhlLXNjb25zLWZpbGUtdG8tdW5icmVhay1iLnBhdGNoCisrKyAvZGV2L251
bGwKQEAgLTEsMjkgKzAsMCBAQAotRnJvbSA5OWY2ZTFiMGQ2ODI4MWI2MzIxOGQ2YWRmZTY4Y2Q5
ZTMzMWFjNWJlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4KLURhdGU6IE1vbiwgMyBTZXAgMjAxOCAxMDo1MDowOCAtMDcwMAotU3Vi
amVjdDogW1BBVENIXSBGaXggc3ludGF4IG9mIGEgcHJpbnQoKSBpbiB0aGUgc2NvbnMgZmlsZSB0
byB1bmJyZWFrIGJ1aWxkaW5nCi0gd2l0aCBtb3N0IHJlY2VudCBzY29ucyB2ZXJzaW9uLgotCi0q
IFNDb25zdHJ1Y3QgVXNlIFB5dGhvbiAzLjAgdmFsaWQgc3ludGF4IHRvIG1ha2UgU2NvbnMgMy4w
LjAgaGFwcHkgb24gYm90aCBweXRob24KLSAgMy4wIGFuZCAyLjcuCi0KLVVwc3RyZWFtLVN0YXR1
czogQmFja3BvcnQKLVtodHRwczovL3N2bi5hcGFjaGUub3JnL3ZpZXd2Yy9zZXJmL3RydW5rL1ND
b25zdHJ1Y3Q/cjE9MTgwOTEzMiZyMj0xODExMDgzJmRpZmZfZm9ybWF0PWhdCi1TaWduZWQtb2Zm
LWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotLS0tCi0gU0NvbnN0cnVjdCB8IDIg
Ky0KLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKLQotZGlm
ZiAtLWdpdCBhL1NDb25zdHJ1Y3QgYi9TQ29uc3RydWN0Ci1pbmRleCAxNjcwNDU5Li4xOGE0NWZh
IDEwMDY0NAotLS0tIGEvU0NvbnN0cnVjdAotKysrIGIvU0NvbnN0cnVjdAotQEAgLTE4NCw3ICsx
ODQsNyBAQCBDQUxMT1VUX09LQVkgPSBub3QgKGVudi5HZXRPcHRpb24oJ2NsZWFuJykgb3IgZW52
LkdldE9wdGlvbignaGVscCcpKQotIAotIHVua25vd24gPSBvcHRzLlVua25vd25WYXJpYWJsZXMo
KQotIGlmIHVua25vd246Ci0tICBwcmludCAnV2FybmluZzogVXNlZCB1bmtub3duIHZhcmlhYmxl
czonLCAnLCAnLmpvaW4odW5rbm93bi5rZXlzKCkpCi0rICBwcmludCgnV2FybmluZzogVXNlZCB1
bmtub3duIHZhcmlhYmxlczonLCAnLCAnLmpvaW4odW5rbm93bi5rZXlzKCkpKQotIAotIGFwciA9
IHN0cihlbnZbJ0FQUiddKQotIGFwdSA9IHN0cihlbnZbJ0FQVSddKQpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvc2VyZi9zZXJmLzAwMDEtYnVja2V0cy1zc2xfYnVja2V0cy5jLWRv
LW5vdC11c2UtRVJSX0dFVF9GVU5DLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc2VyZi9z
ZXJmLzAwMDEtYnVja2V0cy1zc2xfYnVja2V0cy5jLWRvLW5vdC11c2UtRVJSX0dFVF9GVU5DLnBh
dGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA5MWNjYzhhNDc0Li4wMDAwMDAwMDAw
Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NlcmYvc2VyZi8wMDAxLWJ1Y2tldHMtc3NsX2J1
Y2tldHMuYy1kby1ub3QtdXNlLUVSUl9HRVRfRlVOQy5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0x
LDI4ICswLDAgQEAKLUZyb20gMmY0NTcxMWE2NmZmOTk4ODZiNmU0YTU3MDhlMmRiMDFhNjNlNWFm
NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
QGxpbnV0cm9uaXguZGU+Ci1EYXRlOiBGcmksIDEwIFNlcCAyMDIxIDExOjA1OjEwICswMjAwCi1T
dWJqZWN0OiBbUEFUQ0hdIGJ1Y2tldHMvc3NsX2J1Y2tldHMuYzogZG8gbm90IHVzZSBFUlJfR0VU
X0ZVTkMKLQotVXBzdHJlYW0gcmVtb3ZlZCBpdCBpbgotaHR0cHM6Ly9naXRodWIuY29tL29wZW5z
c2wvb3BlbnNzbC9wdWxsLzE2MDA0Ci0KLVVwc3RyZWFtLVN0YXR1czogSW5hY3RpdmUtVXBzdHJl
YW0gW2xhc3RyZWxlYXNlOiAyMDE1LCBsYXN0Y29tbWl0OiAyMDE5XQotU2lnbmVkLW9mZi1ieTog
QWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KLS0tLQotIGJ1Y2tldHMvc3Ns
X2J1Y2tldHMuYyB8IDMgKy0tCi0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRl
bGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvYnVja2V0cy9zc2xfYnVja2V0cy5jIGIvYnVja2V0
cy9zc2xfYnVja2V0cy5jCi1pbmRleCBiMDFlNTM1Li45ODAxZjg3IDEwMDY0NAotLS0tIGEvYnVj
a2V0cy9zc2xfYnVja2V0cy5jCi0rKysgYi9idWNrZXRzL3NzbF9idWNrZXRzLmMKLUBAIC0xMzI1
LDggKzEzMjUsNyBAQCBzdGF0aWMgaW50IHNzbF9uZWVkX2NsaWVudF9jZXJ0KFNTTCAqc3NsLCBY
NTA5ICoqY2VydCwgRVZQX1BLRVkgKipwa2V5KQotICAgICAgICAgICAgICAgICByZXR1cm4gMDsK
LSAgICAgICAgICAgICB9Ci0gICAgICAgICAgICAgZWxzZSB7Ci0tICAgICAgICAgICAgICAgIHBy
aW50ZigiT3BlblNTTCBjZXJ0IGVycm9yOiAlZCAlZCAlZFxuIiwgRVJSX0dFVF9MSUIoZXJyKSwK
LS0gICAgICAgICAgICAgICAgICAgICAgIEVSUl9HRVRfRlVOQyhlcnIpLAotKyAgICAgICAgICAg
ICAgICBwcmludGYoIk9wZW5TU0wgY2VydCBlcnJvcjogJWQgJWRcbiIsIEVSUl9HRVRfTElCKGVy
ciksCi0gICAgICAgICAgICAgICAgICAgICAgICBFUlJfR0VUX1JFQVNPTihlcnIpKTsKLSAgICAg
ICAgICAgICAgICAgUEtDUzEyX2ZyZWUocDEyKTsKLSAgICAgICAgICAgICAgICAgYmlvX21ldGhf
ZnJlZShiaW9tKTsKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NlcmYvc2VyZi8w
MDA0LUZvbGxvdy11cC10by1yMTgxMTA4My1maXgtYnVpbGRpbmctd2l0aC1zY29ucy0zLjAuMC0u
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zZXJmL3NlcmYvMDAwNC1Gb2xsb3ctdXAtdG8t
cjE4MTEwODMtZml4LWJ1aWxkaW5nLXdpdGgtc2NvbnMtMy4wLjAtLnBhdGNoCmRlbGV0ZWQgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCAwMmZhOWUzYTA2Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVj
aXBlcy1zdXBwb3J0L3NlcmYvc2VyZi8wMDA0LUZvbGxvdy11cC10by1yMTgxMTA4My1maXgtYnVp
bGRpbmctd2l0aC1zY29ucy0zLjAuMC0ucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwyOSArMCww
IEBACi1Gcm9tIDU2NTIxMWZkMDgyZWY2NTNjYTljNDRhMzQ1MzUwZmMxNDUxZjVhMGYgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgot
RGF0ZTogTW9uLCAzIFNlcCAyMDE4IDExOjEyOjM4IC0wNzAwCi1TdWJqZWN0OiBbUEFUQ0hdIEZv
bGxvdy11cCB0byByMTgxMTA4MyBmaXggYnVpbGRpbmcgd2l0aCBzY29ucyAzLjAuMCBhbmQKLSBQ
eXRob24zCi0KLSogU0NvbnN0cnVjdDogQXBwZW5kIGRlY29kZSgndXRmLTgpIHRvIEZJTEUuZ2V0
X2NvbnRlbnRzKCkgdG8gYXZvaWQKLSAgVHlwZUVycm9yOiBjYW5ub3QgdXNlIGEgc3RyaW5nIHBh
dHRlcm4gb24gYSBieXRlcy1saWtlIG9iamVjdAotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0
Ci1baHR0cHM6Ly9zdm4uYXBhY2hlLm9yZy92aWV3dmMvc2VyZi90cnVuay9TQ29uc3RydWN0P3Ix
PTE4MTEwODgmcjI9MTgxNDYwNF0KLVNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBn
bWFpbC5jb20+Ci0tLS0KLSBTQ29uc3RydWN0IHwgMiArLQotIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEvU0NvbnN0cnVjdCBiL1ND
b25zdHJ1Y3QKLWluZGV4IDg3NzczMWUuLjc2NzhiYjEgMTAwNjQ0Ci0tLS0gYS9TQ29uc3RydWN0
Ci0rKysgYi9TQ29uc3RydWN0Ci1AQCAtMTY5LDcgKzE2OSw3IEBAIGVudi5BcHBlbmQoQlVJTERF
UlMgPSB7Ci0gbWF0Y2ggPSByZS5zZWFyY2goJ1NFUkZfTUFKT1JfVkVSU0lPTiAoWzAtOV0rKS4q
JwotICAgICAgICAgICAgICAgICAgICdTRVJGX01JTk9SX1ZFUlNJT04gKFswLTldKykuKicKLSAg
ICAgICAgICAgICAgICAgICAnU0VSRl9QQVRDSF9WRVJTSU9OIChbMC05XSspJywKLS0gICAgICAg
ICAgICAgICAgICBlbnYuRmlsZSgnc2VyZi5oJykuZ2V0X2NvbnRlbnRzKCksCi0rICAgICAgICAg
ICAgICAgICAgZW52LkZpbGUoJ3NlcmYuaCcpLmdldF9jb250ZW50cygpLmRlY29kZSgndXRmLTgn
KSwKLSAgICAgICAgICAgICAgICAgICByZS5ET1RBTEwpCi0gTUFKT1IsIE1JTk9SLCBQQVRDSCA9
IFtpbnQoeCkgZm9yIHggaW4gbWF0Y2guZ3JvdXBzKCldCi0gZW52LkFwcGVuZChNQUpPUj1zdHIo
TUFKT1IpKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc2VyZi9zZXJmXzEuMy45
LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc2VyZi9zZXJmXzEuMy4xMC5iYgpzaW1pbGFyaXR5
IGluZGV4IDc4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9zZXJmL3NlcmZfMS4z
LjkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3NlcmYvc2VyZl8xLjMuMTAuYmIK
aW5kZXggNjY5ZjQyYjhlNy4uYzZiNTE0NTJhYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvc2VyZi9zZXJmXzEuMy45LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NlcmYv
c2VyZl8xLjMuMTAuYmIKQEAgLTcsMTYgKzcsMTIgQEAgSE9NRVBBR0UgPSAiaHR0cDovL3NlcmYu
YXBhY2hlLm9yZy8iCiBTUkNfVVJJID0gIiR7QVBBQ0hFX01JUlJPUn0vJHtCUE59LyR7QlBOfS0k
e1BWfS50YXIuYnoyIFwKICAgICAgICAgICAgZmlsZTovL25vcnBhdGgucGF0Y2ggXAogICAgICAg
ICAgICBmaWxlOi8vZW52LnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtRml4LXN5bnRh
eC1vZi1hLXByaW50LWluLXRoZS1zY29ucy1maWxlLXRvLXVuYnJlYWstYi5wYXRjaCBcCiAgICAg
ICAgICAgIGZpbGU6Ly8wMDAyLVNDb25zdHJ1Y3QtRml4LXBhdGgtcXVvdGluZy1mb3ItLmRlZi1n
ZW5lcmF0b3IucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMy1nZW5fZGVmLnBhdGNoIFwK
LSAgICAgICAgICAgZmlsZTovLzAwMDQtRm9sbG93LXVwLXRvLXIxODExMDgzLWZpeC1idWlsZGlu
Zy13aXRoLXNjb25zLTMuMC4wLS5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9TQ29uc3RydWN0
LnN0b3AuY3JlYXRpbmcuZGlyZWN0b3JpZXMud2l0aG91dC5zYW5kYm94LWluc3RhbGwucHJlZml4
LnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtYnVja2V0cy1zc2xfYnVja2V0cy5jLWRv
LW5vdC11c2UtRVJSX0dFVF9GVU5DLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW21k
NXN1bV0gPSAiMzcwYTYzNDBmZjIwMzY2YWIwODgwMTJjZDEzZjJiNTciCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiNTQ5YzJkMjFjNTc3YThhOWMwNDUwZmFjYjVjY2E4MDlmMjY1OTFmMDQ4ZTQ2NjU1
MjI0MDk0N2JkZjdhODdjYyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiZTgxZWYwOGJhYTI1MTZl
Y2RhNzZhNzdhZGY3ZGVmN2JjMzIyN2VlYjU3OGI5YTMzYjQ1ZjdiNDFkYzA2NGU2IgogCiBMSUNF
TlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21k
NT04NmQzZjNhOTVjMzI0Yzk0NzliZDg5ODY5NjhmNDMyNyIKLS0gCjIuMzkuMgoK

--===============5093402242176926844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/serf: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-32-poky-linux/serf: PV changed from "1.3.9" to "1.3.10"
packages/core2-32-poky-linux/serf: SRC_URI changed from "https://archive.apache.org/dist/serf/serf-1.3.9.tar.bz2 file://norpath.patch file://env.patch file://0001-Fix-syntax-of-a-print-in-the-scons-file-to-unbreak-b.patch file://0002-SConstruct-Fix-path-quoting-for-.def-generator.patch file://0003-gen_def.patch file://0004-Follow-up-to-r1811083-fix-building-with-scons-3.0.0-.patch file://SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch file://0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch" to "https://archive.apache.org/dist/serf/serf-1.3.10.tar.bz2 file://norpath.patch file://env.patch file://0002-SConstruct-Fix-path-quoting-for-.def-generator.patch file://0003-gen_def.patch file://SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch"
packages/core2-32-poky-linux/serf/serf-dbg: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-32-poky-linux/serf/serf-dbg: PV changed from "1.3.9" to "1.3.10"
packages/core2-32-poky-linux/serf/serf-dbg: PKGSIZE changed from 300000 to 300132 (+0%)
packages/core2-32-poky-linux/serf/serf-dev: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-32-poky-linux/serf/serf-dev: PV changed from "1.3.9" to "1.3.10"
packages/core2-32-poky-linux/serf/serf-dev: PKGSIZE changed from 69732 to 69734 (+0%)
packages/core2-32-poky-linux/serf/serf-doc: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-32-poky-linux/serf/serf-doc: PV changed from "1.3.9" to "1.3.10"
packages/core2-32-poky-linux/serf/serf-locale: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-32-poky-linux/serf/serf-locale: PV changed from "1.3.9" to "1.3.10"
packages/core2-32-poky-linux/serf/serf-src: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-32-poky-linux/serf/serf-src: PV changed from "1.3.9" to "1.3.10"
packages/core2-32-poky-linux/serf/serf-src: PKGSIZE changed from 435970 to 437497 (+0%)
packages/core2-32-poky-linux/serf/serf-staticdev: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-32-poky-linux/serf/serf-staticdev: PV changed from "1.3.9" to "1.3.10"
packages/core2-32-poky-linux/serf/serf: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-32-poky-linux/serf/serf: PV changed from "1.3.9" to "1.3.10"

--===============5093402242176926844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a5a95bdf9dd0ca45f389c6132d676f800f8fe207"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 38 Local 19 Mirrors 0 Missed 19 Current 292 (50% match, 94% complete)
Removing 2 stale sstate objects for arch cortexa15t2hf-neon...done.
NOTE: Executing Tasks
NOTE: Running setscene task 304 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 305 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_create_spdx_setscene)
NOTE: Running task 766 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_fetch)
NOTE: Running task 823 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_fetch)
NOTE: Running task 935 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_fetch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe serf-1.3.10-r0: task do_fetch: Started
NOTE: recipe apr-1.7.3-r0: task do_fetch: Started
NOTE: recipe apr-util-1.6.3-r0: task do_fetch: Started
NOTE: recipe serf-1.3.10-r0: task do_fetch: Succeeded
NOTE: recipe apr-util-1.6.3-r0: task do_fetch: Succeeded
NOTE: recipe apr-1.7.3-r0: task do_fetch: Succeeded
NOTE: Running task 983 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_unpack)
NOTE: Running task 984 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_unpack)
NOTE: Running task 985 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_unpack)
NOTE: recipe opkg-utils-0.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1066 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe serf-1.3.10-r0: task do_unpack: Started
NOTE: recipe apr-1.7.3-r0: task do_unpack: Started
NOTE: recipe apr-util-1.6.3-r0: task do_unpack: Started
NOTE: recipe serf-1.3.10-r0: task do_unpack: Succeeded
NOTE: Running task 1113 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_patch)
NOTE: recipe apr-util-1.6.3-r0: task do_unpack: Succeeded
NOTE: recipe apr-1.7.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1114 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_patch)
NOTE: recipe serf-1.3.10-r0: task do_patch: Started
NOTE: recipe apr-util-1.6.3-r0: task do_patch: Started
NOTE: recipe apr-1.7.3-r0: task do_unpack: Succeeded
NOTE: Running task 1115 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_patch)
NOTE: Running task 1116 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_collect_spdx_deps)
NOTE: recipe apr-1.7.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe apr-1.7.3-r0: task do_patch: Started
NOTE: recipe apr-1.7.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe apr-util-1.6.3-r0: task do_patch: Succeeded
NOTE: Running task 1117 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_deploy_source_date_epoch)
NOTE: recipe apr-1.7.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe serf-1.3.10-r0: task do_patch: Succeeded
NOTE: Running task 1118 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 1119 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_populate_lic)
NOTE: recipe apr-util-1.6.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe serf-1.3.10-r0: task do_populate_lic: Started
NOTE: recipe serf-1.3.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe apr-util-1.6.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe serf-1.3.10-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_populate_lic unihash changed to 761254ce560f32f5fbba85247c1fcf35f5ea740f624164a70bf91b6133c5de5f
NOTE: recipe apr-1.7.3-r0: task do_patch: Succeeded
NOTE: Running task 1120 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_deploy_source_date_epoch)
NOTE: recipe serf-1.3.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe apr-1.7.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe apr-1.7.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1121 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_configure)
NOTE: recipe apr-1.7.3-r0: task do_configure: Started
NOTE: recipe apr-1.7.3-r0: task do_configure: Succeeded
NOTE: Running task 1122 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_configure_ptest_base)
NOTE: recipe apr-1.7.3-r0: task do_configure_ptest_base: Started
NOTE: recipe apr-1.7.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1123 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_compile)
NOTE: recipe apr-1.7.3-r0: task do_compile: Started
NOTE: recipe apr-1.7.3-r0: task do_compile: Succeeded
NOTE: Running task 1124 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_compile_ptest_base)
NOTE: recipe apr-1.7.3-r0: task do_compile_ptest_base: Started
NOTE: recipe apr-1.7.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1125 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_install)
NOTE: recipe apr-1.7.3-r0: task do_install: Started
NOTE: recipe apr-1.7.3-r0: task do_install: Succeeded
NOTE: Running task 1126 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_install_ptest_base)
NOTE: recipe apr-1.7.3-r0: task do_install_ptest_base: Started
NOTE: recipe apr-1.7.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1127 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_populate_sysroot)
NOTE: Running task 1128 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_package)
NOTE: recipe apr-1.7.3-r0: task do_populate_sysroot: Started
NOTE: recipe apr-1.7.3-r0: task do_package: Started
NOTE: recipe apr-1.7.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1129 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe apr-util-1.6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe apr-util-1.6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1130 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_configure)
NOTE: recipe apr-util-1.6.3-r0: task do_configure: Started
NOTE: recipe apr-1.7.3-r0: task do_package: Succeeded
NOTE: Running task 1131 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_packagedata)
NOTE: recipe apr-1.7.3-r0: task do_packagedata: Started
NOTE: recipe apr-1.7.3-r0: task do_packagedata: Failed
NOTE: recipe apr-util-1.6.3-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1131 tasks of which 1105 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-src went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-dbg went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-ptest went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-staticdev went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-dev went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-doc went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-locale went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-bin went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/apr/1.7.3-r0/temp/log.do_packagedata.4056955
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_packagedata) failed with exit code '1'

--===============5093402242176926844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 69 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a5a95bdf9dd0ca45f389c6132d676f800f8fe207"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 38 Local 19 Mirrors 0 Missed 19 Current 292 (50% match, 94% complete)
Removing 2 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 304 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 305 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_create_spdx_setscene)
NOTE: Running task 767 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_fetch)
NOTE: Running task 823 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_fetch)
NOTE: Running task 935 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe apr-1.7.3-r0: task do_fetch: Started
NOTE: recipe apr-util-1.6.3-r0: task do_fetch: Started
NOTE: recipe serf-1.3.10-r0: task do_fetch: Started
NOTE: recipe apr-1.7.3-r0: task do_fetch: Succeeded
NOTE: recipe apr-util-1.6.3-r0: task do_fetch: Succeeded
NOTE: Running task 983 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_unpack)
NOTE: Running task 984 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_unpack)
NOTE: recipe serf-1.3.10-r0: task do_fetch: Succeeded
NOTE: Running task 985 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1089 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe apr-1.7.3-r0: task do_unpack: Started
NOTE: recipe apr-util-1.6.3-r0: task do_unpack: Started
NOTE: recipe serf-1.3.10-r0: task do_unpack: Started
NOTE: recipe apr-1.7.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe apr-util-1.6.3-r0: task do_unpack: Succeeded
NOTE: recipe serf-1.3.10-r0: task do_unpack: Succeeded
NOTE: Running task 1113 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_patch)
NOTE: Running task 1114 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_patch)
NOTE: recipe serf-1.3.10-r0: task do_patch: Started
NOTE: recipe apr-util-1.6.3-r0: task do_patch: Started
NOTE: recipe apr-1.7.3-r0: task do_unpack: Succeeded
NOTE: Running task 1115 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_patch)
NOTE: Running task 1116 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_collect_spdx_deps)
NOTE: recipe apr-1.7.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe apr-1.7.3-r0: task do_patch: Started
NOTE: recipe apr-1.7.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe apr-1.7.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe apr-util-1.6.3-r0: task do_patch: Succeeded
NOTE: Running task 1117 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_deploy_source_date_epoch)
NOTE: recipe apr-util-1.6.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe serf-1.3.10-r0: task do_patch: Succeeded
NOTE: Running task 1118 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 1119 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_populate_lic)
NOTE: recipe apr-util-1.6.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe serf-1.3.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe serf-1.3.10-r0: task do_populate_lic: Started
NOTE: recipe serf-1.3.10-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_populate_lic unihash changed to 761254ce560f32f5fbba85247c1fcf35f5ea740f624164a70bf91b6133c5de5f
NOTE: recipe serf-1.3.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe apr-1.7.3-r0: task do_patch: Succeeded
NOTE: Running task 1120 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_deploy_source_date_epoch)
NOTE: recipe apr-1.7.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe apr-1.7.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1121 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_configure)
NOTE: recipe apr-1.7.3-r0: task do_configure: Started
NOTE: recipe apr-1.7.3-r0: task do_configure: Succeeded
NOTE: Running task 1122 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_configure_ptest_base)
NOTE: recipe apr-1.7.3-r0: task do_configure_ptest_base: Started
NOTE: recipe apr-1.7.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1123 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_compile)
NOTE: recipe apr-1.7.3-r0: task do_compile: Started
NOTE: recipe apr-1.7.3-r0: task do_compile: Succeeded
NOTE: Running task 1124 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_compile_ptest_base)
NOTE: recipe apr-1.7.3-r0: task do_compile_ptest_base: Started
NOTE: recipe apr-1.7.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1125 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_install)
NOTE: recipe apr-1.7.3-r0: task do_install: Started
NOTE: recipe apr-1.7.3-r0: task do_install: Succeeded
NOTE: Running task 1126 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_install_ptest_base)
NOTE: recipe apr-1.7.3-r0: task do_install_ptest_base: Started
NOTE: recipe apr-1.7.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1127 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_populate_sysroot)
NOTE: Running task 1128 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_package)
NOTE: recipe apr-1.7.3-r0: task do_populate_sysroot: Started
NOTE: recipe apr-1.7.3-r0: task do_package: Started
NOTE: recipe apr-1.7.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1129 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe apr-util-1.6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe apr-util-1.6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1130 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_configure)
NOTE: recipe apr-util-1.6.3-r0: task do_configure: Started
NOTE: recipe apr-1.7.3-r0: task do_package: Succeeded
NOTE: Running task 1131 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_packagedata)
NOTE: recipe apr-1.7.3-r0: task do_packagedata: Started
NOTE: recipe apr-1.7.3-r0: task do_packagedata: Failed
NOTE: recipe apr-util-1.6.3-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1131 tasks of which 1105 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 6 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-src went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-dbg went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-ptest went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-staticdev went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-dev went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-doc went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-locale went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-bin went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/apr/1.7.3-r0/temp/log.do_packagedata.195559
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_packagedata) failed with exit code '1'

--===============5093402242176926844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a5a95bdf9dd0ca45f389c6132d676f800f8fe207"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 38 Local 19 Mirrors 0 Missed 19 Current 292 (50% match, 94% complete)
Removing 2 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 304 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 305 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_create_spdx_setscene)
NOTE: Running task 767 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_fetch)
NOTE: Running task 823 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_fetch)
NOTE: Running task 935 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe apr-1.7.3-r0: task do_fetch: Started
NOTE: recipe apr-util-1.6.3-r0: task do_fetch: Started
NOTE: recipe serf-1.3.10-r0: task do_fetch: Started
NOTE: recipe apr-1.7.3-r0: task do_fetch: Succeeded
NOTE: recipe apr-util-1.6.3-r0: task do_fetch: Succeeded
NOTE: recipe serf-1.3.10-r0: task do_fetch: Succeeded
NOTE: Running task 983 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_unpack)
NOTE: Running task 984 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_unpack)
NOTE: Running task 985 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_unpack)
NOTE: recipe opkg-utils-0.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1066 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe apr-util-1.6.3-r0: task do_unpack: Started
NOTE: recipe serf-1.3.10-r0: task do_unpack: Started
NOTE: recipe apr-1.7.3-r0: task do_unpack: Started
NOTE: recipe apr-util-1.6.3-r0: task do_unpack: Succeeded
NOTE: Running task 1113 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_patch)
NOTE: recipe serf-1.3.10-r0: task do_unpack: Succeeded
NOTE: recipe apr-1.7.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1114 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_patch)
NOTE: recipe serf-1.3.10-r0: task do_patch: Started
NOTE: recipe apr-util-1.6.3-r0: task do_patch: Started
NOTE: recipe apr-1.7.3-r0: task do_unpack: Succeeded
NOTE: Running task 1115 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_patch)
NOTE: Running task 1116 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_collect_spdx_deps)
NOTE: recipe apr-1.7.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe apr-1.7.3-r0: task do_patch: Started
NOTE: recipe apr-1.7.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe apr-1.7.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe apr-util-1.6.3-r0: task do_patch: Succeeded
NOTE: Running task 1117 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_deploy_source_date_epoch)
NOTE: recipe apr-util-1.6.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe serf-1.3.10-r0: task do_patch: Succeeded
NOTE: Running task 1118 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 1119 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_populate_lic)
NOTE: recipe apr-util-1.6.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe serf-1.3.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe serf-1.3.10-r0: task do_populate_lic: Started
NOTE: recipe serf-1.3.10-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_populate_lic unihash changed to 761254ce560f32f5fbba85247c1fcf35f5ea740f624164a70bf91b6133c5de5f
NOTE: recipe serf-1.3.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe apr-1.7.3-r0: task do_patch: Succeeded
NOTE: Running task 1120 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_deploy_source_date_epoch)
NOTE: recipe apr-1.7.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe apr-1.7.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1121 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_configure)
NOTE: recipe apr-1.7.3-r0: task do_configure: Started
NOTE: recipe apr-1.7.3-r0: task do_configure: Succeeded
NOTE: Running task 1122 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_configure_ptest_base)
NOTE: recipe apr-1.7.3-r0: task do_configure_ptest_base: Started
NOTE: recipe apr-1.7.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1123 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_compile)
NOTE: recipe apr-1.7.3-r0: task do_compile: Started
NOTE: recipe apr-1.7.3-r0: task do_compile: Succeeded
NOTE: Running task 1124 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_compile_ptest_base)
NOTE: recipe apr-1.7.3-r0: task do_compile_ptest_base: Started
NOTE: recipe apr-1.7.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1125 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_install)
NOTE: recipe apr-1.7.3-r0: task do_install: Started
NOTE: recipe apr-1.7.3-r0: task do_install: Succeeded
NOTE: Running task 1126 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_install_ptest_base)
NOTE: recipe apr-1.7.3-r0: task do_install_ptest_base: Started
NOTE: recipe apr-1.7.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1127 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_populate_sysroot)
NOTE: Running task 1128 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_package)
NOTE: recipe apr-1.7.3-r0: task do_populate_sysroot: Started
NOTE: recipe apr-1.7.3-r0: task do_package: Started
NOTE: recipe apr-1.7.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1129 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe apr-util-1.6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe apr-util-1.6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1130 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_configure)
NOTE: recipe apr-util-1.6.3-r0: task do_configure: Started
NOTE: recipe apr-1.7.3-r0: task do_package: Succeeded
NOTE: Running task 1131 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_packagedata)
NOTE: recipe apr-1.7.3-r0: task do_packagedata: Started
NOTE: recipe apr-1.7.3-r0: task do_packagedata: Failed
NOTE: recipe apr-util-1.6.3-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1131 tasks of which 1105 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 7 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-src went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-dbg went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-ptest went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-staticdev went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-dev went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-doc went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-locale went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-bin went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/apr/1.7.3-r0/temp/log.do_packagedata.39618
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_packagedata) failed with exit code '1'

--===============5093402242176926844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 47 skipped, 0 masked, 0 errors.
Removing 21 recipes from the core2-32 sysroot...done.
Removing 20 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a5a95bdf9dd0ca45f389c6132d676f800f8fe207"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 132 Local 113 Mirrors 0 Missed 19 Current 198 (85% match, 94% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 202 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 203 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 205 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 206 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_create_spdx_setscene)
NOTE: Running setscene task 218 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 219 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 222 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 224 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running task 574 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_fetch)
NOTE: Running task 602 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_fetch)
NOTE: Running task 663 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_fetch)
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe apr-1.7.3-r0: task do_fetch: Started
NOTE: recipe apr-util-1.6.3-r0: task do_fetch: Started
NOTE: recipe serf-1.3.10-r0: task do_fetch: Started
NOTE: recipe util-linux-2.38.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe apr-util-1.6.3-r0: task do_fetch: Succeeded
NOTE: recipe apr-1.7.3-r0: task do_fetch: Succeeded
NOTE: recipe serf-1.3.10-r0: task do_fetch: Succeeded
NOTE: Running task 676 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_unpack)
NOTE: Running task 677 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_unpack)
NOTE: Running task 678 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_unpack)
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 235 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: recipe apr-util-1.6.3-r0: task do_unpack: Started
NOTE: recipe serf-1.3.10-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 236 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe apr-1.7.3-r0: task do_unpack: Started
NOTE: recipe util-linux-2.38.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 237 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 240 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 241 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 247 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe apr-util-1.6.3-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe serf-1.3.10-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 679 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_patch)
NOTE: Running task 680 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_patch)
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe apr-util-1.6.3-r0: task do_patch: Started
NOTE: recipe serf-1.3.10-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 250 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_create_spdx_setscene)
NOTE: recipe apr-1.7.3-r0: task do_unpack: Succeeded
NOTE: Running task 686 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_patch)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe apr-1.7.3-r0: task do_patch: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 256 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 260 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_create_spdx_setscene)
NOTE: recipe apr-util-1.6.3-r0: task do_patch: Succeeded
NOTE: Running task 695 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 262 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 263 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 264 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 265 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 267 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 268 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 269 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 270 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 271 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 272 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe apr-util-1.6.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe serf-1.3.10-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe apr-util-1.6.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 284 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 849 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 850 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_populate_lic)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe serf-1.3.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe serf-1.3.10-r0: task do_populate_lic: Started
NOTE: recipe serf-1.3.10-r0: task do_populate_lic: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_populate_lic unihash changed to 761254ce560f32f5fbba85247c1fcf35f5ea740f624164a70bf91b6133c5de5f
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe serf-1.3.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 289 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 290 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe apr-1.7.3-r0: task do_patch: Succeeded
NOTE: Running task 859 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_deploy_source_date_epoch)
NOTE: recipe apr-1.7.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 293 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 295 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe apr-1.7.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 298 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 300 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 303 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 305 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 307 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 309 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 310 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 312 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 317 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 318 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 324 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 327 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 328 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1030 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1113 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_collect_spdx_deps)
NOTE: recipe apr-1.7.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe apr-1.7.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe apr-1.7.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe apr-1.7.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1120 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_configure)
NOTE: recipe apr-1.7.3-r0: task do_configure: Started
NOTE: recipe apr-1.7.3-r0: task do_configure: Succeeded
NOTE: Running task 1121 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_configure_ptest_base)
NOTE: recipe apr-1.7.3-r0: task do_configure_ptest_base: Started
NOTE: recipe apr-1.7.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1122 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_compile)
NOTE: recipe apr-1.7.3-r0: task do_compile: Started
NOTE: recipe apr-1.7.3-r0: task do_compile: Succeeded
NOTE: Running task 1123 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_compile_ptest_base)
NOTE: recipe apr-1.7.3-r0: task do_compile_ptest_base: Started
NOTE: recipe apr-1.7.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1124 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_install)
NOTE: recipe apr-1.7.3-r0: task do_install: Started
NOTE: recipe apr-1.7.3-r0: task do_install: Succeeded
NOTE: Running task 1125 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_install_ptest_base)
NOTE: recipe apr-1.7.3-r0: task do_install_ptest_base: Started
NOTE: recipe apr-1.7.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1126 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_populate_sysroot)
NOTE: Running task 1127 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_package)
NOTE: recipe apr-1.7.3-r0: task do_populate_sysroot: Started
NOTE: recipe apr-1.7.3-r0: task do_package: Started
NOTE: recipe apr-1.7.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1128 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe apr-util-1.6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe apr-util-1.6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1129 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_configure)
NOTE: recipe apr-util-1.6.3-r0: task do_configure: Started
NOTE: recipe apr-1.7.3-r0: task do_package: Succeeded
NOTE: Running task 1130 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_packagedata)
NOTE: recipe apr-1.7.3-r0: task do_packagedata: Started
NOTE: recipe apr-1.7.3-r0: task do_packagedata: Failed
NOTE: recipe apr-util-1.6.3-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1130 tasks of which 1104 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-src went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-dbg went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-ptest went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-staticdev went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-dev went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-doc went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-locale went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-bin went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/apr/1.7.3-r0/temp/log.do_packagedata.369158
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_packagedata) failed with exit code '1'

--===============5093402242176926844==--

