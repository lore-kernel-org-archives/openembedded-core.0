Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 801176E665
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:46:52 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id w144so24561612wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=YXpESxJM+AmoM2YDw7Ofp33JLrzLnIFccdb6Tqk9k98=;
	b=G/win5ts0+aaPv9KKO5ZqdfUSbYiWZFhYa58Y2Zo7KTiw+5mKD/wt4JU8ZULzO0XYT
	x2lsU/l7U+85UqoPtjSotis54zfr7sSyy6CZikv5QzekevK4apABgOw14ajPvMbsWUbQ
	GojrH7h5xPRMMZ8fK6WoAYjEenHXDzlcmhy7Ow1wWp2ANEvGMZ73B4odiVq+nt0qMvbw
	gQWUxR9NoHXkCWfPGxBwXOFK43pTyBZ+x9Y7w8CoWKU+M8tyngQCGuMZr0SBrZnhs7Lw
	kjMisPaJmuTrRLqQc/W7huRX2e4Tq96QaKckR/YxU8nj8j1bMaP6bQuDvOzQSoUT2h1K
	Pnqw==
X-Received: by 10.28.225.6 with SMTP id y6mr19220763wmg.58.1449755212675;
	Thu, 10 Dec 2015 05:46:52 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	l7sm12534502wjx.14.2015.12.10.05.46.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:46:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:22 +0100
Message-Id: <1449755316-17611-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754341.git.Martin.Jansa@gmail.com>
References: <cover.1449754341.git.Martin.Jansa@gmail.com>
Subject: [PATCH 01/11] icu: force arm mode
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
X-List-Received-Date: Thu, 10 Dec 2015 13:46:52 -0000

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


