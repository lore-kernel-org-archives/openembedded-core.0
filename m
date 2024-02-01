Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A572C54E52
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:18 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.2103.1706810405659140701
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aNmb+5pa;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HdQxsy2Q;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018d65d3efb1-858c2cbc-3d87-4e9c-9190-92aa46edf76a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hBwgLFFuFE/6VcGWJgpQ6U7f5gEuj8OZWHqU7det6Tc=;
	b=aNmb+5paXAoO51+PVQToPUpJditU03rxH/XukVy7r03IwhiZ7G7PZvFFS+dJK4wd
	bMa166nJewbRB2EdBrzOyqA5QgEYJ3TDEaGZ4tuniqpTrihzImhX+1OBTzoQUyw/IaS
	6YWj3316bOK56JWuJ+c/GCl2TBj2WsK9iK0reE3E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hBwgLFFuFE/6VcGWJgpQ6U7f5gEuj8OZWHqU7det6Tc=;
	b=HdQxsy2QLdLIL9absz8ligiH1O6qbFO6g9RPMJOYk7JLBpsfjwwlgzNqcxjkPPm8
	f3bVhxgmqQT/hm54Pr/SetpsuHqqPunxWkoWE6ZhUIdysTLAOv5/OhDWpNDyckMeeRK
	fSOVCzZtc9XVxpiT3skh42uBOlDRpCeqk+uQUmxA=
Content-Type: multipart/mixed; boundary="===============8454035242623191935=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] orc: upgrading to 0.4.36 SUCCEEDED
Message-ID: <0101018d65d3efb1-858c2cbc-3d87-4e9c-9190-92aa46edf76a-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194625

--===============8454035242623191935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *orc* to *0.4.36* has Succeeded.

Next steps:
    - apply the patch: git am 0001-orc-upgrade-0.4.34-0.4.36.patch
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
From 1332089d77b55d03c4c5d08e8ff8146dff88dd57 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 07:19:20 +0000
Subject: [PATCH] orc: upgrade 0.4.34 -> 0.4.36

---
 meta/recipes-devtools/orc/{orc_0.4.34.bb => orc_0.4.36.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/orc/{orc_0.4.34.bb => orc_0.4.36.bb} (92%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.34.bb b/meta/recipes-devtools/orc/orc_0.4.36.bb
similarity index 92%
rename from meta/recipes-devtools/orc/orc_0.4.34.bb
rename to meta/recipes-devtools/orc/orc_0.4.36.bb
index 801d604bdc..b191367eaf 100644
--- a/meta/recipes-devtools/orc/orc_0.4.34.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.36.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
-SRC_URI[sha256sum] = "8f47abb3f097171e44eb807adcdabd860fba2effd37d8d3c4fbd5f341cadd41f"
+SRC_URI[sha256sum] = "83b074cb67317d58bef1e8d0cc862f7ae8a77a45bbff056a1f987c6488b2f5fd"
 
 inherit meson pkgconfig gtk-doc
 
-- 
2.42.0


--===============8454035242623191935==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-orc-upgrade-0.4.34-0.4.36.patch"

RnJvbSAxMzMyMDg5ZDc3YjU1ZDAzYzRjNWQwOGU4ZmY4MTQ2ZGZmODhkZDU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAwNzoxOToyMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG9y
YzogdXBncmFkZSAwLjQuMzQgLT4gMC40LjM2CgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9v
cmMve29yY18wLjQuMzQuYmIgPT4gb3JjXzAuNC4zNi5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvb3JjL3tvcmNfMC40LjM0LmJiID0+IG9yY18wLjQuMzYuYmJ9ICg5MiUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL29yYy9vcmNfMC40LjM0LmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL29yYy9vcmNfMC40LjM2LmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9vcmMvb3JjXzAuNC4zNC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL29yYy9vcmNfMC40LjM2LmJiCmluZGV4IDgwMWQ2MDRiZGMu
LmIxOTEzNjdlYWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9vcmMvb3JjXzAu
NC4zNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvb3JjL29yY18wLjQuMzYuYmIKQEAg
LTUsNyArNSw3IEBAIExJQ0VOU0UgPSAiQlNELTItQ2xhdXNlICYgQlNELTMtQ2xhdXNlIgogTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9MTQwMGJkOWQwOWU4YWY1NmI5ZWM5
ODJiM2Q4NTc5N2UiCiAKIFNSQ19VUkkgPSAiaHR0cDovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5v
cmcvc3JjL29yYy9vcmMtJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjhmNDdh
YmIzZjA5NzE3MWU0NGViODA3YWRjZGFiZDg2MGZiYTJlZmZkMzdkOGQzYzRmYmQ1ZjM0MWNhZGQ0
MWYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiODNiMDc0Y2I2NzMxN2Q1OGJlZjFlOGQwY2M4NjJm
N2FlOGE3N2E0NWJiZmYwNTZhMWY5ODdjNjQ4OGIyZjVmZCIKIAogaW5oZXJpdCBtZXNvbiBwa2dj
b25maWcgZ3RrLWRvYwogCi0tIAoyLjQyLjAKCg==

--===============8454035242623191935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/orc/liborc-0.4: FILELIST: removed "/usr/lib/liborc-0.4.so.0.34.0", added "/usr/lib/liborc-0.4.so.0.36.0"
packages/core2-64-poky-linux/orc/liborc-0.4: PKGSIZE changed from 619476 to 738548 (+19%)
packages/core2-64-poky-linux/orc/liborc-test-0.4: FILELIST: removed "/usr/lib/liborc-test-0.4.so.0.34.0", added "/usr/lib/liborc-test-0.4.so.0.36.0"
packages/core2-64-poky-linux/orc/orc-dbg: PKGSIZE changed from 1805632 to 2099248 (+16%)
packages/core2-64-poky-linux/orc/orc-dev: FILELIST: added "/usr/include/orc-0.4/orc/orcavx.h"
packages/core2-64-poky-linux/orc/orc-dev: PKGSIZE changed from 197705 to 241237 (+22%)
packages/core2-64-poky-linux/orc/orc-src: PKGSIZE changed from 1456700 to 1742523 (+20%)
Changes to packages/core2-64-poky-linux/orc (sysroot):
  /usr/lib/liborc-0.4.so.0 changed symlink target from liborc-0.4.so.0.34.0 to liborc-0.4.so.0.36.0
  /usr/lib/liborc-test-0.4.so.0 changed symlink target from liborc-test-0.4.so.0.34.0 to liborc-test-0.4.so.0.36.0
  /usr/lib/liborc-0.4.so.0.34.0 moved to /usr/lib/liborc-0.4.so.0.36.0
  /usr/lib/liborc-test-0.4.so.0.34.0 moved to /usr/lib/liborc-test-0.4.so.0.36.0
  /usr/include/orc-0.4/orc/orcavx.h was added

--===============8454035242623191935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/orc: SRC_URI changed from "http://gstreamer.freedesktop.org/src/orc/orc-0.4.34.tar.xz" to "http://gstreamer.freedesktop.org/src/orc/orc-0.4.36.tar.xz"
packages/core2-64-poky-linux/orc: PKGV changed from 0.4.34 [default] to 0.4.36 [default]
packages/core2-64-poky-linux/orc: PV changed from "0.4.34" to "0.4.36"
packages/core2-64-poky-linux/orc/liborc-0.4: PKGSIZE changed from 619476 to 738548 (+19%)
packages/core2-64-poky-linux/orc/liborc-0.4: FILES: removed "/usr/lib/liborc-0.4.so.0.34.0", added "/usr/lib/liborc-0.4.so.0.36.0"
packages/core2-64-poky-linux/orc/liborc-0.4: PKGV changed from 0.4.34 [default] to 0.4.36 [default]
packages/core2-64-poky-linux/orc/liborc-0.4: FILELIST: removed "/usr/lib/liborc-0.4.so.0.34.0", added "/usr/lib/liborc-0.4.so.0.36.0"
packages/core2-64-poky-linux/orc/liborc-0.4: PV changed from "0.4.34" to "0.4.36"
packages/core2-64-poky-linux/orc/liborc-test-0.4: FILES: removed "/usr/lib/liborc-test-0.4.so.0.34.0", added "/usr/lib/liborc-test-0.4.so.0.36.0"
packages/core2-64-poky-linux/orc/liborc-test-0.4: PKGV changed from 0.4.34 [default] to 0.4.36 [default]
packages/core2-64-poky-linux/orc/liborc-test-0.4: FILELIST: removed "/usr/lib/liborc-test-0.4.so.0.34.0", added "/usr/lib/liborc-test-0.4.so.0.36.0"
packages/core2-64-poky-linux/orc/liborc-test-0.4: PV changed from "0.4.34" to "0.4.36"
packages/core2-64-poky-linux/orc/orc-dbg: PKGSIZE changed from 1805632 to 2099248 (+16%)
packages/core2-64-poky-linux/orc/orc-dbg: PKGV changed from 0.4.34 [default] to 0.4.36 [default]
packages/core2-64-poky-linux/orc/orc-dbg: FILELIST: removed "/usr/lib/.debug/liborc-test-0.4.so.0.34.0 /usr/lib/.debug/liborc-0.4.so.0.34.0", added "/usr/lib/.debug/liborc-test-0.4.so.0.36.0 /usr/lib/.debug/liborc-0.4.so.0.36.0"
packages/core2-64-poky-linux/orc/orc-dbg: PV changed from "0.4.34" to "0.4.36"
packages/core2-64-poky-linux/orc/orc-dev: PKGSIZE changed from 197705 to 241237 (+22%)
packages/core2-64-poky-linux/orc/orc-dev: PKGV changed from 0.4.34 [default] to 0.4.36 [default]
packages/core2-64-poky-linux/orc/orc-dev: FILELIST: added "/usr/include/orc-0.4/orc/orcavx.h"
packages/core2-64-poky-linux/orc/orc-dev: PV changed from "0.4.34" to "0.4.36"
packages/core2-64-poky-linux/orc/orc-doc: PKGV changed from 0.4.34 [default] to 0.4.36 [default]
packages/core2-64-poky-linux/orc/orc-doc: PV changed from "0.4.34" to "0.4.36"
packages/core2-64-poky-linux/orc/orc-examples: PKGV changed from 0.4.34 [default] to 0.4.36 [default]
packages/core2-64-poky-linux/orc/orc-examples: PV changed from "0.4.34" to "0.4.36"
packages/core2-64-poky-linux/orc/orc-locale: PKGV changed from 0.4.34 [default] to 0.4.36 [default]
packages/core2-64-poky-linux/orc/orc-locale: PV changed from "0.4.34" to "0.4.36"
packages/core2-64-poky-linux/orc/orc-src: PKGSIZE changed from 1456700 to 1742523 (+20%)
packages/core2-64-poky-linux/orc/orc-src: PKGV changed from 0.4.34 [default] to 0.4.36 [default]
packages/core2-64-poky-linux/orc/orc-src: FILELIST: directory renamed /usr/src/debug/orc/0.4.34/orc-test -> /usr/src/debug/orc/0.4.36/orc-test, directory renamed /usr/src/debug/orc/0.4.34/tools -> /usr/src/debug/orc/0.4.36/tools, removed "/usr/src/debug/orc/0.4.34/orc/orcbytecode.c /usr/src/debug/orc/0.4.34/orc/orcprogram-mmx.c /usr/src/debug/orc/0.4.34/orc/orcvariable.h /usr/src/debug/orc/0.4.34/orc/orcbytecode.h /usr/src/debug/orc/0.4.34/orc/orcrules-mips.c /usr/src/debug/orc/0.4.34/orc/orcneon.h /usr/src/debug/orc/0.4.34/orc/orclimits.h /usr/src/debug/orc/0.4.34/orc/orcopcode.h /usr/src/debug/orc/0.4.34/orc/orctarget.h /usr/src/debug/orc/0.4.34/orc/orcbytecodes.h /usr/src/debug/orc/0.4.34/orc/orcinstruction.h /usr/src/debug/orc/0.4.34/orc/orcprogram-c64x-c.c /usr/src/debug/orc/0.4.34/orc/orconce.h /usr/src/debug/orc/0.4.34/orc/orcutils.h /usr/src/debug/orc/0.4.34/orc/orcrules-sse.c /usr/src/debug/orc/0.4.34/orc/orcutils.c /usr/src/debug/orc/0.4.34/orc/orconce.c /usr/src/debug/orc/
 0.4.34/orc/orcmmx.h /usr/src/debug/orc/0.4.34/orc/orcinternal.h /usr/src/debug/orc/0.4.34/orc/orcfunctions.c /usr/src/debug/orc/0.4.34/orc/orcmmx.c /usr/src/debug/orc/0.4.34/orc/orccpuinsn.h /usr/src/debug/orc/0.4.34/orc/orcpowerpc.h /usr/src/debug/orc/0.4.34/orc/orc.c /usr/src/debug/orc/0.4.34/orc/orcdebug.c /usr/src/debug/orc/0.4.34/orc/orcmips.h /usr/src/debug/orc/0.4.34/orc/orcprogram.h /usr/src/debug/orc/0.4.34/orc/orcx86.c /usr/src/debug/orc/0.4.34/orc/orcx86insn.h /usr/src/debug/orc/0.4.34/orc/orcx86.h /usr/src/debug/orc/0.4.34/orc/orcrules-altivec.c /usr/src/debug/orc/0.4.34/orc/orc.h /usr/src/debug/orc/0.4.34/orc/orcx86insn.c /usr/src/debug/orc/0.4.34/orc/orcdebug.h /usr/src/debug/orc/0.4.34/orc/orccodemem.c /usr/src/debug/orc/0.4.34/orc/orccpu-x86.c /usr/src/debug/orc/0.4.34/orc/orcopcodes.c /usr/src/debug/orc/0.4.34/orc/orcpowerpc.c /usr/src/debug/orc/0.4.34/orc/orcmips.c /usr/src/debug/orc/0.4.34/orc/orcprogram.c /usr/src/debug/orc/0.4.34/orc/orcprogram-c.c /usr/src/debu
 g/orc/0.4.34/orc/orcrules-mmx.c /usr/src/debug/orc/0.4.34/orc/orcprogram-sse.c /usr/src/debug/orc/0.4.34/orc/orcrules-neon.c /usr/src/debug/orc/0.4.34/orc/orcsse.h /usr/src/debug/orc/0.4.34/orc/orcparse.c /usr/src/debug/orc/0.4.34/orc/orcemulateopcodes.c /usr/src/debug/orc/0.4.34/orc/orcsse.c /usr/src/debug/orc/0.4.34/orc/orcemulateopcodes.h /usr/src/debug/orc/0.4.34/orc/orcparse.h /usr/src/debug/orc/0.4.34/orc/orcconstant.h /usr/src/debug/orc/0.4.34/orc/orccpu.h /usr/src/debug/orc/0.4.34/orc/orcprogram-altivec.c /usr/src/debug/orc/0.4.34/orc/orccompiler.c /usr/src/debug/orc/0.4.34/orc/orcexecutor.c /usr/src/debug/orc/0.4.34/orc/orcprogram-mips.c /usr/src/debug/orc/0.4.34/orc/orcrule.c /usr/src/debug/orc/0.4.34/orc/opcodes.h /usr/src/debug/orc/0.4.34/orc/orccompiler.h /usr/src/debug/orc/0.4.34/orc/orcexecutor.h /usr/src/debug/orc/0.4.34/orc/orcrule.h /usr/src/debug/orc/0.4.34/orc/orcutils-private.h /usr/src/debug/orc/0.4.34/orc/orccode.h /usr/src/debug/orc/0.4.34/orc/orcprogram-neon
 .c /usr/src/debug/orc/0.4.34/orc/orcarm.c /usr/src/debug/orc/0.4.34/orc/orccode.c /usr/src/debug/orc/0.4.34/orc/orcarm.h", added "/usr/src/debug/orc/0.4.36/orc/orcsse.h /usr/src/debug/orc/0.4.36/orc/orcdebug.h /usr/src/debug/orc/0.4.36/orc/orcsse.c /usr/src/debug/orc/0.4.36/orc/orclimits.h /usr/src/debug/orc/0.4.36/orc/orcopcode.h /usr/src/debug/orc/0.4.36/orc/orctarget.h /usr/src/debug/orc/0.4.36/orc/orcdebug.c /usr/src/debug/orc/0.4.36/orc/orcrules-sse.c /usr/src/debug/orc/0.4.36/orc/orccode.c /usr/src/debug/orc/0.4.36/orc/orcbytecode.h /usr/src/debug/orc/0.4.36/orc/orcvariable.h /usr/src/debug/orc/0.4.36/orc/orcavx.h /usr/src/debug/orc/0.4.36/orc/orccode.h /usr/src/debug/orc/0.4.36/orc/orcavx.c /usr/src/debug/orc/0.4.36/orc/orcrules-altivec.c /usr/src/debug/orc/0.4.36/orc/orcbytecode.c /usr/src/debug/orc/0.4.36/orc/orcfunctions.c /usr/src/debug/orc/0.4.36/orc/orcprogram-mmx.c /usr/src/debug/orc/0.4.36/orc/orcemulateopcodes.c /usr/src/debug/orc/0.4.36/orc/orccpu.h /usr/src/debug/o
 rc/0.4.36/orc/orcprogram-mips.c /usr/src/debug/orc/0.4.36/orc/opcodes.h /usr/src/debug/orc/0.4.36/orc/orcrules-mips.c /usr/src/debug/orc/0.4.36/orc/orcemulateopcodes.h /usr/src/debug/orc/0.4.36/orc/orc.c /usr/src/debug/orc/0.4.36/orc/orconce.h /usr/src/debug/orc/0.4.36/orc/orccpuinsn.h /usr/src/debug/orc/0.4.36/orc/orcneon.h /usr/src/debug/orc/0.4.36/orc/orcpowerpc.h /usr/src/debug/orc/0.4.36/orc/orcprogram.h /usr/src/debug/orc/0.4.36/orc/orcutils.h /usr/src/debug/orc/0.4.36/orc/orcx86insn.h /usr/src/debug/orc/0.4.36/orc/orcutils.c /usr/src/debug/orc/0.4.36/orc/orcx86insn.c /usr/src/debug/orc/0.4.36/orc/orccpu-x86.c /usr/src/debug/orc/0.4.36/orc/orccodemem.c /usr/src/debug/orc/0.4.36/orc/orc.h /usr/src/debug/orc/0.4.36/orc/orconce.c /usr/src/debug/orc/0.4.36/orc/orcinternal.h /usr/src/debug/orc/0.4.36/orc/orcopcodes.c /usr/src/debug/orc/0.4.36/orc/orcpowerpc.c /usr/src/debug/orc/0.4.36/orc/orcprogram.c /usr/src/debug/orc/0.4.36/orc/orcrule.h /usr/src/debug/orc/0.4.36/orc/orcmmx.h /u
 sr/src/debug/orc/0.4.36/orc/orcx86.c /usr/src/debug/orc/0.4.36/orc/orcutils-private.h /usr/src/debug/orc/0.4.36/orc/orcinstruction.h /usr/src/debug/orc/0.4.36/orc/orcmmx.c /usr/src/debug/orc/0.4.36/orc/orcprogram-avx.c /usr/src/debug/orc/0.4.36/orc/orcrule.c /usr/src/debug/orc/0.4.36/orc/orcrules-avx.c /usr/src/debug/orc/0.4.36/orc/orcx86.h /usr/src/debug/orc/0.4.36/orc/orcrules-neon.c /usr/src/debug/orc/0.4.36/orc/orccompiler.c /usr/src/debug/orc/0.4.36/orc/orcexecutor.c /usr/src/debug/orc/0.4.36/orc/orccompiler.h /usr/src/debug/orc/0.4.36/orc/orcexecutor.h /usr/src/debug/orc/0.4.36/orc/orcprogram-neon.c /usr/src/debug/orc/0.4.36/orc/orcprogram-c64x-c.c /usr/src/debug/orc/0.4.36/orc/orcconstant.h /usr/src/debug/orc/0.4.36/orc/orcprogram-c.c /usr/src/debug/orc/0.4.36/orc/orcbytecodes.h /usr/src/debug/orc/0.4.36/orc/orcprogram-sse.c /usr/src/debug/orc/0.4.36/orc/orcprogram-altivec.c /usr/src/debug/orc/0.4.36/orc/orcarm.c /usr/src/debug/orc/0.4.36/orc/orcparse.h /usr/src/debug/orc/0.4
 .36/orc/orcrules-mmx.c /usr/src/debug/orc/0.4.36/orc/orcmips.c /usr/src/debug/orc/0.4.36/orc/orcavx-internal.h /usr/src/debug/orc/0.4.36/orc/orcparse.c /usr/src/debug/orc/0.4.36/orc/orcarm.h /usr/src/debug/orc/0.4.36/orc/orcmips.h"
packages/core2-64-poky-linux/orc/orc-src: PV changed from "0.4.34" to "0.4.36"
packages/core2-64-poky-linux/orc/orc-staticdev: PKGV changed from 0.4.34 [default] to 0.4.36 [default]
packages/core2-64-poky-linux/orc/orc-staticdev: PV changed from "0.4.34" to "0.4.36"
packages/core2-64-poky-linux/orc/orc: PKGV changed from 0.4.34 [default] to 0.4.36 [default]
packages/core2-64-poky-linux/orc/orc: PV changed from "0.4.34" to "0.4.36"
Changes to packages/core2-64-poky-linux/orc (sysroot):
  /usr/lib/liborc-0.4.so.0 changed symlink target from liborc-0.4.so.0.34.0 to liborc-0.4.so.0.36.0
  /usr/lib/liborc-test-0.4.so.0 changed symlink target from liborc-test-0.4.so.0.34.0 to liborc-test-0.4.so.0.36.0
  /usr/lib/liborc-0.4.so.0.34.0 moved to /usr/lib/liborc-0.4.so.0.36.0
  /usr/lib/liborc-test-0.4.so.0.34.0 moved to /usr/lib/liborc-test-0.4.so.0.36.0
  /usr/include/orc-0.4/orc/orcavx.h was added

--===============8454035242623191935==--

