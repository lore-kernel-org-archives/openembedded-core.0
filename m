Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C1CE9A055
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:46 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1419.1771440097995604526
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SWWTPVwS;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=U/cfC+yn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019c720ec81c-055dba67-cb08-497d-a2ee-9e19dd76be37-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440097;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EHxJmxLsANj3Lvz+UmyXbzIbY+IfLbHu6rYzqm6A2z0=;
	b=SWWTPVwSNT4T3tEH1WPSnYA8bonKYQ0VT7rVFsH7xA6b/3cYEoKl/ThcHWF6hcqW
	iQfrgZADJBBicWWtOIZszD9P0vX3nBDE9QIVCOj/zQu7AgbQ5u3K1PncVkIkK+b4CAU
	l03NvDR/4U7oRRzVcRagQ+rt3YH3S3HUY6BZmAig=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440097;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EHxJmxLsANj3Lvz+UmyXbzIbY+IfLbHu6rYzqm6A2z0=;
	b=U/cfC+ynooV3R0n/41uTxQtRHMDMDYyo36EAw57NhcYedoIiKzBVs4HotO/6mm7M
	OBTwKmy6WvsBGYAc4NHD0qzl3HsjFEjE2ttUVdBN7cAkC2aUfREZ7Z6EsJ4V2736gyT
	iFhIcRXw4+Ew0YIed8VIoTaE+14DoTNM0U1ZrB3k=
Content-Type: multipart/mixed; boundary="===============2856279204198518383=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] nfs-utils: upgrading to 2.8.5 FAILED
Message-ID: <0101019c720ec81c-055dba67-cb08-497d-a2ee-9e19dd76be37-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231335

--===============2856279204198518383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *nfs-utils* to *2.8.5* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-nfs-utils-upgrade-2.8.4-2.8.5.patch
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
From cef188ce2c117a9195b4f02e418bc799b5f714ed Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 11:41:47 +0000
Subject: [PATCH] nfs-utils: upgrade 2.8.4 -> 2.8.5

---
 ...t-Makefile.am-Do-not-use-build-flags.patch | 36 -------------------
 .../0004-Use-nogroup-for-nobody-group.patch   |  6 ++--
 .../0005-find-OE-provided-Kerberos.patch      |  4 +--
 ...{nfs-utils_2.8.4.bb => nfs-utils_2.8.5.bb} |  3 +-
 4 files changed, 6 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-locktest-Makefile.am-Do-not-use-build-flags.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.8.4.bb => nfs-utils_2.8.5.bb} (97%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-locktest-Makefile.am-Do-not-use-build-flags.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-locktest-Makefile.am-Do-not-use-build-flags.patch
deleted file mode 100644
index 351407ddcd..0000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-locktest-Makefile.am-Do-not-use-build-flags.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 9efa7a0d37665d9bb0f46d2407883a5ab42c2b84 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 24 Jul 2023 20:39:16 -0700
-Subject: [PATCH] locktest: Makefile.am: Do not use build flags
-
-Using CFLAGS_FOR_BUILD etc. here means it is using wrong flags
-when thse flags are speficied different than target flags which
-is common when cross-building. It can pass wrong paths to linker
-and it would find incompatible libraries during link since they
-are from host system and target maybe not same as build host.
-
-Fixes subtle errors like
-| aarch64-yoe-linux-ld.lld: error: /mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/nfs-utils/2.6.3-r0/recipe-sysroot-native/usr/lib/libsqlite3.so is incompatible with elf64-littleaarch64
-
-Upstream-Status: Submitted [https://marc.info/?l=linux-nfs&m=169025681008001&w=2]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tools/locktest/Makefile.am | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/tools/locktest/Makefile.am b/tools/locktest/Makefile.am
-index e8914655..2fd36971 100644
---- a/tools/locktest/Makefile.am
-+++ b/tools/locktest/Makefile.am
-@@ -2,8 +2,5 @@
- 
- noinst_PROGRAMS = testlk
- testlk_SOURCES = testlk.c
--testlk_CFLAGS=$(CFLAGS_FOR_BUILD)
--testlk_CPPFLAGS=$(CPPFLAGS_FOR_BUILD)
--testlk_LDFLAGS=$(LDFLAGS_FOR_BUILD)
- 
- MAINTAINERCLEANFILES = Makefile.in
--- 
-2.41.0
-
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch
index bbf44d5977..11f3c12846 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch
@@ -1,4 +1,4 @@
-From 001913c5eb0aad933a93ee966252905cd46d776b Mon Sep 17 00:00:00 2001
+From 0d448e3ff2733933dbd1abe8c5f5bddc90adf768 Mon Sep 17 00:00:00 2001
 From: Daniel McGregor <daniel.mcgregor@vecima.com>
 Date: Tue, 6 Jun 2023 16:07:53 -0600
 Subject: [PATCH] Use "nogroup" for nobody group
@@ -11,7 +11,7 @@ Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/support/nfsidmap/idmapd.conf b/support/nfsidmap/idmapd.conf
-index 2a2f79a1..e6f3724f 100644
+index 2a2f79a..e6f3724 100644
 --- a/support/nfsidmap/idmapd.conf
 +++ b/support/nfsidmap/idmapd.conf
 @@ -41,7 +41,7 @@
@@ -24,7 +24,7 @@ index 2a2f79a1..e6f3724f 100644
  [Translation]
  
 diff --git a/utils/idmapd/idmapd.c b/utils/idmapd/idmapd.c
-index cd9a965f..3be805e9 100644
+index 5231f56..e1aa8a5 100644
 --- a/utils/idmapd/idmapd.c
 +++ b/utils/idmapd/idmapd.c
 @@ -89,7 +89,7 @@
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-Kerberos.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-Kerberos.patch
index 3241e8e859..821250f707 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-Kerberos.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-Kerberos.patch
@@ -1,4 +1,4 @@
-From a2af266f013722a64c5d04e0fe097cd711393a53 Mon Sep 17 00:00:00 2001
+From e96dcb0ca27334b1a2d7f5202300fa4e02394db0 Mon Sep 17 00:00:00 2001
 From: Daniel McGregor <daniel.mcgregor@vecima.com>
 Date: Wed, 8 Nov 2023 16:24:20 -0600
 Subject: [PATCH] find OE provided Kerberos
@@ -10,7 +10,7 @@ Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/aclocal/kerberos5.m4 b/aclocal/kerberos5.m4
-index f96f0fd4..ad85fdf2 100644
+index f96f0fd..ad85fdf 100644
 --- a/aclocal/kerberos5.m4
 +++ b/aclocal/kerberos5.m4
 @@ -22,8 +22,8 @@ AC_DEFUN([AC_KERBEROS_V5],[
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.5.bb
similarity index 97%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.5.bb
index 65970f58e8..a495f7b4d4 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.4.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.5.bb
@@ -21,12 +21,11 @@ USERADD_PARAM:${PN}-client = "--system  --home-dir /var/lib/nfs \
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.xz \
            file://nfsserver \
            file://nfscommon \
-           file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch \
            file://0004-Use-nogroup-for-nobody-group.patch \
            file://0005-find-OE-provided-Kerberos.patch \
            "
 
-SRC_URI[sha256sum] = "11c4cc598a434d7d340bad3e072a373ba1dcc2c49f855d44b202222b78ecdbf5"
+SRC_URI[sha256sum] = "b13ca4a9df44186bdbe107514b22732d4243f785f95daf2fb86afc1edba15bbb"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
-- 
2.47.1


--===============2856279204198518383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1952 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-94b7bb794ac3125483fd00b773ec533a7693a8b6"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:94b7bb794ac3125483fd00b773ec533a7693a8b6"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 291 Local 277 Mirrors 0 Missed 14 Current 660 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 772 of 951 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 858 of 951 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 862 of 951 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_6.18.bb:do_create_spdx_setscene)
NOTE: Running setscene task 871 of 951 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevent/libevent_2.1.12.bb:do_create_spdx_setscene)
NOTE: Running task 989 of 2646 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.5.bb:do_recipe_qa)
NOTE: recipe rpcbind-1.2.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libevent-2.1.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe nfs-utils-2.8.5-r0: task do_recipe_qa: Started
NOTE: recipe rpcbind-1.2.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libevent-2.1.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 883 of 951 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 889 of 951 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.14.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 902 of 951 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.2.bb:do_create_spdx_setscene)
NOTE: recipe libtirpc-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-yocto-6.18.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.51.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtirpc-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-yocto-6.18.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe nfs-utils-2.8.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2254 of 2646 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.5.bb:do_fetch)
NOTE: Running task 2423 of 2646 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe nfs-utils-2.8.5-r0: task do_fetch: Started
NOTE: recipe nfs-utils-2.8.5-r0: task do_fetch: Succeeded
NOTE: Running task 2620 of 2646 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.5.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: Running task 2621 of 2646 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe nfs-utils-2.8.5-r0: task do_unpack: Started
NOTE: recipe nfs-utils-2.8.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nfs-utils-2.8.5-r0: task do_unpack: Succeeded
NOTE: Running task 2622 of 2646 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.5.bb:do_patch)
NOTE: recipe nfs-utils-2.8.5-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 2625 of 2646 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.5.bb:do_collect_spdx_deps)
NOTE: recipe nfs-utils-2.8.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe nfs-utils-2.8.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe nfs-utils-2.8.5-r0: task do_patch: Succeeded
NOTE: Running task 2632 of 2646 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2633 of 2646 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.5.bb:do_populate_lic)
NOTE: recipe nfs-utils-2.8.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nfs-utils-2.8.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nfs-utils-2.8.5-r0: task do_populate_lic: Started
NOTE: recipe nfs-utils-2.8.5-r0: task do_populate_lic: Succeeded
NOTE: recipe nfs-utils-2.8.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2634 of 2646 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.5.bb:do_configure)
NOTE: recipe nfs-utils-2.8.5-r0: task do_configure: Started
NOTE: recipe nfs-utils-2.8.5-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2634 tasks of which 2624 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260218114119.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260218114119.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.5.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.8.5/temp/log.do_configure.1758899
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: nfs-utils-2.8.5-r0 do_configure: QA Issue: nfs-utils: configure was passed unrecognised options: --disable-nfsv41 [unknown-configure-option]
ERROR: nfs-utils-2.8.5-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.8.5/temp/log.do_configure.1758899
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.5.bb:do_configure) failed with exit code '1'

--===============2856279204198518383==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-nfs-utils-upgrade-2.8.4-2.8.5.patch"

RnJvbSBjZWYxODhjZTJjMTE3YTkxOTViNGYwMmU0MThiYzc5OWI1ZjcxNGVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTE6NDE6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBu
ZnMtdXRpbHM6IHVwZ3JhZGUgMi44LjQgLT4gMi44LjUKCi0tLQogLi4udC1NYWtlZmlsZS5hbS1E
by1ub3QtdXNlLWJ1aWxkLWZsYWdzLnBhdGNoIHwgMzYgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4u
LzAwMDQtVXNlLW5vZ3JvdXAtZm9yLW5vYm9keS1ncm91cC5wYXRjaCAgIHwgIDYgKystLQogLi4u
LzAwMDUtZmluZC1PRS1wcm92aWRlZC1LZXJiZXJvcy5wYXRjaCAgICAgIHwgIDQgKy0tCiAuLi57
bmZzLXV0aWxzXzIuOC40LmJiID0+IG5mcy11dGlsc18yLjguNS5iYn0gfCAgMyArLQogNCBmaWxl
cyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDQzIGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUg
MTAwNjQ0IG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGlscy8wMDAx
LWxvY2t0ZXN0LU1ha2VmaWxlLmFtLURvLW5vdC11c2UtYnVpbGQtZmxhZ3MucGF0Y2gKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy97bmZzLXV0aWxzXzIuOC40LmJi
ID0+IG5mcy11dGlsc18yLjguNS5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRpbHMvMDAwMS1sb2NrdGVzdC1NYWtlZmlsZS5h
bS1Eby1ub3QtdXNlLWJ1aWxkLWZsYWdzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9uZnMtdXRpbHMvbmZzLXV0aWxzLzAwMDEtbG9ja3Rlc3QtTWFrZWZpbGUuYW0tRG8tbm90LXVz
ZS1idWlsZC1mbGFncy5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMzUxNDA3
ZGRjZC4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGls
cy9uZnMtdXRpbHMvMDAwMS1sb2NrdGVzdC1NYWtlZmlsZS5hbS1Eby1ub3QtdXNlLWJ1aWxkLWZs
YWdzLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMzYgKzAsMCBAQAotRnJvbSA5ZWZhN2EwZDM3
NjY1ZDliYjBmNDZkMjQwNzg4M2E1YWI0MmMyYjg0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQot
RnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KLURhdGU6IE1vbiwgMjQgSnVsIDIw
MjMgMjA6Mzk6MTYgLTA3MDAKLVN1YmplY3Q6IFtQQVRDSF0gbG9ja3Rlc3Q6IE1ha2VmaWxlLmFt
OiBEbyBub3QgdXNlIGJ1aWxkIGZsYWdzCi0KLVVzaW5nIENGTEFHU19GT1JfQlVJTEQgZXRjLiBo
ZXJlIG1lYW5zIGl0IGlzIHVzaW5nIHdyb25nIGZsYWdzCi13aGVuIHRoc2UgZmxhZ3MgYXJlIHNw
ZWZpY2llZCBkaWZmZXJlbnQgdGhhbiB0YXJnZXQgZmxhZ3Mgd2hpY2gKLWlzIGNvbW1vbiB3aGVu
IGNyb3NzLWJ1aWxkaW5nLiBJdCBjYW4gcGFzcyB3cm9uZyBwYXRocyB0byBsaW5rZXIKLWFuZCBp
dCB3b3VsZCBmaW5kIGluY29tcGF0aWJsZSBsaWJyYXJpZXMgZHVyaW5nIGxpbmsgc2luY2UgdGhl
eQotYXJlIGZyb20gaG9zdCBzeXN0ZW0gYW5kIHRhcmdldCBtYXliZSBub3Qgc2FtZSBhcyBidWls
ZCBob3N0LgotCi1GaXhlcyBzdWJ0bGUgZXJyb3JzIGxpa2UKLXwgYWFyY2g2NC15b2UtbGludXgt
bGQubGxkOiBlcnJvcjogL21udC9iL3lvZS9tYXN0ZXIvYnVpbGQvdG1wL3dvcmsvY29ydGV4YTcy
LWNvcnRleGE1My1jcnlwdG8teW9lLWxpbnV4L25mcy11dGlscy8yLjYuMy1yMC9yZWNpcGUtc3lz
cm9vdC1uYXRpdmUvdXNyL2xpYi9saWJzcWxpdGUzLnNvIGlzIGluY29tcGF0aWJsZSB3aXRoIGVs
ZjY0LWxpdHRsZWFhcmNoNjQKLQotVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8v
bWFyYy5pbmZvLz9sPWxpbnV4LW5mcyZtPTE2OTAyNTY4MTAwODAwMSZ3PTJdCi1TaWduZWQtb2Zm
LWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotLS0tCi0gdG9vbHMvbG9ja3Rlc3Qv
TWFrZWZpbGUuYW0gfCAzIC0tLQotIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQotCi1k
aWZmIC0tZ2l0IGEvdG9vbHMvbG9ja3Rlc3QvTWFrZWZpbGUuYW0gYi90b29scy9sb2NrdGVzdC9N
YWtlZmlsZS5hbQotaW5kZXggZTg5MTQ2NTUuLjJmZDM2OTcxIDEwMDY0NAotLS0tIGEvdG9vbHMv
bG9ja3Rlc3QvTWFrZWZpbGUuYW0KLSsrKyBiL3Rvb2xzL2xvY2t0ZXN0L01ha2VmaWxlLmFtCi1A
QCAtMiw4ICsyLDUgQEAKLSAKLSBub2luc3RfUFJPR1JBTVMgPSB0ZXN0bGsKLSB0ZXN0bGtfU09V
UkNFUyA9IHRlc3Rsay5jCi0tdGVzdGxrX0NGTEFHUz0kKENGTEFHU19GT1JfQlVJTEQpCi0tdGVz
dGxrX0NQUEZMQUdTPSQoQ1BQRkxBR1NfRk9SX0JVSUxEKQotLXRlc3Rsa19MREZMQUdTPSQoTERG
TEFHU19GT1JfQlVJTEQpCi0gCi0gTUFJTlRBSU5FUkNMRUFORklMRVMgPSBNYWtlZmlsZS5pbgot
LS0gCi0yLjQxLjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMt
dXRpbHMvbmZzLXV0aWxzLzAwMDQtVXNlLW5vZ3JvdXAtZm9yLW5vYm9keS1ncm91cC5wYXRjaCBi
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGlscy8wMDA0LVVzZS1u
b2dyb3VwLWZvci1ub2JvZHktZ3JvdXAucGF0Y2gKaW5kZXggYmJmNDRkNTk3Ny4uMTFmM2MxMjg0
NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0
aWxzLzAwMDQtVXNlLW5vZ3JvdXAtZm9yLW5vYm9keS1ncm91cC5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRpbHMvMDAwNC1Vc2Utbm9ncm91cC1m
b3Itbm9ib2R5LWdyb3VwLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwMDE5MTNjNWViMGFh
ZDkzM2E5M2VlOTY2MjUyOTA1Y2Q0NmQ3NzZiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSAwZDQ0OGUzZmYyNzMzOTMzZGJkMWFiZThjNWY1YmRkYzkwYWRmNzY4IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogRGFuaWVsIE1jR3JlZ29yIDxkYW5pZWwubWNncmVnb3JAdmVjaW1h
LmNvbT4KIERhdGU6IFR1ZSwgNiBKdW4gMjAyMyAxNjowNzo1MyAtMDYwMAogU3ViamVjdDogW1BB
VENIXSBVc2UgIm5vZ3JvdXAiIGZvciBub2JvZHkgZ3JvdXAKQEAgLTExLDcgKzExLDcgQEAgU2ln
bmVkLW9mZi1ieTogRGFuaWVsIE1jR3JlZ29yIDxkYW5pZWwubWNncmVnb3JAdmVjaW1hLmNvbT4K
ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlm
ZiAtLWdpdCBhL3N1cHBvcnQvbmZzaWRtYXAvaWRtYXBkLmNvbmYgYi9zdXBwb3J0L25mc2lkbWFw
L2lkbWFwZC5jb25mCi1pbmRleCAyYTJmNzlhMS4uZTZmMzcyNGYgMTAwNjQ0CitpbmRleCAyYTJm
NzlhLi5lNmYzNzI0IDEwMDY0NAogLS0tIGEvc3VwcG9ydC9uZnNpZG1hcC9pZG1hcGQuY29uZgog
KysrIGIvc3VwcG9ydC9uZnNpZG1hcC9pZG1hcGQuY29uZgogQEAgLTQxLDcgKzQxLDcgQEAKQEAg
LTI0LDcgKzI0LDcgQEAgaW5kZXggMmEyZjc5YTEuLmU2ZjM3MjRmIDEwMDY0NAogIFtUcmFuc2xh
dGlvbl0KICAKIGRpZmYgLS1naXQgYS91dGlscy9pZG1hcGQvaWRtYXBkLmMgYi91dGlscy9pZG1h
cGQvaWRtYXBkLmMKLWluZGV4IGNkOWE5NjVmLi4zYmU4MDVlOSAxMDA2NDQKK2luZGV4IDUyMzFm
NTYuLmUxYWE4YTUgMTAwNjQ0CiAtLS0gYS91dGlscy9pZG1hcGQvaWRtYXBkLmMKICsrKyBiL3V0
aWxzL2lkbWFwZC9pZG1hcGQuYwogQEAgLTg5LDcgKzg5LDcgQEAKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGlscy8wMDA1LWZpbmQtT0UtcHJv
dmlkZWQtS2VyYmVyb3MucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGls
cy9uZnMtdXRpbHMvMDAwNS1maW5kLU9FLXByb3ZpZGVkLUtlcmJlcm9zLnBhdGNoCmluZGV4IDMy
NDFlOGU4NTkuLjgyMTI1MGY3MDcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvbmZzLXV0aWxzL25mcy11dGlscy8wMDA1LWZpbmQtT0UtcHJvdmlkZWQtS2VyYmVyb3MucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzLzAw
MDUtZmluZC1PRS1wcm92aWRlZC1LZXJiZXJvcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
YTJhZjI2NmYwMTM3MjJhNjRjNWQwNGUwZmUwOTdjZDcxMTM5M2E1MyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gZTk2ZGNiMGNhMjczMzRiMWEyZDdmNTIwMjMwMGZhNGUwMjM5NGRiMCBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IERhbmllbCBNY0dyZWdvciA8ZGFuaWVsLm1j
Z3JlZ29yQHZlY2ltYS5jb20+CiBEYXRlOiBXZWQsIDggTm92IDIwMjMgMTY6MjQ6MjAgLTA2MDAK
IFN1YmplY3Q6IFtQQVRDSF0gZmluZCBPRSBwcm92aWRlZCBLZXJiZXJvcwpAQCAtMTAsNyArMTAs
NyBAQCBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgTWNHcmVnb3IgPGRhbmllbC5tY2dyZWdvckB2ZWNp
bWEuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiAKIGRpZmYgLS1naXQgYS9hY2xvY2FsL2tlcmJlcm9zNS5tNCBiL2FjbG9jYWwva2VyYmVyb3M1
Lm00Ci1pbmRleCBmOTZmMGZkNC4uYWQ4NWZkZjIgMTAwNjQ0CitpbmRleCBmOTZmMGZkLi5hZDg1
ZmRmIDEwMDY0NAogLS0tIGEvYWNsb2NhbC9rZXJiZXJvczUubTQKICsrKyBiL2FjbG9jYWwva2Vy
YmVyb3M1Lm00CiBAQCAtMjIsOCArMjIsOCBAQCBBQ19ERUZVTihbQUNfS0VSQkVST1NfVjVdLFsK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGls
c18yLjguNC5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGls
c18yLjguNS5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRpbHNfMi44LjQuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGlsc18yLjguNS5iYgppbmRleCA2
NTk3MGY1OGU4Li5hNDk1ZjdiNGQ0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L25mcy11dGlscy9uZnMtdXRpbHNfMi44LjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzXzIuOC41LmJiCkBAIC0yMSwxMiArMjEsMTEgQEAg
VVNFUkFERF9QQVJBTToke1BOfS1jbGllbnQgPSAiLS1zeXN0ZW0gIC0taG9tZS1kaXIgL3Zhci9s
aWIvbmZzIFwKIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51eC91dGlscy9uZnMt
dXRpbHMvJHtQVn0vbmZzLXV0aWxzLSR7UFZ9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly9u
ZnNzZXJ2ZXIgXAogICAgICAgICAgICBmaWxlOi8vbmZzY29tbW9uIFwKLSAgICAgICAgICAgZmls
ZTovLzAwMDEtbG9ja3Rlc3QtTWFrZWZpbGUuYW0tRG8tbm90LXVzZS1idWlsZC1mbGFncy5wYXRj
aCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDA0LVVzZS1ub2dyb3VwLWZvci1ub2JvZHktZ3JvdXAu
cGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwNS1maW5kLU9FLXByb3ZpZGVkLUtlcmJlcm9z
LnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTFjNGNjNTk4
YTQzNGQ3ZDM0MGJhZDNlMDcyYTM3M2JhMWRjYzJjNDlmODU1ZDQ0YjIwMjIyMmI3OGVjZGJmNSIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiMTNjYTRhOWRmNDQxODZiZGJlMTA3NTE0YjIyNzMyZDQy
NDNmNzg1Zjk1ZGFmMmZiODZhZmMxZWRiYTE1YmJiIgogCiAjIE9ubHkga2VybmVsLW1vZHVsZS1u
ZnNkIGlzIHJlcXVpcmVkIGhlcmUgKGJ1dCBjYW4gYmUgYnVpbHQtaW4pICAtIHRoZSBuZnNkIG1v
ZHVsZSB3aWxsCiAjIHB1bGwgaW4gdGhlIHJlbWFpbmRlciBvZiB0aGUgZGVwZW5kZW5jaWVzLgot
LSAKMi40Ny4xCgo=

--===============2856279204198518383==--

