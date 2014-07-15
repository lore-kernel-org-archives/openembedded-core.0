Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 089ED65D03
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 18:30:05 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id b13so3858020wgh.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 11:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=b5mQgVhFHzCcTrDgTV+dBmcbzq+eORzi7/5ZS4uwGFk=;
	b=FjU9SVKhKFPHWZ/PnXcBaK+2YteGL0q2oRNyIBW/SXAP5G/Y87gEmTKj7zXAMObeNe
	b0jrrpWw7eWsGiPon95iz0gCmVhjwX3z+41tqqiusGq+ZmCkWz3rfbjdc0VnU68jOrh8
	epuioQOPyRO9lHcWcOwtkb9vwKCc9zzKmV10ImvUAbFd3aA03eppM9kOwE7H49Uh1Wgu
	YIfCGyz2dHAL+BParuuLjmrySY0l2b/USP5Msu5qEDNJsD8FH5ohFoSzb1ruLs4FBg3x
	bkYAfgDGkLZNMVjyLxhvZlgodZ5/VQ+4xn8fK/hp3EkwKrOQ3jzGn+3xJphX/Lh4MHtW
	7lmA==
X-Received: by 10.180.14.5 with SMTP id l5mr7765383wic.50.1405449006183;
	Tue, 15 Jul 2014 11:30:06 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	eh10sm41898819wic.0.2014.07.15.11.30.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jul 2014 11:30:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 20:30:14 +0200
Message-Id: <1405449014-17065-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [PATCH] gdb: force arm mode
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
X-List-Received-Date: Tue, 15 Jul 2014 18:30:09 -0000

* triggers some issue in gcc-4.9, this call:
arm-oe-linux-gnueabi-gcc  -march=armv5te -mthumb -mthumb-interwork -mtune=xscale
--sysroot=/OE/build/shr-core/tmp-eglibc/sysroots/spitz -O2 -pipe -g
-feliminate-unused-debug-types   -I.
-I/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/gdb/7.7-r0/gdb-7.7/gdb
-I/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/gdb/7.7-r0/gdb-7.7/gdb/common
-I/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/gdb/7.7-r0/gdb-7.7/gdb/config
-DLOCALEDIR="\"/usr/share/locale\"" -DHAVE_CONFIG_H
-I/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/gdb/7.7-r0/gdb-7.7/gdb/../include/opcode
-I/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/gdb/7.7-r0/gdb-7.7/gdb/../opcodes/..
-I../bfd
-I/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/gdb/7.7-r0/gdb-7.7/gdb/../bfd
-I/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/gdb/7.7-r0/gdb-7.7/gdb/../include
-I../libdecnumber
-I/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/gdb/7.7-r0/gdb-7.7/gdb/../libdecnumber
-I/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/gdb/7.7-r0/gdb-7.7/gdb/gnulib/import
-Ibuild-gnulib/import    -Wall -Wdeclaration-after-statement
-Wpointer-arith -Wpointer-sign -Wno-unused -Wunused-value
-Wunused-function -Wno-switch -Wno-char-subscripts -Wmissing-prototypes
-Wdeclaration-after-statement -Wempty-body -Wmissing-parameter-type
-Wold-style-declaration -Wold-style-definition -Wformat-nonliteral  -c
-o eval.o -MT eval.o -MMD -MP -MF .deps/eval.Tpo
/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/gdb/7.7-r0/gdb-7.7/gdb/eval.c

just hangs (strace shows occasional call to mmap, brk, munmap) and eats all available memory
(in my case 20GB), I've waited for 2,5 hours and it didn't finish,
after removing -mthumb it builds in second.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/gdb/gdb_7.7.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/gdb/gdb_7.7.bb b/meta/recipes-devtools/gdb/gdb_7.7.bb
index 1abc9d8..bc042ec 100644
--- a/meta/recipes-devtools/gdb/gdb_7.7.bb
+++ b/meta/recipes-devtools/gdb/gdb_7.7.bb
@@ -7,6 +7,9 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python"
 PACKAGECONFIG[babeltrace] = "--with-babeltrace,--without-babeltrace,babeltrace"
 
+# cc1 (4.9) call with -mthumb gets stuck and eats all available memory (over 20GB in my case)
+ARM_INSTRUCTION_SET = "arm"
+
 do_configure_prepend() {
 	if [ -n "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python', '', d)}" ]; then
 		cat > ${WORKDIR}/python << EOF
-- 
2.0.0


