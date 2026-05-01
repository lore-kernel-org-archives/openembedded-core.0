Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B18CD3437
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:39 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15613.1777645533763619911
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=vWDyOPH+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=B4A699Z2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019de3ee36c1-80c38748-0760-44f4-b6aa-dbd11f8f3519-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645533;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jCc9GpkSauuFrVoSKJM+ZiK0+5F3e33r8Xr2uLZdwRw=;
	b=vWDyOPH+8P63Z16wW/DF1a14TmvH2MF9uOmvKkHsAUccNLD/u9IthYJcfsaiLg+O
	6dy2lpfNh40KTEiTI1h7qSF/xLDcCovkQq+Ho1bLvqMLuMPbL0+Ua/7wo9G29RcrC9o
	565IBf7qI7onW/KVgAGBWMje/pHw8zZgkUJZcyOQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645533;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jCc9GpkSauuFrVoSKJM+ZiK0+5F3e33r8Xr2uLZdwRw=;
	b=B4A699Z2dvdYW9QIrim61rrzDZwCUf2oy09N2D4R19zHYCJuUb7309vd4QlCnc2q
	w3JCxR2wWjy80elWIZ1jQz6NhITOXCU310CUGpYvRnzNctF2QiQhzlrm1exxu4egrO1
	1atGadZff/U4j88Q+KSTY9IxRyk+iLRA8FXg2EvM=
Content-Type: multipart/mixed; boundary="===============5110575816921294665=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] nfs-utils: upgrading to 2.9.1 FAILED
Message-ID: <0101019de3ee36c1-80c38748-0760-44f4-b6aa-dbd11f8f3519-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236212

--===============5110575816921294665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *nfs-utils* to *2.9.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-nfs-utils-upgrade-2.8.7-2.9.1.patch
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
From eec9ea5afa77417d56ae06c60e0acfb7a57eba2b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 06:52:58 +0000
Subject: [PATCH] nfs-utils: upgrade 2.8.7 -> 2.9.1

---
 .../nfs-utils/0004-Use-nogroup-for-nobody-group.patch       | 6 +++---
 .../nfs-utils/0005-find-OE-provided-Kerberos.patch          | 4 ++--
 .../nfs-utils/{nfs-utils_2.8.7.bb => nfs-utils_2.9.1.bb}    | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.8.7.bb => nfs-utils_2.9.1.bb} (98%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch
index bbf44d5977..bbb7ee4bfd 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch
@@ -1,4 +1,4 @@
-From 001913c5eb0aad933a93ee966252905cd46d776b Mon Sep 17 00:00:00 2001
+From 28cfd8cd6a631463bc2e770e5b5a5796cd780708 Mon Sep 17 00:00:00 2001
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
index 3241e8e859..0bf3e2a4ba 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-Kerberos.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-Kerberos.patch
@@ -1,4 +1,4 @@
-From a2af266f013722a64c5d04e0fe097cd711393a53 Mon Sep 17 00:00:00 2001
+From b0a14ad7b85a4374a9de68876d02ccc0e9ad7800 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.7.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
similarity index 98%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.7.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
index 7693a88682..2a3f1e8f5a 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.7.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
@@ -25,7 +25,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://0005-find-OE-provided-Kerberos.patch \
            "
 
-SRC_URI[sha256sum] = "59d0f1e17b18efaa60ea3ccf89a9cad3217f8d3b23c18d2fe34b25c8969d60ae"
+SRC_URI[sha256sum] = "302846343bf509f8f884c23bdbd0fe853b7f7cbb6572060a9082279d13b21a2c"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
-- 
2.47.1


--===============5110575816921294665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1976 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.0.99+snapshot-1d2be0ed5b75ba6387c9b3a87f05be592f990608"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:1d2be0ed5b75ba6387c9b3a87f05be592f990608"
meta-yocto-bsp       
meta-poky            = "master:a67ae0e83d8aba0c46cb8383808b2d1203fbb414"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 477 Local 462 Mirrors 0 Missed 15 Current 638 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 771 of 1115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 888 of 1115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/netbase/netbase_6.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 901 of 1115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_6.18.bb:do_create_spdx_setscene)
NOTE: Running setscene task 908 of 1115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevent/libevent_2.1.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 922 of 1115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 924 of 1115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_create_spdx_setscene)
NOTE: Running task 890 of 2664 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb:do_recipe_qa)
NOTE: recipe netbase-1_6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe rpcbind-1.2.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libevent-2.1.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe netbase-1_6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nfs-utils-2.9.1-r0: task do_recipe_qa: Started
NOTE: recipe rpcbind-1.2.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1057 of 1115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libevent-2.1.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1065 of 1115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevent/libevent_2.1.12.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxml2-2.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1067 of 1115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libevent-2.1.12-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe linux-yocto-6.18.24+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libevent-2.1.12-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1072 of 1115 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe linux-yocto-6.18.24+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe nfs-utils-2.9.1-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb:do_recipe_qa unihash changed to 6cccbced4d82bdb3ca013704427a71d616ceaca93fd519956d97b97e304d278e
NOTE: recipe sqlite3-3_3.53.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2261 of 2664 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb:do_fetch)
NOTE: Running task 2450 of 2664 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: Running task 2598 of 2664 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb:do_create_recipe_spdx)
NOTE: recipe nfs-utils-2.9.1-r0: task do_fetch: Started
NOTE: recipe nfs-utils-2.9.1-r0: task do_fetch: Succeeded
NOTE: Running task 2643 of 2664 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb:do_unpack)
NOTE: Running task 2644 of 2664 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe nfs-utils-2.9.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe nfs-utils-2.9.1-r0: task do_unpack: Started
NOTE: recipe nfs-utils-2.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nfs-utils-2.9.1-r0: task do_unpack: Succeeded
NOTE: Running task 2645 of 2664 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb:do_patch)
NOTE: recipe nfs-utils-2.9.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe nfs-utils-2.9.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe nfs-utils-2.9.1-r0: task do_patch: Succeeded
NOTE: Running task 2650 of 2664 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2651 of 2664 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb:do_populate_lic)
NOTE: recipe nfs-utils-2.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nfs-utils-2.9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nfs-utils-2.9.1-r0: task do_populate_lic: Started
NOTE: recipe nfs-utils-2.9.1-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb:do_populate_lic unihash changed to 0407cafeec21b82233a2ffb0482ab2c2fd461d209d2130635e5718b54428149e
NOTE: recipe nfs-utils-2.9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb:do_deploy_source_date_epoch unihash changed to cf873a84f410dd5df950c9d086d5c9f0fb3a2dab46ce5dd49d4c80292991705d
NOTE: Setscene tasks completed
NOTE: Running task 2652 of 2664 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb:do_configure)
NOTE: recipe nfs-utils-2.9.1-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worke
 r/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-native_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libtirpc/libtirpc_1.3.7.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recip
 es-support/libcap/libcap_2.78.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libevent/libevent_2.1.12.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf/autoconf_2.73.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/automake/automake_1.18.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/r
 ecipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['base-files', 'base-passwd', 'gettext-minimal-native', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'systemd-systemctl-native', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-cross', 'libtool-native', 'm4-native', 'opkg-utils', 'quilt-native', 'libtirpc', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'linux-libc-headers', 'attr', 'bash-completion', 'libcap-ng', 'libcap', 'libevent', 'sqlite3', 'openssl-native', 'expat-native', 'ncurses-native', 'util-linux-libuuid-native', 'util-linux-native', 'zlib-native', 'autoconf-native', 'automake-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'patch-native', 'perl-native', 'pkgconf-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-jinja2-native', 'python3-markupsafe-native', 'python3-packaging-nat
 ive', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'shadow-native', 'unzip-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libbsd-native', 'libcap-ng-native', 'libcap-native', 'libffi-native', 'libmd-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_sitefiles
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_sitefiles finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing ACLOCAL="aclocal --aclocal-path=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/recipe-sysroot/usr/share/aclocal/" autoreconf -Wcross --verbose --install --force --exclude=autopoint
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not running autopoint: --exclude autopoint was given
| autoreconf: running: aclocal --aclocal-path=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/recipe-sysroot/usr/share/aclocal/ --force -I aclocal
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in '.'.
| libtoolize: copying file './ltmain.sh'
| libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'aclocal'.
| libtoolize: copying file 'aclocal/libtool.m4'
| libtoolize: copying file 'aclocal/ltoptions.m4'
| libtoolize: copying file 'aclocal/ltsugar.m4'
| libtoolize: copying file 'aclocal/ltversion.m4'
| libtoolize: copying file 'aclocal/lt~obsolete.m4'
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: configure.ac: no need to run autopoint (confirmed)
| autoreconf: running: aclocal --aclocal-path=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/recipe-sysroot/usr/share/aclocal/ --force -I aclocal
| autoreconf: running: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/recipe-sysroot-native/usr/bin/autoconf --force
| configure.ac:294: warning: cannot check for file existence when cross compiling
| ../sources/autoconf-2.73/lib/autoconf/general.m4:3066: AC_CHECK_FILE is expanded from...
| ../sources/autoconf-2.73/lib/m4sugar/m4sh.m4:696: AS_IF is expanded from...
| aclocal/libtirpc.m4:54: AC_LIBTIRPC_OLD is expanded from...
| aclocal.m4:168: PKG_CHECK_MODULES is expanded from...
| ../sources/autoconf-2.73/lib/m4sugar/m4sh.m4:696: AS_IF is expanded from...
| aclocal/libtirpc.m4:3: AC_LIBTIRPC is expanded from...
| configure.ac:294: the top level
| autoreconf: running: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/recipe-sysroot-native/usr/bin/autoheader --force
| autoreconf: running: automake --add-missing --copy --force-missing
| configure.ac:11: installing './compile'
| configure.ac:7: installing './missing'
| support/export/Makefile.am: installing './depcomp'
| autoreconf: './config.sub' is updated
| autoreconf: './config.guess' is updated
| autoreconf: configure.ac: not running make: --make not given
| autoreconf: Leaving directory '.'
| NOTE: Running ./configure  --build=x86_64-linux 		  --host=x86_64-poky-linux 		  --target=x86_64-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking --with-statduser=rpcuser                 --enable-mountconfig                 --enable-libmount-mount                 --enable-uuid                 --with-statdpath=/var/lib/nfs/statd                 --with-pluginpath=/usr/lib/libnfsidmap                 --with-rpcgen=/srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/rpcgen                 --disable-static  --disable-blkmapd --disable-gss --disable-svcgss --enable-ipv6 --disable-nfsdctl --disable-nfsv4 --di
 sable-nfsdcltrack --with-systemd=/usr/lib/systemd/system
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/site/endian-little
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/site/common-linux
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/site/common-glibc
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/site/x86_64-linux
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/site/common
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-poky-linux-gnu
| checking for a BSD-compatible install... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c
| checking whether sleep supports fractional seconds... yes
| checking filesystem timestamp resolution... 0.01
| checking whether build environment is sane... yes
| checking for x86_64-poky-linux-strip... x86_64-poky-linux-strip
| checking for a race-free mkdir -p... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking xargs -n works... yes
| checking whether UID '6000' is supported by ustar format... yes
| checking whether GID '6000' is supported by ustar format... yes
| checking how to create a ustar tar archive... gnutar
| checking whether to enable maintainer-specific portions of Makefiles... no
| checking whether make supports the include directive... yes (GNU style)
| checking for x86_64-poky-linux-gcc... x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/recipe-sysroot accepts -g... yes
| checking for x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/recipe-sysroot option to enable C23 features... none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/recipe-sysroot understands -c and -o together... yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/recipe-sysroot... none
| checking for stdio.h... yes
| checking for stdlib.h... yes
| checking for string.h... yes
| checking for inttypes.h... yes
| checking for stdint.h... yes
| checking for strings.h... yes
| checking for sys/stat.h... yes
| checking for sys/types.h... yes
| checking for unistd.h... yes
| checking for wchar.h... yes
| checking for minix/config.h... no
| checking for vfork.h... no
| checking for sys/select.h... yes
| checking for sys/socket.h... yes
| checking whether it is safe to define __EXTENSIONS__... yes
| checking whether _XOPEN_SOURCE should be defined... no
| checking for x86_64-poky-linux-pkg-config... no
| checking for pkg-config... /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/recipe-sysroot-native/usr/bin/pkg-config
| configure: WARNING: using cross tools not prefixed with host triplet
| checking pkg-config is at least version 0.9.0... yes
| checking for mount... yes
| checking for libnl-3.0 >= 3.1... no
| configure: error: Package requirements (libnl-3.0 >= 3.1) were not met:
| 
| Package 'libnl-3.0' not found
| 
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
| 
| Alternatively, you may set the environment variables LIBNL3_CFLAGS
| and LIBNL3_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
| NOTE: The following config.log files may provide further information.
| NOTE: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/sources/nfs-utils-2.9.1/config.log
| ERROR: configure failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/temp/run.do_configure.3474579:284 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/temp/run.do_configure.3474579, line 284
| 	#2: oe_runconf, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/temp/run.do_configure.3474579, line 260
| 	#3: autotools_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/temp/run.do_configure.3474579, line 233
| 	#4: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/temp/run.do_configure.3474579, line 154
| 	#5: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/temp/run.do_configure.3474579, line 288
NOTE: recipe nfs-utils-2.9.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2652 tasks of which 2642 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260501065238.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260501065238.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/temp/log.do_configure.3474579
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: nfs-utils-2.9.1-r0 do_configure: configure failed
ERROR: nfs-utils-2.9.1-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/temp/run.do_configure.3474579' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/nfs-utils/2.9.1/temp/log.do_configure.3474579
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb:do_configure) failed with exit code '1'

--===============5110575816921294665==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-nfs-utils-upgrade-2.8.7-2.9.1.patch"

RnJvbSBlZWM5ZWE1YWZhNzc0MTdkNTZhZTA2YzYwZTBhY2ZiN2E1N2ViYTJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwNjo1Mjo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG5m
cy11dGlsczogdXBncmFkZSAyLjguNyAtPiAyLjkuMQoKLS0tCiAuLi4vbmZzLXV0aWxzLzAwMDQt
VXNlLW5vZ3JvdXAtZm9yLW5vYm9keS1ncm91cC5wYXRjaCAgICAgICB8IDYgKysrLS0tCiAuLi4v
bmZzLXV0aWxzLzAwMDUtZmluZC1PRS1wcm92aWRlZC1LZXJiZXJvcy5wYXRjaCAgICAgICAgICB8
IDQgKystLQogLi4uL25mcy11dGlscy97bmZzLXV0aWxzXzIuOC43LmJiID0+IG5mcy11dGlsc18y
LjkuMS5iYn0gICAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBk
ZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy97
bmZzLXV0aWxzXzIuOC43LmJiID0+IG5mcy11dGlsc18yLjkuMS5iYn0gKDk4JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRpbHMvMDAwNC1V
c2Utbm9ncm91cC1mb3Itbm9ib2R5LWdyb3VwLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzLzAwMDQtVXNlLW5vZ3JvdXAtZm9yLW5vYm9keS1ncm91
cC5wYXRjaAppbmRleCBiYmY0NGQ1OTc3Li5iYmI3ZWU0YmZkIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRpbHMvMDAwNC1Vc2Utbm9ncm91cC1m
b3Itbm9ib2R5LWdyb3VwLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZz
LXV0aWxzL25mcy11dGlscy8wMDA0LVVzZS1ub2dyb3VwLWZvci1ub2JvZHktZ3JvdXAucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDAwMTkxM2M1ZWIwYWFkOTMzYTkzZWU5NjYyNTI5MDVjZDQ2
ZDc3NmIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDI4Y2ZkOGNkNmE2MzE0NjNiYzJl
NzcwZTViNWE1Nzk2Y2Q3ODA3MDggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBEYW5p
ZWwgTWNHcmVnb3IgPGRhbmllbC5tY2dyZWdvckB2ZWNpbWEuY29tPgogRGF0ZTogVHVlLCA2IEp1
biAyMDIzIDE2OjA3OjUzIC0wNjAwCiBTdWJqZWN0OiBbUEFUQ0hdIFVzZSAibm9ncm91cCIgZm9y
IG5vYm9keSBncm91cApAQCAtMTEsNyArMTEsNyBAQCBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgTWNH
cmVnb3IgPGRhbmllbC5tY2dyZWdvckB2ZWNpbWEuY29tPgogIDIgZmlsZXMgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9uZnNp
ZG1hcC9pZG1hcGQuY29uZiBiL3N1cHBvcnQvbmZzaWRtYXAvaWRtYXBkLmNvbmYKLWluZGV4IDJh
MmY3OWExLi5lNmYzNzI0ZiAxMDA2NDQKK2luZGV4IDJhMmY3OWEuLmU2ZjM3MjQgMTAwNjQ0CiAt
LS0gYS9zdXBwb3J0L25mc2lkbWFwL2lkbWFwZC5jb25mCiArKysgYi9zdXBwb3J0L25mc2lkbWFw
L2lkbWFwZC5jb25mCiBAQCAtNDEsNyArNDEsNyBAQApAQCAtMjQsNyArMjQsNyBAQCBpbmRleCAy
YTJmNzlhMS4uZTZmMzcyNGYgMTAwNjQ0CiAgW1RyYW5zbGF0aW9uXQogIAogZGlmZiAtLWdpdCBh
L3V0aWxzL2lkbWFwZC9pZG1hcGQuYyBiL3V0aWxzL2lkbWFwZC9pZG1hcGQuYwotaW5kZXggY2Q5
YTk2NWYuLjNiZTgwNWU5IDEwMDY0NAoraW5kZXggNTIzMWY1Ni4uZTFhYThhNSAxMDA2NDQKIC0t
LSBhL3V0aWxzL2lkbWFwZC9pZG1hcGQuYwogKysrIGIvdXRpbHMvaWRtYXBkL2lkbWFwZC5jCiBA
QCAtODksNyArODksNyBAQApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9u
ZnMtdXRpbHMvbmZzLXV0aWxzLzAwMDUtZmluZC1PRS1wcm92aWRlZC1LZXJiZXJvcy5wYXRjaCBi
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGlscy8wMDA1LWZpbmQt
T0UtcHJvdmlkZWQtS2VyYmVyb3MucGF0Y2gKaW5kZXggMzI0MWU4ZTg1OS4uMGJmM2UyYTRiYSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxz
LzAwMDUtZmluZC1PRS1wcm92aWRlZC1LZXJiZXJvcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRpbHMvMDAwNS1maW5kLU9FLXByb3ZpZGVkLUtl
cmJlcm9zLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhMmFmMjY2ZjAxMzcyMmE2NGM1ZDA0
ZTBmZTA5N2NkNzExMzkzYTUzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiMGExNGFk
N2I4NWE0Mzc0YTlkZTY4ODc2ZDAyY2NjMGU5YWQ3ODAwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogRGFuaWVsIE1jR3JlZ29yIDxkYW5pZWwubWNncmVnb3JAdmVjaW1hLmNvbT4KIERh
dGU6IFdlZCwgOCBOb3YgMjAyMyAxNjoyNDoyMCAtMDYwMAogU3ViamVjdDogW1BBVENIXSBmaW5k
IE9FIHByb3ZpZGVkIEtlcmJlcm9zCkBAIC0xMCw3ICsxMCw3IEBAIFNpZ25lZC1vZmYtYnk6IERh
bmllbCBNY0dyZWdvciA8ZGFuaWVsLm1jZ3JlZ29yQHZlY2ltYS5jb20+CiAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2FjbG9j
YWwva2VyYmVyb3M1Lm00IGIvYWNsb2NhbC9rZXJiZXJvczUubTQKLWluZGV4IGY5NmYwZmQ0Li5h
ZDg1ZmRmMiAxMDA2NDQKK2luZGV4IGY5NmYwZmQuLmFkODVmZGYgMTAwNjQ0CiAtLS0gYS9hY2xv
Y2FsL2tlcmJlcm9zNS5tNAogKysrIGIvYWNsb2NhbC9rZXJiZXJvczUubTQKIEBAIC0yMiw4ICsy
Miw4IEBAIEFDX0RFRlVOKFtBQ19LRVJCRVJPU19WNV0sWwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzXzIuOC43LmJiIGIvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzXzIuOS4xLmJiCnNpbWlsYXJpdHkg
aW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxz
L25mcy11dGlsc18yLjguNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9u
ZnMtdXRpbHMvbmZzLXV0aWxzXzIuOS4xLmJiCmluZGV4IDc2OTNhODg2ODIuLjJhM2YxZThmNWEg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGls
c18yLjguNy5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMt
dXRpbHNfMi45LjEuYmIKQEAgLTI1LDcgKzI1LDcgQEAgU1JDX1VSSSA9ICIke0tFUk5FTE9SR19N
SVJST1J9L2xpbnV4L3V0aWxzL25mcy11dGlscy8ke1BWfS9uZnMtdXRpbHMtJHtQVn0udGFyLngK
ICAgICAgICAgICAgZmlsZTovLzAwMDUtZmluZC1PRS1wcm92aWRlZC1LZXJiZXJvcy5wYXRjaCBc
CiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU5ZDBmMWUxN2IxOGVmYWE2
MGVhM2NjZjg5YTljYWQzMjE3ZjhkM2IyM2MxOGQyZmUzNGIyNWM4OTY5ZDYwYWUiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMzAyODQ2MzQzYmY1MDlmOGY4ODRjMjNiZGJkMGZlODUzYjdmN2NiYjY1
NzIwNjBhOTA4MjI3OWQxM2IyMWEyYyIKIAogIyBPbmx5IGtlcm5lbC1tb2R1bGUtbmZzZCBpcyBy
ZXF1aXJlZCBoZXJlIChidXQgY2FuIGJlIGJ1aWx0LWluKSAgLSB0aGUgbmZzZCBtb2R1bGUgd2ls
bAogIyBwdWxsIGluIHRoZSByZW1haW5kZXIgb2YgdGhlIGRlcGVuZGVuY2llcy4KLS0gCjIuNDcu
MQoK

--===============5110575816921294665==--

