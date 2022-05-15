Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A49DC4707E
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 17:15:22 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.18725.1652634913533646688
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 10:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jjM977Uo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 01010180c8b788d2-c704ea8f-e713-4e10-99d2-9ebfc34c3d68-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1652634913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hOlae2AiOgx+dyCHJYhMopRw4zgTp9TajwTVdR6Ire4=;
	b=jjM977UoyAaGThQhZOrpt/gac21ljN+4LFpAxx8WOK9WUdgCXcrZD7fKbycwLw++
	NOD9u0YO3EATrMDNu3AubmWTclkRFrfceuDp85MfOLZF7ubgwKtK/vLLGb45cYk8bAo
	tOGb0NJ+TOQWnYci1tqcAkB2OzLkXI2meXU+jlO8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1652634913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hOlae2AiOgx+dyCHJYhMopRw4zgTp9TajwTVdR6Ire4=;
	b=L8/YaSiYWwrSsDOIqtE4FvGjraZ/A3bqgXINr8r5Gke5G9oyoK7fCNbLf1sZIGyr
	6X24B5WBqFIIkq+nRZIVj23h8mVw22Ef3Q6U3X8P2/uJQ3ulishaiu4ZAeDhQ8c0DNL
	jT3Hi+T4aw9LqWhSnA1Y1Xg4F7pfpBoHAFXq5VoU=
Content-Type: multipart/mixed; boundary="===============6467499333270446617=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iptables: upgrading to 1.8.8 FAILED
Message-ID: 
 <01010180c8b788d2-c704ea8f-e713-4e10-99d2-9ebfc34c3d68-000000@us-west-2.amazonses.com>
Date: Sun, 15 May 2022 17:15:12 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 17:15:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165621

--===============6467499333270446617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *iptables* to *1.8.8* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-iptables-upgrade-1.8.7-1.8.8.patch
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
--===============6467499333270446617==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-iptables-upgrade-1.8.7-1.8.8.patch"

From 5adcf0544254ba6352d25605a3dedb64963a7de0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 May 2022 09:28:10 +0000
Subject: [PATCH] iptables: upgrade 1.8.7 -> 1.8.8

---
 .../iptables/{iptables_1.8.7.bb => iptables_1.8.8.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/iptables/{iptables_1.8.7.bb => iptables_1.8.8.bb} (98%)

diff --git a/meta/recipes-extended/iptables/iptables_1.8.7.bb b/meta/recipes-extended/iptables/iptables_1.8.8.bb
similarity index 98%
rename from meta/recipes-extended/iptables/iptables_1.8.7.bb
rename to meta/recipes-extended/iptables/iptables_1.8.8.bb
index 3b41882841..0151ad89f1 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.7.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.8.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://ip6tables.service \
            file://ip6tables.rules \
            "
-SRC_URI[sha256sum] = "c109c96bb04998cd44156622d36f8e04b140701ec60531a10668cfdff5e8d8f0"
+SRC_URI[sha256sum] = "71c75889dc710676631553eb1511da0177bbaaf1b551265b912d236c3f51859f"
 
 SYSTEMD_SERVICE:${PN} = "\
     iptables.service \
-- 
2.31.1


--===============6467499333270446617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1642 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (883 cached, 1 parsed). 1642 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-2adc206659f1cd26995cdc06f9137c5cde39fa97"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2adc206659f1cd26995cdc06f9137c5cde39fa97"
workspace            = "master:fea9e46d39ef43967aead86fa537bca449290253"

Initialising tasks...done.
Sstate summary: Wanted 87 Local 80 Mirrors 0 Missed 7 Current 188 (91% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 848 of 1068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_fetch)
NOTE: recipe iptables-1.8.8-r0: task do_fetch: Started
NOTE: recipe iptables-1.8.8-r0: task do_fetch: Succeeded
NOTE: Running task 1055 of 1068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_unpack)
NOTE: Running task 1056 of 1068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe iptables-1.8.8-r0: task do_unpack: Started
NOTE: recipe iptables-1.8.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iptables-1.8.8-r0: task do_unpack: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1057 of 1068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_patch)
NOTE: recipe iptables-1.8.8-r0: task do_patch: Started
NOTE: recipe iptables-1.8.8-r0: task do_patch: Succeeded
NOTE: Running task 1058 of 1068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1059 of 1068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_populate_lic)
NOTE: recipe iptables-1.8.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iptables-1.8.8-r0: task do_populate_lic: Started
NOTE: recipe iptables-1.8.8-r0: task do_populate_lic: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1060 of 1068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_configure)
NOTE: recipe iptables-1.8.8-r0: task do_configure: Started
NOTE: recipe iptables-1.8.8-r0: task do_configure: Succeeded
NOTE: Running task 1061 of 1068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_compile)
NOTE: recipe iptables-1.8.8-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-glibc', 'i686-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| NOTE: make -j 56
| make  all-recursive
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/build'
| Making all in libiptc
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/build/libiptc'
| /bin/bash ../libtool  --tag=CC   --mode=compile i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../iptables-1.8.8/libiptc -I..  -D_LARGEFILE_SOURCE=1 -D_LARGE_FILES -D_FILE_OFFSET_BITS=64 -D_REENTRANT 	-DXTABLES_LIBDIR=\"/usr/lib/xtables\" -DXTABLES_INTERNAL -I../include -I../../iptables-1.8.8/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include/uapi -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include/uapi -I/ho
 me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include  -Wall -Waggregate-return -Wmissing-declarations 	-Wmissing-prototypes -Wredundant-decls -Wshadow -Wstrict-prototypes 	-Wlogical-op 	-Winline -pipe -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot-native=  -c -o libip4tc.lo ../../iptables-1.8.8
 /libiptc/libip4tc.c
| /bin/bash ../libtool  --tag=CC   --mode=compile i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../iptables-1.8.8/libiptc -I..  -D_LARGEFILE_SOURCE=1 -D_LARGE_FILES -D_FILE_OFFSET_BITS=64 -D_REENTRANT 	-DXTABLES_LIBDIR=\"/usr/lib/xtables\" -DXTABLES_INTERNAL -I../include -I../../iptables-1.8.8/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include/uapi -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include/uapi -I/ho
 me/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include  -Wall -Waggregate-return -Wmissing-declarations 	-Wmissing-prototypes -Wredundant-decls -Wshadow -Wstrict-prototypes 	-Wlogical-op 	-Winline -pipe -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot-native=  -c -o libip6tc.lo ../../iptables-1.8.8
 /libiptc/libip6tc.c
| libtool: compile:  i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../iptables-1.8.8/libiptc -I.. -D_LARGEFILE_SOURCE=1 -D_LARGE_FILES -D_FILE_OFFSET_BITS=64 -D_REENTRANT -DXTABLES_LIBDIR=\"/usr/lib/xtables\" -DXTABLES_INTERNAL -I../include -I../../iptables-1.8.8/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include/uapi -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include/uapi -I/home/pokybuild/yocto-worker/auh/bui
 ld/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include -Wall -Waggregate-return -Wmissing-declarations -Wmissing-prototypes -Wredundant-decls -Wshadow -Wstrict-prototypes -Wlogical-op -Winline -pipe -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot-native= -c ../../iptables-1.8.8/libiptc/libip4tc.c  -fPIC -DPIC -o .libs/libip4tc.o
| libtool: compile:  i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../iptables-1.8.8/libiptc -I.. -D_LARGEFILE_SOURCE=1 -D_LARGE_FILES -D_FILE_OFFSET_BITS=64 -D_REENTRANT -DXTABLES_LIBDIR=\"/usr/lib/xtables\" -DXTABLES_INTERNAL -I../include -I../../iptables-1.8.8/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include/uapi -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include/uapi -I/home/pokybuild/yocto-worker/auh/bui
 ld/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include -Wall -Waggregate-return -Wmissing-declarations -Wmissing-prototypes -Wredundant-decls -Wshadow -Wstrict-prototypes -Wlogical-op -Winline -pipe -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot-native= -c ../../iptables-1.8.8/libiptc/libip6tc.c  -fPIC -DPIC -o .libs/libip6tc.o
| /bin/bash ../libtool  --tag=CC   --mode=link i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot -Wall -Waggregate-return -Wmissing-declarations 	-Wmissing-prototypes -Wredundant-decls -Wshadow -Wstrict-prototypes 	-Wlogical-op 	-Winline -pipe -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recip
 e-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot-native=  -version-info 2:0:0 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -o libip6tc.la -rpath /usr/lib libip6tc.lo
| /bin/bash ../libtool  --tag=CC   --mode=link i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot -Wall -Waggregate-return -Wmissing-declarations 	-Wmissing-prototypes -Wredundant-decls -Wshadow -Wstrict-prototypes 	-Wlogical-op 	-Winline -pipe -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recip
 e-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot-native=  -version-info 2:0:0 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot-native=  -Wl,-z,relro,-z,now -o libip4tc.la -rpath /usr/lib libip4tc.lo
| libtool: link: i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot -shared  -fPIC -DPIC  .libs/libip6tc.o    -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot -O2 -g -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot= 
 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot-native= -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot-native= -Wl,-z -Wl,relro -Wl,-z -Wl,now   -Wl,-soname -Wl,libip6tc.so.2 -o .libs/libip6tc.so.2.0.0
| libtool: link: i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot -shared  -fPIC -DPIC  .libs/libip4tc.o    -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot -O2 -g -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot= 
 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot-native= -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot-native= -Wl,-z -Wl,relro -Wl,-z -Wl,now   -Wl,-soname -Wl,libip4tc.so.2 -o .libs/libip4tc.so.2.0.0
| libtool: link: (cd ".libs" && rm -f "libip6tc.so.2" && ln -s "libip6tc.so.2.0.0" "libip6tc.so.2")
| libtool: link: (cd ".libs" && rm -f "libip4tc.so.2" && ln -s "libip4tc.so.2.0.0" "libip4tc.so.2")
| libtool: link: (cd ".libs" && rm -f "libip4tc.so" && ln -s "libip4tc.so.2.0.0" "libip4tc.so")
| libtool: link: (cd ".libs" && rm -f "libip6tc.so" && ln -s "libip6tc.so.2.0.0" "libip6tc.so")
| libtool: link: ( cd ".libs" && rm -f "libip4tc.la" && ln -s "../libip4tc.la" "libip4tc.la" )
| libtool: link: ( cd ".libs" && rm -f "libip6tc.la" && ln -s "../libip6tc.la" "libip6tc.la" )
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/build/libiptc'
| Making all in libxtables
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/build/libxtables'
| /bin/bash ../libtool  --tag=CC   --mode=compile i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../iptables-1.8.8/libxtables -I..  -D_LARGEFILE_SOURCE=1 -D_LARGE_FILES -D_FILE_OFFSET_BITS=64 -D_REENTRANT 	-DXTABLES_LIBDIR=\"/usr/lib/xtables\" -DXTABLES_INTERNAL -I../include -I../../iptables-1.8.8/include -I../../iptables-1.8.8/iptables -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include/uapi -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sys
 root/usr/include/include/uapi -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include  -Wall -Waggregate-return -Wmissing-declarations 	-Wmissing-prototypes -Wredundant-decls -Wshadow -Wstrict-prototypes 	-Wlogical-op 	-Winline -pipe -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot-native=  -c 
 -o libxtables_la-xtables.lo `test -f 'xtables.c' || echo '../../iptables-1.8.8/libxtables/'`xtables.c
| /bin/bash ../libtool  --tag=CC   --mode=compile i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../iptables-1.8.8/libxtables -I..  -D_LARGEFILE_SOURCE=1 -D_LARGE_FILES -D_FILE_OFFSET_BITS=64 -D_REENTRANT 	-DXTABLES_LIBDIR=\"/usr/lib/xtables\" -DXTABLES_INTERNAL -I../include -I../../iptables-1.8.8/include -I../../iptables-1.8.8/iptables -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include/uapi -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sys
 root/usr/include/include/uapi -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include  -Wall -Waggregate-return -Wmissing-declarations 	-Wmissing-prototypes -Wredundant-decls -Wshadow -Wstrict-prototypes 	-Wlogical-op 	-Winline -pipe -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot-native=  -c 
 -o libxtables_la-xtoptions.lo `test -f 'xtoptions.c' || echo '../../iptables-1.8.8/libxtables/'`xtoptions.c
| /bin/bash ../libtool  --tag=CC   --mode=compile i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../iptables-1.8.8/libxtables -I..  -D_LARGEFILE_SOURCE=1 -D_LARGE_FILES -D_FILE_OFFSET_BITS=64 -D_REENTRANT 	-DXTABLES_LIBDIR=\"/usr/lib/xtables\" -DXTABLES_INTERNAL -I../include -I../../iptables-1.8.8/include -I../../iptables-1.8.8/iptables -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include/uapi -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sys
 root/usr/include/include/uapi -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include  -Wall -Waggregate-return -Wmissing-declarations 	-Wmissing-prototypes -Wredundant-decls -Wshadow -Wstrict-prototypes 	-Wlogical-op 	-Winline -pipe -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot-native=  -c 
 -o libxtables_la-getethertype.lo `test -f 'getethertype.c' || echo '../../iptables-1.8.8/libxtables/'`getethertype.c
| libtool: compile:  i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../iptables-1.8.8/libxtables -I.. -D_LARGEFILE_SOURCE=1 -D_LARGE_FILES -D_FILE_OFFSET_BITS=64 -D_REENTRANT -DXTABLES_LIBDIR=\"/usr/lib/xtables\" -DXTABLES_INTERNAL -I../include -I../../iptables-1.8.8/include -I../../iptables-1.8.8/iptables -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include/uapi -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include/uapi -I/
 home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include -Wall -Waggregate-return -Wmissing-declarations -Wmissing-prototypes -Wredundant-decls -Wshadow -Wstrict-prototypes -Wlogical-op -Winline -pipe -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot-native= -c ../../iptables-1.8.8/libxtables/xtables.c  -fPIC -DPIC -o .libs/libxtables_la-xtables.o
| libtool: compile:  i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../iptables-1.8.8/libxtables -I.. -D_LARGEFILE_SOURCE=1 -D_LARGE_FILES -D_FILE_OFFSET_BITS=64 -D_REENTRANT -DXTABLES_LIBDIR=\"/usr/lib/xtables\" -DXTABLES_INTERNAL -I../include -I../../iptables-1.8.8/include -I../../iptables-1.8.8/iptables -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include/uapi -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include/uapi -I/
 home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include -Wall -Waggregate-return -Wmissing-declarations -Wmissing-prototypes -Wredundant-decls -Wshadow -Wstrict-prototypes -Wlogical-op -Winline -pipe -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot-native= -c ../../iptables-1.8.8/libxtables/getethertype.c  -fPIC -DPIC -o .libs/libxtables_la-getethertype.o
| libtool: compile:  i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../iptables-1.8.8/libxtables -I.. -D_LARGEFILE_SOURCE=1 -D_LARGE_FILES -D_FILE_OFFSET_BITS=64 -D_REENTRANT -DXTABLES_LIBDIR=\"/usr/lib/xtables\" -DXTABLES_INTERNAL -I../include -I../../iptables-1.8.8/include -I../../iptables-1.8.8/iptables -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include/uapi -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include/uapi -I/
 home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot/usr/include/include -Wall -Waggregate-return -Wmissing-declarations -Wmissing-prototypes -Wredundant-decls -Wshadow -Wstrict-prototypes -Wlogical-op -Winline -pipe -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0=/usr/src/debug/iptables/1.8.8-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/recipe-sysroot-native= -c ../../iptables-1.8.8/libxtables/xtoptions.c  -fPIC -DPIC -o .libs/libxtables_la-xtoptions.o
| ../../iptables-1.8.8/libxtables/xtables.c:52:10: fatal error: libiptc/linux_list.h: No such file or directory
|    52 | #include <libiptc/linux_list.h>
|       |          ^~~~~~~~~~~~~~~~~~~~~~
| compilation terminated.
| make[2]: *** [Makefile:484: libxtables_la-xtables.lo] Error 1
| make[2]: *** Waiting for unfinished jobs....
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/build/libxtables'
| make[1]: *** [Makefile:443: all-recursive] Error 1
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/build'
| make: *** [Makefile:373: all] Error 2
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/temp/run.do_compile.2816528:183 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/temp/run.do_compile.2816528, line 183
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/temp/run.do_compile.2816528, line 167
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/temp/run.do_compile.2816528, line 162
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/temp/run.do_compile.2816528, line 157
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/temp/run.do_compile.2816528, line 152
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/temp/run.do_compile.2816528, line 196
NOTE: recipe iptables-1.8.8-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1061 tasks of which 1053 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: iptables-1.8.8-r0 do_compile: oe_runmake failed
ERROR: iptables-1.8.8-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/temp/run.do_compile.2816528', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/iptables/1.8.8-r0/temp/log.do_compile.2816528
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_compile) failed with exit code '1'

--===============6467499333270446617==--

