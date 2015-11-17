Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 055D3601D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 11:57:57 +0000 (UTC)
Received: by wmww144 with SMTP id w144so150394401wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 03:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=YXpESxJM+AmoM2YDw7Ofp33JLrzLnIFccdb6Tqk9k98=;
	b=HHLDgyl+oq0A1Z7yAGWiLqIJ/WqUpP3/ged5bkGyQKI/vP9CdF8tnoQmPgkNn4Rzn3
	PmgZm3q1f5gqk9DYyLSpObwMnQnOY1wCUxhwCuRMH1RfREe3meSS27FVxpRCXY0Z0Y5F
	7C1tgQLLKLIXdrgRHTkb7Aa+J/jb9imVf2hUasVqNQfF4YS+iUXiUn7jU82aQqdetYUa
	u278g+p41q6bt1d3LGjboOBKrZVoRT4g48sRK7YaV8lzmBqJwONLjGR3Xuw06FxVjaEJ
	rJQtA34RcSZbNSoB7FlpKN5GZdLLIww9jjkM+e+P8SySLe+1rX7O9VlGu91eG1R7pqNb
	cvqA==
X-Received: by 10.28.139.143 with SMTP id n137mr2165682wmd.8.1447761478528;
	Tue, 17 Nov 2015 03:57:58 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bh5sm39560919wjb.42.2015.11.17.03.57.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Nov 2015 03:57:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Nov 2015 11:57:53 +0100
Message-Id: <c373dbd4b63fff3a9b3c9c13b5a7133a7b834dde.1447757562.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1447757562.git.Martin.Jansa@gmail.com>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1447757562.git.Martin.Jansa@gmail.com>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 01/16] icu: force arm mode
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Nov 2015 11:57:58 -0000

* otherwise it triggers following ICE:
ERROR: Function failed: do_compile (log file is located at /OE/build/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/icu/53.1-r0/temp/log.do_compile.21570)
ERROR: Logfile of failure stored in: /OE/build/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/icu/53.1-r0/temp/log.do_compile.21570
Log data follows:
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| DEBUG: Executing shell function do_compile
| NOTE: make
| Note: rebuild with "make VERBOSE=1 " to show all compiler parameters.
| make[0]: Making `all' in `stubdata'
| make[1]: Entering directory '/OE/build/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/icu/53.1-r0/build/stubdata'
| make[1]: Nothing to be done for 'all'.
| make[1]: Leaving directory '/OE/build/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/icu/53.1-r0/build/stubdata'
| make[0]: Making `all' in `common'
| make[1]: Entering directory '/OE/build/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/icu/53.1-r0/build/common'
|    arm-oe-linux-gnueabi-gcc    ...  /OE/build/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/icu/53.1-r0/icu/source/common/ubidiwrt.c
| /OE/build/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/icu/53.1-r0/icu/source/common/ubidiwrt.c: In function 'ubidi_writeReordered_53':
| /OE/build/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/icu/53.1-r0/icu/source/common/ubidiwrt.c:643:1: internal compiler error: in patch_jump_insn, at cfgrtl.c:1275
|  }
|  ^
| Please submit a full bug report,
| with preprocessed source if appropriate.
| See <http://gcc.gnu.org/bugs.html> for instructions.
| *** Failed compilation command follows: ----------------------------------------------------------
| arm-oe-linux-gnueabi-gcc -march=armv4t -mthumb -mthumb-interwork -mtune=arm920t --sysroot=/OE/build/shr-core/tmp-eglibc/sysroots/om-gta02 -D_REENTRANT -DU_HAVE_ELF_H=1 -DU_HAVE_ATOMIC=1 -I/OE/build/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/icu/53.1-r0/icu/source/common -DDEFAULT_ICU_PLUGINS="/usr/lib/icu"  -DU_ATTRIBUTE_DEPRECATED= -DU_COMMON_IMPLEMENTATION -O2 -pipe -g -feliminate-unused-debug-types -std=c99 -Wall -pedantic -Wshadow -Wpointer-arith -Wmissing-prototypes -Wwrite-strings -c -DPIC -fPIC -o ubidiwrt.o /OE/build/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/icu/53.1-r0/icu/source/common/ubidiwrt.c
| --- ( rebuild with "make VERBOSE=1 all" to show all parameters ) --------
| /OE/build/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/icu/53.1-r0/icu/source/config/mh-linux:44: recipe for target 'ubidiwrt.o' failed
| make[1]: *** [ubidiwrt.o] Error 1
| make[1]: Leaving directory '/OE/build/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/icu/53.1-r0/build/common'
| Makefile:141: recipe for target 'all-recursive' failed
| make: *** [all-recursive] Error 2
| ERROR: oe_runmake failed
| WARNING: /OE/build/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/icu/53.1-r0/temp/run.do_compile.21570:1 exit 1 from
|   exit 1
| ERROR: Function failed: do_compile (log file is located at /OE/build/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/icu/53.1-r0/temp/log.do_compile.21570)
NOTE: recipe icu-53.1-r0: task do_compile: Failed
ERROR: Task 6803 (/OE/build/shr-core/openembedded-core/meta/recipes-support/icu/icu_53.1.bb, do_compile) failed with exit code '1'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/icu/icu_55.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/icu/icu_55.1.bb b/meta/recipes-support/icu/icu_55.1.bb
index 2661fd3..e91b6f3 100644
--- a/meta/recipes-support/icu/icu_55.1.bb
+++ b/meta/recipes-support/icu/icu_55.1.bb
@@ -8,6 +8,10 @@ def icu_download_version(d):
 
 ICU_PV = "${@icu_download_version(d)}"
 
+# http://errors.yoctoproject.org/Errors/Details/20486/
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
+
 BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/${PV}/icu4c-${ICU_PV}-src.tgz"
 SRC_URI = "${BASE_SRC_URI} \
            file://icu-pkgdata-large-cmd.patch \
-- 
2.6.3


