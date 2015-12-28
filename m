Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 051FA6FF80
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 07:14:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBS7Eo5v024175
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Dec 2015 23:14:50 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 27 Dec 2015 23:14:50 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Dec 2015 23:14:10 -0800
Message-ID: <07ec50eb553a1ac8a7780223d68f83bf9c79d4d5.1451286789.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1451286789.git.liezhi.yang@windriver.com>
References: <cover.1451286789.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/40] icu: force arm mode
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
X-List-Received-Date: Mon, 28 Dec 2015 07:14:51 -0000
Content-Type: text/plain

From: Martin Jansa <Martin.Jansa@gmail.com>

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
 meta/recipes-support/icu/icu_55.1.bb |    4 ++++
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
1.7.9.5


