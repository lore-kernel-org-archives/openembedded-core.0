Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 294CB70247
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 17:03:56 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id m15so1218767wgh.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 10:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=JBbSyqAeLghTdduWu/kcoN0RY0XFSCv6/mttELk1QyA=;
	b=JBXP6xdVimxuDRxP6EMJz7jpDNFbabHeAurjSF8Xyoqu+J1UInSKgCMt6a60Z4Ugd7
	sg/NSB4RDuNXXON9G1hZT1d4JoQws4jvoXO13ilC/CwmMt75reBmrKXr/+BmYKPt787D
	65+WgbQxDVBBKgiVAM0DlWcQzX34SIh839lGSrdZ2oRmjtFLnCUAN2FqojyyRM9ye501
	Ocq6kPXloO3GwZOncjNTgyWjVr/4COJuQcv1Pdfq0daINFLICSOE4StxNx/YoBMMVDZe
	VYaS+Qb2OIi1S6AVnPFfURvEOMNpnMlT8/MtJ911PNaK3QzZcA0zmoV1nEwuf23rLdNG
	i0mw==
X-Received: by 10.180.89.143 with SMTP id bo15mr14991963wib.78.1405530236516; 
	Wed, 16 Jul 2014 10:03:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ex4sm58557736wic.2.2014.07.16.10.03.55 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jul 2014 10:03:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 19:04:04 +0200
Message-Id: <1405530244-16849-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [RFC][PATCH] icu: force arm mode
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
X-List-Received-Date: Wed, 16 Jul 2014 17:04:08 -0000

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
 meta/recipes-support/icu/icu_53.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/icu/icu_53.1.bb b/meta/recipes-support/icu/icu_53.1.bb
index d93af68..82c8d8c 100644
--- a/meta/recipes-support/icu/icu_53.1.bb
+++ b/meta/recipes-support/icu/icu_53.1.bb
@@ -8,6 +8,8 @@ def icu_download_version(d):
 
 ICU_PV = "${@icu_download_version(d)}"
 
+ARM_INSTRUCTION_SET = "arm"
+
 BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/${PV}/icu4c-${ICU_PV}-src.tgz"
 SRC_URI = "${BASE_SRC_URI} \
            file://icu-pkgdata-large-cmd.patch \
-- 
2.0.0


