Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 535C5C61DDD
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 05:44:18 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2087.1787982251118477403
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 22:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Ls0FEWAF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=RYc5Yk//;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a04c0c010c-b00ca58a-7ffd-4af9-8e01-a61ff84fe352-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787982250;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=k4VPERFADBymwKXNe8lBDEi7BPIQQeTJ0zo3VJcD3X4=;
	b=Ls0FEWAFpj3A+MmvjGbHmKeisH8v1rdjaU98J+I2MhL/ipWeqLvy4gKCoUctL/6B
	jS4IKdWQy7HX60UWraCIsyh6IF9oWGfozU4BYzHKnGpiGyITtKntIMiJ6NOdkX4t6V8
	1V+7oDtdcrZ0AaWV8NdOKVhIpCw5/upjgFHDFe9k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787982250;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=k4VPERFADBymwKXNe8lBDEi7BPIQQeTJ0zo3VJcD3X4=;
	b=RYc5Yk//E4NF+MBJwuCQV5MFbVN6ZXzOzkNfaUGF7xgDP6WLIDjQf0Ti6u/YKwzx
	wJFhXBdHbU1O5+4QyWJOKfly/6mBBlQbCOqxpSYmHNXAUT+6FI3KR01jRXyo0ELB9cV
	XiKdFJMMVuVbvrAZSxFPQmckpjeojO7a00VhTVCg=
Content-Type: multipart/mixed; boundary="===============0424883280336886713=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] orc: upgrading to 0.4.43 SUCCEEDED
Message-ID: <010101a04c0c010c-b00ca58a-7ffd-4af9-8e01-a61ff84fe352-000000@us-west-2.amazonses.com>
Date: Sat, 29 Aug 2026 05:44:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.29-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2026 05:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244622

--===============0424883280336886713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *orc* to *0.4.43* has Succeeded.

Next steps:
    - apply the patch: git am 0001-orc-upgrade-0.4.42-0.4.43.patch
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
From 8c116d0b4cd7e501d844f1d0e68d5b483e5f0ca8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 29 Aug 2026 05:14:56 +0000
Subject: [PATCH] orc: upgrade 0.4.42 -> 0.4.43

---
 meta/recipes-devtools/orc/{orc_0.4.42.bb => orc_0.4.43.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/orc/{orc_0.4.42.bb => orc_0.4.43.bb} (95%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.42.bb b/meta/recipes-devtools/orc/orc_0.4.43.bb
similarity index 95%
rename from meta/recipes-devtools/orc/orc_0.4.42.bb
rename to meta/recipes-devtools/orc/orc_0.4.43.bb
index 89e879e1cc..db7f5023b3 100644
--- a/meta/recipes-devtools/orc/orc_0.4.42.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.43.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause AND BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
-SRC_URI[sha256sum] = "7ec912ab59af3cc97874c456a56a8ae1eec520c385ec447e8a102b2bd122c90c"
+SRC_URI[sha256sum] = "82394e20e5c4dffe8b45ea8525c62dd4e3e8be7f253ac11c19297ba7ea5473e0"
 
 inherit meson pkgconfig
 
-- 
2.47.1


--===============0424883280336886713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/orc/liborc-0.4: FILELIST: removed "/usr/lib/liborc-0.4.so.0.42.0", added "/usr/lib/liborc-0.4.so.0.43.0"
packages/x86-64-v3-poky-linux/orc/liborc-0.4: PKGSIZE changed from 1068956 to 1183772 (+11%)
packages/x86-64-v3-poky-linux/orc/liborc-test-0.4: FILELIST: removed "/usr/lib/liborc-test-0.4.so.0.42.0", added "/usr/lib/liborc-test-0.4.so.0.43.0"
packages/x86-64-v3-poky-linux/orc/orc-dev: FILELIST: added "/usr/include/orc-0.4/orc/orcarm64insn.h /usr/include/orc-0.4/orc/orcarminsn.h"
packages/x86-64-v3-poky-linux/orc/orc-src: PKGSIZE changed from 2463031 to 2991526 (+21%)
Changes to packages/x86-64-v3-poky-linux/orc (sysroot):
  /usr/lib/liborc-0.4.so.0 changed symlink target from liborc-0.4.so.0.42.0 to liborc-0.4.so.0.43.0
  /usr/lib/liborc-test-0.4.so.0 changed symlink target from liborc-test-0.4.so.0.42.0 to liborc-test-0.4.so.0.43.0
  /usr/lib/liborc-0.4.so.0.42.0 moved to /usr/lib/liborc-0.4.so.0.43.0
  /usr/lib/liborc-test-0.4.so.0.42.0 moved to /usr/lib/liborc-test-0.4.so.0.43.0
  /usr/include/orc-0.4/orc/orcarm64insn.h was added
  /usr/include/orc-0.4/orc/orcarminsn.h was added

--===============0424883280336886713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/orc: PV changed from "0.4.42" to "0.4.43"
packages/x86-64-v3-poky-linux/orc: SRC_URI changed from "http://gstreamer.freedesktop.org/src/orc/orc-0.4.42.tar.xz" to "http://gstreamer.freedesktop.org/src/orc/orc-0.4.43.tar.xz"
packages/x86-64-v3-poky-linux/orc: PKGV changed from 0.4.42 [default] to 0.4.43 [default]
packages/x86-64-v3-poky-linux/orc/liborc-0.4: PV changed from "0.4.42" to "0.4.43"
packages/x86-64-v3-poky-linux/orc/liborc-0.4: PKGSIZE changed from 1068956 to 1183772 (+11%)
packages/x86-64-v3-poky-linux/orc/liborc-0.4: FILELIST: removed "/usr/lib/liborc-0.4.so.0.42.0", added "/usr/lib/liborc-0.4.so.0.43.0"
packages/x86-64-v3-poky-linux/orc/liborc-0.4: FILES: removed "/usr/lib/liborc-0.4.so.0.42.0", added "/usr/lib/liborc-0.4.so.0.43.0"
packages/x86-64-v3-poky-linux/orc/liborc-0.4: PKGV changed from 0.4.42 [default] to 0.4.43 [default]
packages/x86-64-v3-poky-linux/orc/liborc-test-0.4: PV changed from "0.4.42" to "0.4.43"
packages/x86-64-v3-poky-linux/orc/liborc-test-0.4: FILELIST: removed "/usr/lib/liborc-test-0.4.so.0.42.0", added "/usr/lib/liborc-test-0.4.so.0.43.0"
packages/x86-64-v3-poky-linux/orc/liborc-test-0.4: FILES: removed "/usr/lib/liborc-test-0.4.so.0.42.0", added "/usr/lib/liborc-test-0.4.so.0.43.0"
packages/x86-64-v3-poky-linux/orc/liborc-test-0.4: PKGV changed from 0.4.42 [default] to 0.4.43 [default]
packages/x86-64-v3-poky-linux/orc/orc-dbg: PV changed from "0.4.42" to "0.4.43"
packages/x86-64-v3-poky-linux/orc/orc-dbg: PKGSIZE changed from 3621000 to 3914632 (+8%)
packages/x86-64-v3-poky-linux/orc/orc-dbg: FILELIST: removed "/usr/lib/.debug/liborc-test-0.4.so.0.42.0 /usr/lib/.debug/liborc-0.4.so.0.42.0", added "/usr/lib/.debug/liborc-0.4.so.0.43.0 /usr/lib/.debug/liborc-test-0.4.so.0.43.0"
packages/x86-64-v3-poky-linux/orc/orc-dbg: PKGV changed from 0.4.42 [default] to 0.4.43 [default]
packages/x86-64-v3-poky-linux/orc/orc-dev: PV changed from "0.4.42" to "0.4.43"
packages/x86-64-v3-poky-linux/orc/orc-dev: PKGSIZE changed from 299618 to 305084 (+2%)
packages/x86-64-v3-poky-linux/orc/orc-dev: FILELIST: added "/usr/include/orc-0.4/orc/orcarm64insn.h /usr/include/orc-0.4/orc/orcarminsn.h"
packages/x86-64-v3-poky-linux/orc/orc-dev: PKGV changed from 0.4.42 [default] to 0.4.43 [default]
packages/x86-64-v3-poky-linux/orc/orc-doc: PV changed from "0.4.42" to "0.4.43"
packages/x86-64-v3-poky-linux/orc/orc-doc: PKGV changed from 0.4.42 [default] to 0.4.43 [default]
packages/x86-64-v3-poky-linux/orc/orc-examples: PV changed from "0.4.42" to "0.4.43"
packages/x86-64-v3-poky-linux/orc/orc-examples: PKGV changed from 0.4.42 [default] to 0.4.43 [default]
packages/x86-64-v3-poky-linux/orc/orc-locale: PV changed from "0.4.42" to "0.4.43"
packages/x86-64-v3-poky-linux/orc/orc-locale: PKGV changed from 0.4.42 [default] to 0.4.43 [default]
packages/x86-64-v3-poky-linux/orc/orc-src: PV changed from "0.4.42" to "0.4.43"
packages/x86-64-v3-poky-linux/orc/orc-src: PKGSIZE changed from 2463031 to 2991526 (+21%)
packages/x86-64-v3-poky-linux/orc/orc-src: FILELIST: directory renamed /usr/src/debug/orc/0.4.42/orc/riscv -> /usr/src/debug/orc/0.4.43/orc/riscv, directory renamed /usr/src/debug/orc/0.4.42/orc-test -> /usr/src/debug/orc/0.4.43/orc-test, directory renamed /usr/src/debug/orc/0.4.42/orc/loongarch -> /usr/src/debug/orc/0.4.43/orc/loongarch, directory renamed /usr/src/debug/orc/0.4.42/tools -> /usr/src/debug/orc/0.4.43/tools, removed "/usr/src/debug/orc/0.4.42/orc/orcmmx.h /usr/src/debug/orc/0.4.42/orc/orcx86.c /usr/src/debug/orc/0.4.42/orc/orcx86.h /usr/src/debug/orc/0.4.42/orc/orcmmx.c /usr/src/debug/orc/0.4.42/orc/orcutils-private.h /usr/src/debug/orc/0.4.42/orc/orcprogram-neon.c /usr/src/debug/orc/0.4.42/orc/orccpu.h /usr/src/debug/orc/0.4.42/orc/orcprogram-mips.c /usr/src/debug/orc/0.4.42/orc/orcprogram-mmx.c /usr/src/debug/orc/0.4.42/orc/orccpu.c /usr/src/debug/orc/0.4.42/orc/orcrules-sse.c /usr/src/debug/orc/0.4.42/orc/orcavx.h /usr/src/debug/orc/0.4.42/orc/orccode.c /usr/src/deb
 ug/orc/0.4.42/orc/orcrules-altivec.c /usr/src/debug/orc/0.4.42/orc/orcavx.c /usr/src/debug/orc/0.4.42/orc/orccode.h /usr/src/debug/orc/0.4.42/orc/orcprogram-c.c /usr/src/debug/orc/0.4.42/orc/orcavx-internal.h /usr/src/debug/orc/0.4.42/orc/orcparse.h /usr/src/debug/orc/0.4.42/orc/orcmmx-private.h /usr/src/debug/orc/0.4.42/orc/orcsse-private.h /usr/src/debug/orc/0.4.42/orc/orcparse.c /usr/src/debug/orc/0.4.42/orc/orcrule.h /usr/src/debug/orc/0.4.42/orc/orcrule.c /usr/src/debug/orc/0.4.42/orc/orcinstruction.h /usr/src/debug/orc/0.4.42/orc/orcprogram-avx.c /usr/src/debug/orc/0.4.42/orc/opcodes.h /usr/src/debug/orc/0.4.42/orc/orcrules-mips.c /usr/src/debug/orc/0.4.42/orc/orcpowerpc.h /usr/src/debug/orc/0.4.42/orc/orcprogram.h /usr/src/debug/orc/0.4.42/orc/orc.c /usr/src/debug/orc/0.4.42/orc/orconce.h /usr/src/debug/orc/0.4.42/orc/orcx86insn.h /usr/src/debug/orc/0.4.42/orc/orc.h /usr/src/debug/orc/0.4.42/orc/orconce.c /usr/src/debug/orc/0.4.42/orc/orcpowerpc.c /usr/src/debug/orc/0.4.42/or
 c/orcprogram.c /usr/src/debug/orc/0.4.42/orc/orcx86insn.c /usr/src/debug/orc/0.4.42/orc/orcdebug.h /usr/src/debug/orc/0.4.42/orc/orctarget.c /usr/src/debug/orc/0.4.42/orc/orcsse.h /usr/src/debug/orc/0.4.42/orc/orcdebug.c /usr/src/debug/orc/0.4.42/orc/orcsse.c /usr/src/debug/orc/0.4.42/orc/orctarget.h /usr/src/debug/orc/0.4.42/orc/orcbytecode.h /usr/src/debug/orc/0.4.42/orc/orcvariable.h /usr/src/debug/orc/0.4.42/orc/orcbytecode.c /usr/src/debug/orc/0.4.42/orc/orcvariable.c /usr/src/debug/orc/0.4.42/orc/orcarm.c /usr/src/debug/orc/0.4.42/orc/orcopcodes-sys.c /usr/src/debug/orc/0.4.42/orc/orcarm.h /usr/src/debug/orc/0.4.42/orc/orcrules-neon.c /usr/src/debug/orc/0.4.42/orc/orcemulateopcodes.c /usr/src/debug/orc/0.4.42/orc/orcfunctions.c /usr/src/debug/orc/0.4.42/orc/orcemulateopcodes.h /usr/src/debug/orc/0.4.42/orc/orcneon.h /usr/src/debug/orc/0.4.42/orc/orcconstant.c /usr/src/debug/orc/0.4.42/orc/orcprogram-c64x-c.c /usr/src/debug/orc/0.4.42/orc/orcprogram-sse.c /usr/src/debug/orc/0.4
 .42/orc/orcconstant.h /usr/src/debug/orc/0.4.42/orc/orcrules-mmx.c /usr/src/debug/orc/0.4.42/orc/orcmips.c /usr/src/debug/orc/0.4.42/orc/orcmips.h /usr/src/debug/orc/0.4.42/orc/orcx86-private.h /usr/src/debug/orc/0.4.42/orc/orcinternal.h /usr/src/debug/orc/0.4.42/orc/orcrules-avx.c /usr/src/debug/orc/0.4.42/orc/orccompiler.c /usr/src/debug/orc/0.4.42/orc/orcexecutor.c /usr/src/debug/orc/0.4.42/orc/orccompiler.h /usr/src/debug/orc/0.4.42/orc/orcexecutor.h /usr/src/debug/orc/0.4.42/orc/orcavxinsn.h /usr/src/debug/orc/0.4.42/orc/orcmmxinsn.h /usr/src/debug/orc/0.4.42/orc/orcsseinsn.h /usr/src/debug/orc/0.4.42/orc/orcutils.h /usr/src/debug/orc/0.4.42/orc/orcutils.c /usr/src/debug/orc/0.4.42/orc/orccodemem.c /usr/src/debug/orc/0.4.42/orc/orcavxinsn.c /usr/src/debug/orc/0.4.42/orc/orccpu-x86.c /usr/src/debug/orc/0.4.42/orc/orcmmxinsn.c /usr/src/debug/orc/0.4.42/orc/orcsseinsn.c /usr/src/debug/orc/0.4.42/orc/orcopcode.c /usr/src/debug/orc/0.4.42/orc/orcopcode.h /usr/src/debug/orc/0.4.42/or
 c/orcprogram-x86.c /usr/src/debug/orc/0.4.42/orc/orcprogram-altivec.c /usr/src/debug/orc/0.4.42/orc/orcbytecodes.h", added "/usr/src/debug/orc/0.4.43/orc/orcprogram-altivec.c /usr/src/debug/orc/0.4.43/orc/avx512/orcavx512rules.c /usr/src/debug/orc/0.4.43/orc/orcavxinsn.h /usr/src/debug/orc/0.4.43/orc/orcarminsn.h /usr/src/debug/orc/0.4.43/orc/orcmmxinsn.h /usr/src/debug/orc/0.4.43/orc/orcsseinsn.h /usr/src/debug/orc/0.4.43/orc/orcarminsn.c /usr/src/debug/orc/0.4.43/orc/orcavxinsn.c /usr/src/debug/orc/0.4.43/orc/orccodemem.c /usr/src/debug/orc/0.4.43/orc/orccpu-x86.c /usr/src/debug/orc/0.4.43/orc/orcmmxinsn.c /usr/src/debug/orc/0.4.43/orc/orcsseinsn.c /usr/src/debug/orc/0.4.43/orc/orcsse.h /usr/src/debug/orc/0.4.43/orc/orcsse.c /usr/src/debug/orc/0.4.43/orc/opcodes.h /usr/src/debug/orc/0.4.43/orc/orcavx-internal.h /usr/src/debug/orc/0.4.43/orc/orcprogram-mips.c /usr/src/debug/orc/0.4.43/orc/orctarget.c /usr/src/debug/orc/0.4.43/orc/orcprogram-x86.c /usr/src/debug/orc/0.4.43/orc/orcta
 rget.h /usr/src/debug/orc/0.4.43/orc/avx512/orcavx512compiler.c /usr/src/debug/orc/0.4.43/orc/orcprogram-neon32.c /usr/src/debug/orc/0.4.43/orc/orcprogram-neon64.c /usr/src/debug/orc/0.4.43/orc/orcfunctions.c /usr/src/debug/orc/0.4.43/orc/orcx86-private.h /usr/src/debug/orc/0.4.43/orc/orcinternal.h /usr/src/debug/orc/0.4.43/orc/orcprogram-c.c /usr/src/debug/orc/0.4.43/orc/orcmmx.c /usr/src/debug/orc/0.4.43/orc/orcmmx.h /usr/src/debug/orc/0.4.43/orc/avx512/orcavx512-private.h /usr/src/debug/orc/0.4.43/orc/orcarm.h /usr/src/debug/orc/0.4.43/orc/orcrules-altivec.c /usr/src/debug/orc/0.4.43/orc/orcinstruction.h /usr/src/debug/orc/0.4.43/orc/orcarm.c /usr/src/debug/orc/0.4.43/orc/orcrules-sse.c /usr/src/debug/orc/0.4.43/orc/orcneon.h /usr/src/debug/orc/0.4.43/orc/avx512/orcavx512target.c /usr/src/debug/orc/0.4.43/orc/orcavx.h /usr/src/debug/orc/0.4.43/orc/orcprogram-sse.c /usr/src/debug/orc/0.4.43/orc/orcparse.c /usr/src/debug/orc/0.4.43/orc/orcopcodes-sys.c /usr/src/debug/orc/0.4.43/orc
 /orcavx.c /usr/src/debug/orc/0.4.43/orc/orcparse.h /usr/src/debug/orc/0.4.43/orc/orccpu.h /usr/src/debug/orc/0.4.43/orc/orcrules-mmx.c /usr/src/debug/orc/0.4.43/orc/orccpu.c /usr/src/debug/orc/0.4.43/orc/orc.c /usr/src/debug/orc/0.4.43/orc/orcprogram.h /usr/src/debug/orc/0.4.43/orc/orcpowerpc.h /usr/src/debug/orc/0.4.43/orc/orcx86insn.h /usr/src/debug/orc/0.4.43/orc/orcx86.c /usr/src/debug/orc/0.4.43/orc/orcrules-neon32.c /usr/src/debug/orc/0.4.43/orc/orcpowerpc.c /usr/src/debug/orc/0.4.43/orc/orcprogram.c /usr/src/debug/orc/0.4.43/orc/orc.h /usr/src/debug/orc/0.4.43/orc/orcx86insn.c /usr/src/debug/orc/0.4.43/orc/orcx86.h /usr/src/debug/orc/0.4.43/orc/orcemulateopcodes.c /usr/src/debug/orc/0.4.43/orc/orcutils.c /usr/src/debug/orc/0.4.43/orc/orcemulateopcodes.h /usr/src/debug/orc/0.4.43/orc/orcutils.h /usr/src/debug/orc/0.4.43/orc/orcarm64insn.c /usr/src/debug/orc/0.4.43/orc/orccompiler.c /usr/src/debug/orc/0.4.43/orc/orcexecutor.c /usr/src/debug/orc/0.4.43/orc/orcarm64insn.h /usr/sr
 c/debug/orc/0.4.43/orc/orccompiler.h /usr/src/debug/orc/0.4.43/orc/orcexecutor.h /usr/src/debug/orc/0.4.43/orc/orcconstant.h /usr/src/debug/orc/0.4.43/orc/orcopcode.c /usr/src/debug/orc/0.4.43/orc/orcrule.c /usr/src/debug/orc/0.4.43/orc/orcconstant.c /usr/src/debug/orc/0.4.43/orc/orcrule.h /usr/src/debug/orc/0.4.43/orc/orcopcode.h /usr/src/debug/orc/0.4.43/orc/orcprogram-c64x-c.c /usr/src/debug/orc/0.4.43/orc/orcutils-private.h /usr/src/debug/orc/0.4.43/orc/orcmips.c /usr/src/debug/orc/0.4.43/orc/avx512/orcavx512insn.c /usr/src/debug/orc/0.4.43/orc/avx512/orcavx512insn.h /usr/src/debug/orc/0.4.43/orc/orcmips.h /usr/src/debug/orc/0.4.43/orc/orcrules-neon64.c /usr/src/debug/orc/0.4.43/orc/orcneon-private.h /usr/src/debug/orc/0.4.43/orc/orccode.c /usr/src/debug/orc/0.4.43/orc/orcprogram-mmx.c /usr/src/debug/orc/0.4.43/orc/orcdebug.h /usr/src/debug/orc/0.4.43/orc/orcmmx-private.h /usr/src/debug/orc/0.4.43/orc/orcsse-private.h /usr/src/debug/orc/0.4.43/orc/orccode.h /usr/src/debug/orc/0.
 4.43/orc/orcdebug.c /usr/src/debug/orc/0.4.43/orc/orcprogram-neon.c /usr/src/debug/orc/0.4.43/orc/orcbytecodes.h /usr/src/debug/orc/0.4.43/orc/orcrules-neon.c /usr/src/debug/orc/0.4.43/orc/orconce.h /usr/src/debug/orc/0.4.43/orc/orcbytecode.c /usr/src/debug/orc/0.4.43/orc/orcvariable.c /usr/src/debug/orc/0.4.43/orc/orconce.c /usr/src/debug/orc/0.4.43/orc/orcbytecode.h /usr/src/debug/orc/0.4.43/orc/orcvariable.h /usr/src/debug/orc/0.4.43/orc/orcrules-mips.c /usr/src/debug/orc/0.4.43/orc/avx512/orcavx512.h /usr/src/debug/orc/0.4.43/orc/orcprogram-avx.c /usr/src/debug/orc/0.4.43/orc/orcrules-avx.c /usr/src/debug/orc/0.4.43/orc/avx512/orcavx512.c"
packages/x86-64-v3-poky-linux/orc/orc-src: PKGV changed from 0.4.42 [default] to 0.4.43 [default]
packages/x86-64-v3-poky-linux/orc/orc-staticdev: PV changed from "0.4.42" to "0.4.43"
packages/x86-64-v3-poky-linux/orc/orc-staticdev: PKGV changed from 0.4.42 [default] to 0.4.43 [default]
packages/x86-64-v3-poky-linux/orc/orc: PV changed from "0.4.42" to "0.4.43"
packages/x86-64-v3-poky-linux/orc/orc: PKGV changed from 0.4.42 [default] to 0.4.43 [default]
Changes to packages/x86-64-v3-poky-linux/orc (sysroot):
  /usr/lib/liborc-0.4.so.0 changed symlink target from liborc-0.4.so.0.42.0 to liborc-0.4.so.0.43.0
  /usr/lib/liborc-test-0.4.so.0 changed symlink target from liborc-test-0.4.so.0.42.0 to liborc-test-0.4.so.0.43.0
  /usr/lib/liborc-0.4.so.0.42.0 moved to /usr/lib/liborc-0.4.so.0.43.0
  /usr/lib/liborc-test-0.4.so.0.42.0 moved to /usr/lib/liborc-test-0.4.so.0.43.0
  /usr/include/orc-0.4/orc/orcarm64insn.h was added
  /usr/include/orc-0.4/orc/orcarminsn.h was added

--===============0424883280336886713==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-orc-upgrade-0.4.42-0.4.43.patch"

RnJvbSA4YzExNmQwYjRjZDdlNTAxZDg0NGYxZDBlNjhkNWI0ODNlNWYwY2E4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjkgQXVnIDIwMjYgMDU6MTQ6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBv
cmM6IHVwZ3JhZGUgMC40LjQyIC0+IDAuNC40MwoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
b3JjL3tvcmNfMC40LjQyLmJiID0+IG9yY18wLjQuNDMuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL29yYy97b3JjXzAuNC40Mi5iYiA9PiBvcmNfMC40LjQzLmJifSAoOTUlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9vcmMvb3JjXzAuNC40Mi5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9vcmMvb3JjXzAuNC40My5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvb3JjL29yY18wLjQuNDIuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9vcmMvb3JjXzAuNC40My5iYgppbmRleCA4OWU4NzllMWNj
Li5kYjdmNTAyM2IzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvb3JjL29yY18w
LjQuNDIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL29yYy9vcmNfMC40LjQzLmJiCkBA
IC01LDcgKzUsNyBAQCBMSUNFTlNFID0gIkJTRC0yLUNsYXVzZSBBTkQgQlNELTMtQ2xhdXNlIgog
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9MTQwMGJkOWQwOWU4YWY1NmI5
ZWM5ODJiM2Q4NTc5N2UiCiAKIFNSQ19VUkkgPSAiaHR0cDovL2dzdHJlYW1lci5mcmVlZGVza3Rv
cC5vcmcvc3JjL29yYy9vcmMtJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdl
YzkxMmFiNTlhZjNjYzk3ODc0YzQ1NmE1NmE4YWUxZWVjNTIwYzM4NWVjNDQ3ZThhMTAyYjJiZDEy
MmM5MGMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiODIzOTRlMjBlNWM0ZGZmZThiNDVlYTg1MjVj
NjJkZDRlM2U4YmU3ZjI1M2FjMTFjMTkyOTdiYTdlYTU0NzNlMCIKIAogaW5oZXJpdCBtZXNvbiBw
a2djb25maWcKIAotLSAKMi40Ny4xCgo=

--===============0424883280336886713==--

