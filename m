Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C87ABC19445
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:15 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.8654.1698848703910497684
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=as+LCiuZ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DCFnXNks;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.30, mailfrom: 0101018b8b4608ef-fb49b269-57d6-493a-9ed3-9de097512a75-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SYj8PD3clgVgpY+54eCvc8WlRSsdEZP5wpse+n+TWyg=;
	b=as+LCiuZzuOnUCtJ5rCNo7UknMkAZC76FMVwmXGbpSjoxj1sOAtEX91IDX0fz62s
	2wI11tknxHDWWAqJ2aDVzhiITE89C7e42UAUDZYBvxFzvH7ko4spTZVHKE34lpSMYrw
	IlHs7qMy5W/UiUEjQgUpEYE+mawan/96QxUqp1ko=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SYj8PD3clgVgpY+54eCvc8WlRSsdEZP5wpse+n+TWyg=;
	b=DCFnXNks2HkPszktbvNHBCFKwgvRka42lPftgckSYMKRNRnITV44dXTrJWUWEaIu
	rN80fovZXxLe02Gfykc/Zb9FhNHdxxVgjL0/AfbZPQN04/4n0BhiKsarVNmjyl0ZDqx
	rqxsojTH/NhyAOygsefJvMpfxQtfqnXcTScUByAk=
Content-Type: multipart/mixed; boundary="===============5798229026847313466=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cups: upgrading to 2.4.7 FAILED
Message-ID: <0101018b8b4608ef-fb49b269-57d6-493a-9ed3-9de097512a75-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189986

--===============5798229026847313466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cups* to *2.4.7* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-cups-upgrade-2.4.6-2.4.7.patch
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
From 1c7c79f6fa733dbf0c46284d8eded2276420d8a5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 11:10:55 +0000
Subject: [PATCH] cups: upgrade 2.4.6 -> 2.4.7

---
 meta/recipes-extended/cups/cups.inc           |  1 -
 .../cups/cups/CVE-2023-4504.patch             | 42 -------------------
 .../cups/{cups_2.4.6.bb => cups_2.4.7.bb}     |  2 +-
 3 files changed, 1 insertion(+), 44 deletions(-)
 delete mode 100644 meta/recipes-extended/cups/cups/CVE-2023-4504.patch
 rename meta/recipes-extended/cups/{cups_2.4.6.bb => cups_2.4.7.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index fa32c38549..36feaddcf8 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -15,7 +15,6 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://0004-cups-fix-multilib-install-file-conflicts.patch \
            file://volatiles.99_cups \
            file://cups-volatiles.conf \
-           file://CVE-2023-4504.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2023-4504.patch b/meta/recipes-extended/cups/cups/CVE-2023-4504.patch
deleted file mode 100644
index e52e43a209..0000000000
--- a/meta/recipes-extended/cups/cups/CVE-2023-4504.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-CVE: CVE-2023-4504
-Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/2431caddb7e6a87f04ac90b5c6366ad268b6ff31 ]
-Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
-
-From 2431caddb7e6a87f04ac90b5c6366ad268b6ff31 Mon Sep 17 00:00:00 2001
-From: Zdenek Dohnal <zdohnal@redhat.com>
-Date: Wed, 20 Sep 2023 14:45:17 +0200
-Subject: [PATCH] raster-interpret.c: Fix CVE-2023-4504
-
-We didn't check for end of buffer if it looks there is an escaped
-character - check for NULL terminator there and if found, return NULL
-as return value and in `ptr`, because a lone backslash is not
-a valid PostScript character.
----
- cups/raster-interpret.c | 14 +++++++++++++-
- 1 files changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/cups/raster-interpret.c b/cups/raster-interpret.c
-index 6fcf731b5..b8655c8c6 100644
---- a/cups/raster-interpret.c
-+++ b/cups/raster-interpret.c
-@@ -1116,7 +1116,19 @@ scan_ps(_cups_ps_stack_t *st,		/* I  - Stack */
- 
- 	    cur ++;
- 
--            if (*cur == 'b')
-+	   /*
-+	    * Return NULL if we reached NULL terminator, a lone backslash
-+	    * is not a valid character in PostScript.
-+	    */
-+
-+	    if (!*cur)
-+	    {
-+	      *ptr = NULL;
-+
-+	      return (NULL);
-+	    }
-+
-+	    if (*cur == 'b')
- 	      *valptr++ = '\b';
- 	    else if (*cur == 'f')
- 	      *valptr++ = '\f';
diff --git a/meta/recipes-extended/cups/cups_2.4.6.bb b/meta/recipes-extended/cups/cups_2.4.7.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.6.bb
rename to meta/recipes-extended/cups/cups_2.4.7.bb
index 58029fdbd4..f4b0282e4c 100644
--- a/meta/recipes-extended/cups/cups_2.4.6.bb
+++ b/meta/recipes-extended/cups/cups_2.4.7.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "58e970cf1955e1cc87d0847c32526d9c2ccee335e5f0e3882b283138ba0e7262"
+SRC_URI[sha256sum] = "dd54228dd903526428ce7e37961afaed230ad310788141da75cebaa08362cf6c"
-- 
2.39.2


--===============5798229026847313466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1843 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1842 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-823391706a8277465533d352e1ae8c0b96bfe006"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:823391706a8277465533d352e1ae8c0b96bfe006"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 97 Local 87 Mirrors 0 Missed 10 Current 667 (89% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1901 of 2109 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cups/cups_2.4.7.bb:do_recipe_qa)
NOTE: recipe cups-2.4.7-r0: task do_recipe_qa: Started
NOTE: recipe cups-2.4.7-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2092 of 2109 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cups/cups_2.4.7.bb:do_fetch)
NOTE: recipe cups-2.4.7-r0: task do_fetch: Started
NOTE: recipe cups-2.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 2093 of 2109 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cups/cups_2.4.7.bb:do_unpack)
NOTE: Running task 2094 of 2109 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cups/cups_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe cups-2.4.7-r0: task do_unpack: Started
NOTE: recipe cups-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cups-2.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 2095 of 2109 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cups/cups_2.4.7.bb:do_patch)
NOTE: Running task 2096 of 2109 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cups/cups_2.4.7.bb:do_collect_spdx_deps)
NOTE: recipe cups-2.4.7-r0: task do_patch: Started
NOTE: recipe cups-2.4.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe cups-2.4.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cups-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cups-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 2097 of 2109 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cups/cups_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2098 of 2109 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cups/cups_2.4.7.bb:do_populate_lic)
NOTE: recipe cups-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cups-2.4.7-r0: task do_populate_lic: Started
NOTE: recipe cups-2.4.7-r0: task do_populate_lic: Succeeded
NOTE: recipe cups-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2099 of 2109 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cups/cups_2.4.7.bb:do_configure)
NOTE: recipe cups-2.4.7-r0: task do_configure: Started
NOTE: recipe cups-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 2100 of 2109 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cups/cups_2.4.7.bb:do_compile)
NOTE: recipe cups-2.4.7-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| NOTE: make -j 56
| Using ARCHFLAGS=
| Using ALL_CFLAGS=-I.. -D_CUPS_SOURCE -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7=/usr/src/debug/cups/2.4.7-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7=/usr/src/debug/cups/2.4.7-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7=/usr/src/debug/cups/2.4.7-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7=/usr/src/debug/cups/2.4.7-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yo
 cto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/libusb-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/lib/dbus-1.0/include -DDBUS_API_SUBJECT_TO_CHANGE -D_FORTIFY_SOURCE=3 -D_REENTRANT  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_THREAD_SAFE -D_REENTRANT  -Wall -Wunused
| Using ALL_CXXFLAGS=-I.. -D_CUPS_SOURCE -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7=/usr/src/debug/cups/2.4.7-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7=/usr/src/debug/cups/2.4.7-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7=/usr/src/debug/cups/2.4.7-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7=/usr/src/debug/cups/2.4.7-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/
 yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot-native=  -fvisibility-inlines-hidden -D_FORTIFY_SOURCE=3  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_THREAD_SAFE -D_REENTRANT  -Wall -Wunused
| Using CC=x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot
| Using CXX=x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot
| Using DSOFLAGS=-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7=/usr/src/debug/cups/2.4.7-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7=/usr/src/debug/cups/2.4.7-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7=/usr/src/debug/cups/2.4.7-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7=/usr/src/debug/cups/2.4.7-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/
 build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot-native=  -Wl,-z,relro,-z,now -Wl,-soname,all -shared
| Using LDFLAGS=-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7=/usr/src/debug/cups/2.4.7-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7=/usr/src/debug/cups/2.4.7-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7=/usr/src/debug/cups/2.4.7-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7=/usr/src/debug/cups/2.4.7-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/b
 uild/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot-native=  -Wl,-z,relro,-z,now
| Using LIBS= -lavahi-common -lavahi-client  -lz -lpthread -lm -lcrypt   -lz
| Making all in cups...
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7/cups'
| make[1]: warning: -j56 forced in submake: resetting jobserver mode.
| Compiling raster-interstub.c...
| Compiling raster-stubs.c...
| Compiling array.c...
| Compiling auth.c...
| Compiling debug.c...
| Compiling dest.c...
| Compiling dest-job.c...
| Compiling dest-localization.c...
| Compiling dest-options.c...
| Compiling dir.c...
| Compiling encode.c...
| Compiling file.c...
| Compiling getputfile.c...
| Compiling globals.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: note: this is the location of the previous definition
| <command-line>: note: this is the location of the previous definition
| Compiling hash.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| Compiling http.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| Compiling http-addr.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| Compiling http-addrlist.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| Compiling http-support.c...
| Compiling ipp.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| Compiling ipp-file.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| Compiling ipp-vars.c...
| Compiling ipp-support.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| Compiling langprintf.c...
| Compiling language.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| Compiling md5.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| Compiling md5passwd.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| Compiling notify.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| Compiling options.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| Compiling pwg-media.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| Compiling raster-error.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| Compiling raster-stream.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| Compiling request.c...
| Compiling snprintf.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| Compiling string.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| Compiling tempfile.c...
| Compiling thread.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| Compiling tls.c...
| Compiling transcode.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| Compiling usersys.c...
| Compiling util.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| Compiling adminutil.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| Compiling backchannel.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| Compiling backend.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| Compiling getdevices.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| Compiling getifaddrs.c...
| Compiling ppd.c...
| Compiling ppd-attr.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| Compiling ppd-cache.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| Compiling ppd-conflicts.c...
| Compiling ppd-custom.c...
| Compiling ppd-emit.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| Compiling ppd-localize.c...
| Compiling ppd-mark.c...
| Compiling ppd-page.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| dir.c: In function 'cupsDirRead':
| dir.c:391:46: warning: '%s' directive output may be truncated writing up to 255 bytes into a region of size between 0 and 1023 [-Wformat-truncation=]
|   391 |     snprintf(filename, sizeof(filename), "%s/%s", dp->directory, entry->d_name);
|       |                                              ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/stdio.h:964,
|                  from string-private.h:19,
|                  from dir.c:18:
| In function 'snprintf',
|     inlined from 'cupsDirRead' at dir.c:391:5:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/bits/stdio2.h:54:10: note: '__builtin___snprintf_chk' output between 2 and 1280 bytes into a destination of size 1024
|    54 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    55 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    56 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| Compiling ppd-util.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| Compiling raster-interpret.c...
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| Compiling sidechannel.c...
| Compiling snmp.c...
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| hash.c:16:12: fatal error: gnutls/crypto.h: No such file or directory
|    16 | #  include <gnutls/crypto.h>
|       |            ^~~~~~~~~~~~~~~~~
| compilation terminated.
| make[1]: *** [../Makedefs:271: hash.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
| getputfile.c: In function 'cupsGetFd':
| getputfile.c:194:7: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|   194 |       write(fd, buffer, (size_t)bytes);
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| <command-line>: warning: "_FORTIFY_SOURCE" redefined
| <command-line>: note: this is the location of the previous definition
| file.c: In function 'cupsFileOpen':
| file.c:1120:11: warning: ignoring return value of 'ftruncate' declared with attribute 'warn_unused_result' [-Wunused-result]
|  1120 |           ftruncate(fd, 0);
|       |           ^~~~~~~~~~~~~~~~
| ppd-page.c: In function 'ppdPageSizeLimits':
| ppd-page.c:251:40: warning: '.' directive output may be truncated writing 1 byte into a region of size between 0 and 40 [-Wformat-truncation=]
|   251 |       snprintf(spec, sizeof(spec), ".%s.%s", qualifier2->choice,
|       |                                        ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/stdio.h:964,
|                  from string-private.h:19,
|                  from ppd-page.c:17:
| In function 'snprintf',
|     inlined from 'ppdPageSizeLimits' at ppd-page.c:251:7:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/bits/stdio2.h:54:10: note: '__builtin___snprintf_chk' output between 3 and 83 bytes into a destination of size 41
|    54 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    55 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    56 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| ppd-page.c: In function 'ppdPageSizeLimits':
| ppd-page.c:260:40: warning: '.' directive output may be truncated writing 1 byte into a region of size between 0 and 40 [-Wformat-truncation=]
|   260 |       snprintf(spec, sizeof(spec), ".%s.", qualifier2->choice);
|       |                                        ^
| In function 'snprintf',
|     inlined from 'ppdPageSizeLimits' at ppd-page.c:260:7:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/bits/stdio2.h:54:10: note: '__builtin___snprintf_chk' output between 3 and 43 bytes into a destination of size 41
|    54 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    55 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    56 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| ppd-page.c: In function 'ppdPageSizeLimits':
| ppd-page.c:266:39: warning: '%s' directive output may be truncated writing up to 40 bytes into a region of size 39 [-Wformat-truncation=]
|   266 |       snprintf(spec, sizeof(spec), "..%s", qualifier3->choice);
|       |                                       ^~
| In function 'snprintf',
|     inlined from 'ppdPageSizeLimits' at ppd-page.c:266:7:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/bits/stdio2.h:54:10: note: '__builtin___snprintf_chk' output between 3 and 43 bytes into a destination of size 41
|    54 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    55 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    56 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| ppd-page.c: In function 'ppdPageSizeLimits':
| ppd-page.c:260:40: warning: '.' directive output may be truncated writing 1 byte into a region of size between 0 and 40 [-Wformat-truncation=]
|   260 |       snprintf(spec, sizeof(spec), ".%s.", qualifier2->choice);
|       |                                        ^
| In function 'snprintf',
|     inlined from 'ppdPageSizeLimits' at ppd-page.c:260:7:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/bits/stdio2.h:54:10: note: '__builtin___snprintf_chk' output between 3 and 43 bytes into a destination of size 41
|    54 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    55 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    56 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| ppd-page.c: In function 'ppdPageSizeLimits':
| ppd-page.c:309:40: warning: '.' directive output may be truncated writing 1 byte into a region of size between 0 and 40 [-Wformat-truncation=]
|   309 |       snprintf(spec, sizeof(spec), ".%s.", qualifier2->choice);
|       |                                        ^
| In function 'snprintf',
|     inlined from 'ppdPageSizeLimits' at ppd-page.c:309:7:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/bits/stdio2.h:54:10: note: '__builtin___snprintf_chk' output between 3 and 43 bytes into a destination of size 41
|    54 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    55 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    56 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| ppd-page.c: In function 'ppdPageSizeLimits':
| ppd-page.c:300:40: warning: '.' directive output may be truncated writing 1 byte into a region of size between 0 and 40 [-Wformat-truncation=]
|   300 |       snprintf(spec, sizeof(spec), ".%s.%s", qualifier2->choice,
|       |                                        ^
| In function 'snprintf',
|     inlined from 'ppdPageSizeLimits' at ppd-page.c:300:7:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/bits/stdio2.h:54:10: note: '__builtin___snprintf_chk' output between 3 and 83 bytes into a destination of size 41
|    54 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    55 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    56 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| ppd-page.c: In function 'ppdPageSizeLimits':
| ppd-page.c:309:40: warning: '.' directive output may be truncated writing 1 byte into a region of size between 0 and 40 [-Wformat-truncation=]
|   309 |       snprintf(spec, sizeof(spec), ".%s.", qualifier2->choice);
|       |                                        ^
| In function 'snprintf',
|     inlined from 'ppdPageSizeLimits' at ppd-page.c:309:7:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/bits/stdio2.h:54:10: note: '__builtin___snprintf_chk' output between 3 and 43 bytes into a destination of size 41
|    54 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    55 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    56 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| ppd-page.c: In function 'ppdPageSizeLimits':
| ppd-page.c:315:39: warning: '%s' directive output may be truncated writing up to 40 bytes into a region of size 39 [-Wformat-truncation=]
|   315 |       snprintf(spec, sizeof(spec), "..%s", qualifier3->choice);
|       |                                       ^~
| In function 'snprintf',
|     inlined from 'ppdPageSizeLimits' at ppd-page.c:315:7:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/bits/stdio2.h:54:10: note: '__builtin___snprintf_chk' output between 3 and 43 bytes into a destination of size 41
|    54 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    55 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    56 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| ppd-localize.c: In function 'ppdLocalize':
| ppd-localize.c:118:56: warning: '%s' directive output may be truncated writing up to 40 bytes into a region of size 30 [-Wformat-truncation=]
|   118 |       snprintf(ckeyword, sizeof(ckeyword), "ParamCustom%s", coption->keyword);
|       |                                                        ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/stdio.h:964,
|                  from string-private.h:19,
|                  from cups-private.h:19,
|                  from ppd-localize.c:17:
| In function 'snprintf',
|     inlined from 'ppdLocalize' at ppd-localize.c:118:7:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/bits/stdio2.h:54:10: note: '__builtin___snprintf_chk' output between 12 and 52 bytes into a destination of size 41
|    54 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    55 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    56 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| http-support.c: In function '_httpSetDigestAuthString':
| http-support.c:1425:157: warning: '%s' directive output may be truncated writing up to 64 bytes into a region of size between 34 and 927 [-Wformat-truncation=]
|  1425 |       snprintf(digest, sizeof(digest), "username=\"%s\", realm=\"%s\", nonce=\"%s\", algorithm=%s, qop=auth, cnonce=\"%s\", nc=%08x, uri=\"%s\", response=\"%s\"", username, http->realm, http->nonce, http->algorithm, cnonce, http->nonce_count, resource, kd);
|       |                                                                                                                                                             ^~                                                                                               ~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/stdio.h:964,
|                  from string-private.h:19,
|                  from cups-private.h:19,
|                  from http-support.c:16:
| In function 'snprintf',
|     inlined from '_httpSetDigestAuthString' at http-support.c:1425:7:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/bits/stdio2.h:54:10: note: '__builtin___snprintf_chk' output 99 or more bytes (assuming 1056) into a destination of size 1024
|    54 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    55 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    56 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| http-support.c: In function '_httpSetDigestAuthString':
| http-support.c:1423:172: warning: '%s' directive output may be truncated writing up to 64 bytes into a region of size between 23 and 916 [-Wformat-truncation=]
|  1423 |       snprintf(digest, sizeof(digest), "username=\"%s\", realm=\"%s\", nonce=\"%s\", algorithm=%s, qop=auth, opaque=\"%s\", cnonce=\"%s\", nc=%08x, uri=\"%s\", response=\"%s\"", cupsUser(), http->realm, http->nonce, http->algorithm, http->opaque, cnonce, http->nonce_count, resource, kd);
|       |                                                                                                                                                                            ^~                                                                                                               ~~
| In function 'snprintf',
|     inlined from '_httpSetDigestAuthString' at http-support.c:1423:7:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/bits/stdio2.h:54:10: note: '__builtin___snprintf_chk' output 110 or more bytes (assuming 1067) into a destination of size 1024
|    54 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    55 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    56 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| ppd-emit.c: In function 'ppdEmitJCL':
| ppd-emit.c:499:53: warning: '%s' directive output may be truncated writing up to 64 bytes into a region of size between 21 and 30 [-Wformat-truncation=]
|   499 |     snprintf(displaymsg, sizeof(displaymsg), "%d %s %s", job_id, user, temp);
|       |                                                     ^~                 ~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/stdio.h:964,
|                  from string-private.h:19,
|                  from cups-private.h:19,
|                  from ppd-emit.c:17:
| In function 'snprintf',
|     inlined from 'ppdEmitJCL' at ppd-emit.c:499:5:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/bits/stdio2.h:54:10: note: '__builtin___snprintf_chk' output 4 or more bytes (assuming 77) into a destination of size 33
|    54 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    55 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    56 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| dest.c: In function 'cupsGetDestWithURI':
| dest.c:1292:42: warning: '%s' directive output may be truncated writing up to 255 bytes into a region of size between 9 and 1021 [-Wformat-truncation=]
|  1292 |       snprintf(temp, sizeof(temp), "%s @ %s", resource + 11, hostname);
|       |                                          ^~                  ~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/stdio.h:964,
|                  from string-private.h:19,
|                  from cups-private.h:19,
|                  from dest.c:16:
| In function 'snprintf',
|     inlined from 'cupsGetDestWithURI' at dest.c:1292:7:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/bits/stdio2.h:54:10: note: '__builtin___snprintf_chk' output between 4 and 1271 bytes into a destination of size 1024
|    54 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    55 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    56 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| dest.c: In function 'cupsGetDestWithURI':
| dest.c:1286:42: warning: '%s' directive output may be truncated writing up to 255 bytes into a region of size between 8 and 1021 [-Wformat-truncation=]
|  1286 |       snprintf(temp, sizeof(temp), "%s @ %s", resource + 10, hostname);
|       |                                          ^~                  ~~~~~~~~
| In function 'snprintf',
|     inlined from 'cupsGetDestWithURI' at dest.c:1286:7:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/bits/stdio2.h:54:10: note: '__builtin___snprintf_chk' output between 4 and 1272 bytes into a destination of size 1024
|    54 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    55 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    56 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| dest.c: In function 'cupsGetDestWithURI':
| dest.c:1280:42: warning: '%s' directive output may be truncated writing up to 255 bytes into a region of size between 7 and 1021 [-Wformat-truncation=]
|  1280 |       snprintf(temp, sizeof(temp), "%s @ %s", resource + 9, hostname);
|       |                                          ^~                 ~~~~~~~~
| In function 'snprintf',
|     inlined from 'cupsGetDestWithURI' at dest.c:1280:7:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/bits/stdio2.h:54:10: note: '__builtin___snprintf_chk' output between 4 and 1273 bytes into a destination of size 1024
|    54 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    55 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    56 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| ppd.c: In function '_ppdOpen':
| ppd.c:550:37: warning: '%s' directive output may be truncated writing up to 15 bytes into a region of size 7 [-Wformat-truncation=]
|   550 |     snprintf(ll_CC, sizeof(ll_CC), "%s.", lang->language);
|       |                                     ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/stdio.h:964,
|                  from string-private.h:19,
|                  from cups-private.h:19,
|                  from ppd.c:18:
| In function 'snprintf',
|     inlined from '_ppdOpen' at ppd.c:550:5:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/bits/stdio2.h:54:10: note: '__builtin___snprintf_chk' output between 2 and 17 bytes into a destination of size 7
|    54 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    55 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    56 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| ppd.c: In function '_ppdOpen':
| ppd.c:2000:44: warning: '__builtin___snprintf_chk' output may be truncated before the last format character [-Wformat-truncation=]
|  2000 |         snprintf(cname, sizeof(cname), "_%s", name);
|       |                                            ^
| In function 'snprintf',
|     inlined from '_ppdOpen' at ppd.c:2000:9:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/bits/stdio2.h:54:10: note: '__builtin___snprintf_chk' output between 2 and 42 bytes into a destination of size 41
|    54 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    55 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    56 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| ppd.c: In function '_ppdOpen':
| ppd.c:1964:44: warning: '__builtin___snprintf_chk' output may be truncated before the last format character [-Wformat-truncation=]
|  1964 |         snprintf(cname, sizeof(cname), "_%s", name);
|       |                                            ^
| In function 'snprintf',
|     inlined from '_ppdOpen' at ppd.c:1964:9:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/bits/stdio2.h:54:10: note: '__builtin___snprintf_chk' output between 2 and 42 bytes into a destination of size 41
|    54 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    55 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    56 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| ppd.c: In function '_ppdOpen':
| ppd.c:1935:44: warning: '__builtin___snprintf_chk' output may be truncated before the last format character [-Wformat-truncation=]
|  1935 |         snprintf(cname, sizeof(cname), "_%s", name);
|       |                                            ^
| In function 'snprintf',
|     inlined from '_ppdOpen' at ppd.c:1935:9:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/bits/stdio2.h:54:10: note: '__builtin___snprintf_chk' output between 2 and 42 bytes into a destination of size 41
|    54 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    55 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    56 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| ppd.c: In function '_ppdOpen':
| ppd.c:1547:48: warning: '__builtin___snprintf_chk' output may be truncated before the last format character [-Wformat-truncation=]
|  1547 |         snprintf(tchoice, sizeof(tchoice), "_%s", option->defchoice);
|       |                                                ^
| In function 'snprintf',
|     inlined from '_ppdOpen' at ppd.c:1547:2:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/bits/stdio2.h:54:10: note: '__builtin___snprintf_chk' output between 2 and 42 bytes into a destination of size 41
|    54 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    55 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    56 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| ppd.c: In function '_ppdOpen':
| ppd.c:1512:48: warning: '__builtin___snprintf_chk' output may be truncated before the last format character [-Wformat-truncation=]
|  1512 |         snprintf(tchoice, sizeof(tchoice), "_%s", option->defchoice);
|       |                                                ^
| In function 'snprintf',
|     inlined from '_ppdOpen' at ppd.c:1512:2:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/bits/stdio2.h:54:10: note: '__builtin___snprintf_chk' output between 2 and 42 bytes into a destination of size 41
|    54 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    55 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    56 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| ppd.c: In function '_ppdOpen':
| ppd.c:1473:57: warning: '%s' directive output may be truncated writing up to 40 bytes into a region of size 35 [-Wformat-truncation=]
|  1473 |       snprintf(custom_name, sizeof(custom_name), "Custom%s", name);
|       |                                                         ^~   ~~~~
| In function 'snprintf',
|     inlined from '_ppdOpen' at ppd.c:1473:7:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/recipe-sysroot/usr/include/bits/stdio2.h:54:10: note: '__builtin___snprintf_chk' output between 7 and 47 bytes into a destination of size 41
|    54 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    55 |                                    __glibc_objsize (__s), __fmt,
|       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    56 |                                    __va_arg_pack ());
|       |                                    ~~~~~~~~~~~~~~~~~
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/cups-2.4.7/cups'
| make: *** [Makefile:43: all] Error 1
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/temp/run.do_compile.516200:182 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/temp/run.do_compile.516200, line 182
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/temp/run.do_compile.516200, line 166
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/temp/run.do_compile.516200, line 161
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/temp/run.do_compile.516200, line 156
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/temp/run.do_compile.516200, line 151
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/temp/run.do_compile.516200, line 195
NOTE: recipe cups-2.4.7-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2100 tasks of which 2090 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cups/cups_2.4.7.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: cups-2.4.7-r0 do_compile: oe_runmake failed
ERROR: cups-2.4.7-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/temp/run.do_compile.516200', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/cups/2.4.7/temp/log.do_compile.516200
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cups/cups_2.4.7.bb:do_compile) failed with exit code '1'

--===============5798229026847313466==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cups-upgrade-2.4.6-2.4.7.patch"

RnJvbSAxYzdjNzlmNmZhNzMzZGJmMGM0NjI4NGQ4ZWRlZDIyNzY0MjBkOGE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxMToxMDo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGN1
cHM6IHVwZ3JhZGUgMi40LjYgLT4gMi40LjcKCi0tLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1
cHMvY3Vwcy5pbmMgICAgICAgICAgIHwgIDEgLQogLi4uL2N1cHMvY3Vwcy9DVkUtMjAyMy00NTA0
LnBhdGNoICAgICAgICAgICAgIHwgNDIgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4uL2N1cHMve2N1
cHNfMi40LjYuYmIgPT4gY3Vwc18yLjQuNy5iYn0gICAgIHwgIDIgKy0KIDMgZmlsZXMgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDQ0IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHMvQ1ZFLTIwMjMtNDUwNC5wYXRjaAogcmVuYW1l
IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL3tjdXBzXzIuNC42LmJiID0+IGN1cHNfMi40Ljcu
YmJ9ICg1MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy5p
bmMgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLmluYwppbmRleCBmYTMyYzM4NTQ5
Li4zNmZlYWRkY2Y4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBz
LmluYworKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzLmluYwpAQCAtMTUsNyAr
MTUsNiBAQCBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92JHtQVn0vY3Vw
cy0ke1BWfS1zb3VyY2UudGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDQtY3Vwcy1maXgt
bXVsdGlsaWItaW5zdGFsbC1maWxlLWNvbmZsaWN0cy5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6
Ly92b2xhdGlsZXMuOTlfY3VwcyBcCiAgICAgICAgICAgIGZpbGU6Ly9jdXBzLXZvbGF0aWxlcy5j
b25mIFwKLSAgICAgICAgICAgZmlsZTovL0NWRS0yMDIzLTQ1MDQucGF0Y2ggXAogICAgICAgICAg
ICAiCiAKIEdJVEhVQl9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vT3BlblByaW50aW5n
L2N1cHMvcmVsZWFzZXMiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9j
dXBzL0NWRS0yMDIzLTQ1MDQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBz
L0NWRS0yMDIzLTQ1MDQucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGU1MmU0
M2EyMDkuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy9D
VkUtMjAyMy00NTA0LnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNDIgKzAsMCBAQAotQ1ZFOiBD
VkUtMjAyMy00NTA0Ci1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dpdGh1Yi5j
b20vT3BlblByaW50aW5nL2N1cHMvY29tbWl0LzI0MzFjYWRkYjdlNmE4N2YwNGFjOTBiNWM2MzY2
YWQyNjhiNmZmMzEgXQotU2lnbmVkLW9mZi1ieTogTGVlIENoZWUgWWFuZyA8Y2hlZS55YW5nLmxl
ZUBpbnRlbC5jb20+Ci0KLUZyb20gMjQzMWNhZGRiN2U2YTg3ZjA0YWM5MGI1YzYzNjZhZDI2OGI2
ZmYzMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IFpkZW5layBEb2huYWwgPHpkb2hu
YWxAcmVkaGF0LmNvbT4KLURhdGU6IFdlZCwgMjAgU2VwIDIwMjMgMTQ6NDU6MTcgKzAyMDAKLVN1
YmplY3Q6IFtQQVRDSF0gcmFzdGVyLWludGVycHJldC5jOiBGaXggQ1ZFLTIwMjMtNDUwNAotCi1X
ZSBkaWRuJ3QgY2hlY2sgZm9yIGVuZCBvZiBidWZmZXIgaWYgaXQgbG9va3MgdGhlcmUgaXMgYW4g
ZXNjYXBlZAotY2hhcmFjdGVyIC0gY2hlY2sgZm9yIE5VTEwgdGVybWluYXRvciB0aGVyZSBhbmQg
aWYgZm91bmQsIHJldHVybiBOVUxMCi1hcyByZXR1cm4gdmFsdWUgYW5kIGluIGBwdHJgLCBiZWNh
dXNlIGEgbG9uZSBiYWNrc2xhc2ggaXMgbm90Ci1hIHZhbGlkIFBvc3RTY3JpcHQgY2hhcmFjdGVy
LgotLS0tCi0gY3Vwcy9yYXN0ZXItaW50ZXJwcmV0LmMgfCAxNCArKysrKysrKysrKysrLQotIDEg
ZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0t
Z2l0IGEvY3Vwcy9yYXN0ZXItaW50ZXJwcmV0LmMgYi9jdXBzL3Jhc3Rlci1pbnRlcnByZXQuYwot
aW5kZXggNmZjZjczMWI1Li5iODY1NWM4YzYgMTAwNjQ0Ci0tLS0gYS9jdXBzL3Jhc3Rlci1pbnRl
cnByZXQuYwotKysrIGIvY3Vwcy9yYXN0ZXItaW50ZXJwcmV0LmMKLUBAIC0xMTE2LDcgKzExMTYs
MTkgQEAgc2Nhbl9wcyhfY3Vwc19wc19zdGFja190ICpzdCwJCS8qIEkgIC0gU3RhY2sgKi8KLSAK
LSAJICAgIGN1ciArKzsKLSAKLS0gICAgICAgICAgICBpZiAoKmN1ciA9PSAnYicpCi0rCSAgIC8q
Ci0rCSAgICAqIFJldHVybiBOVUxMIGlmIHdlIHJlYWNoZWQgTlVMTCB0ZXJtaW5hdG9yLCBhIGxv
bmUgYmFja3NsYXNoCi0rCSAgICAqIGlzIG5vdCBhIHZhbGlkIGNoYXJhY3RlciBpbiBQb3N0U2Ny
aXB0LgotKwkgICAgKi8KLSsKLSsJICAgIGlmICghKmN1cikKLSsJICAgIHsKLSsJICAgICAgKnB0
ciA9IE5VTEw7Ci0rCi0rCSAgICAgIHJldHVybiAoTlVMTCk7Ci0rCSAgICB9Ci0rCi0rCSAgICBp
ZiAoKmN1ciA9PSAnYicpCi0gCSAgICAgICp2YWxwdHIrKyA9ICdcYic7Ci0gCSAgICBlbHNlIGlm
ICgqY3VyID09ICdmJykKLSAJICAgICAgKnZhbHB0cisrID0gJ1xmJzsKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHNfMi40LjYuYmIgYi9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvY3Vwcy9jdXBzXzIuNC43LmJiCnNpbWlsYXJpdHkgaW5kZXggNTElCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHNfMi40LjYuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9jdXBzL2N1cHNfMi40LjcuYmIKaW5kZXggNTgwMjlmZGJkNC4uZjRi
MDI4MmU0YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwc18yLjQu
Ni5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Vwcy9jdXBzXzIuNC43LmJiCkBAIC0y
LDQgKzIsNCBAQCByZXF1aXJlIGN1cHMuaW5jCiAKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0xJQ0VOU0U7bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiNThlOTcwY2YxOTU1ZTFjYzg3ZDA4NDdjMzI1MjZkOWMyY2NlZTMzNWU1
ZjBlMzg4MmIyODMxMzhiYTBlNzI2MiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkZDU0MjI4ZGQ5
MDM1MjY0MjhjZTdlMzc5NjFhZmFlZDIzMGFkMzEwNzg4MTQxZGE3NWNlYmFhMDgzNjJjZjZjIgot
LSAKMi4zOS4yCgo=

--===============5798229026847313466==--

