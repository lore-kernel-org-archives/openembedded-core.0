Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D87C25B7A
	for <webhook@archiver.kernel.org>; Sat, 25 May 2024 10:49:36 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.9073.1716634168781230754
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 May 2024 03:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Zu0lqA4s;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20240525104925eb81ef1ef636cda2e1-h1zgbg@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20240525104925eb81ef1ef636cda2e1
        for <openembedded-core@lists.openembedded.org>;
        Sat, 25 May 2024 12:49:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=sXS0imiOR8i4HWYXC8WYjD8NEI2SidZRqneCqA0TOXQ=;
 b=Zu0lqA4smXbQKMwlJM0fZnRowXA0owANXutI1WtdZZw+WiECJTLf14WWob6P+Qb5tGvmlv
 pXIodF7KkFr3t60gd4KieJNJGMsN3eEMBZhpqd92LsWgwCOO7Dvb1DNZLCH8ECTLsBXfNT3I
 5NVVkcIlslFG4XRw/s/wZ0eMHIA5s=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 1/6] llvm: Upgrade to 18.1.4
Date: Sat, 25 May 2024 12:48:33 +0200
Message-Id: <20240525104838.619254-2-peter.marko@siemens.com>
In-Reply-To: <20240525104838.619254-1-peter.marko@siemens.com>
References: <20240525104838.619254-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 May 2024 10:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199870

From: Khem Raj <raj.khem@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

Brings following fixes

* e6c3289804a6 [CMake][Release] Disable PGO (#88465) (#89000)
* 028e425f86cc [MIPS] Fix the opcode of max.fmt and mina.fmt (#85609)
* e3c832b37b0a Fix override keyword being print to the left side
* 1deeee3f5da4 Revert "[Mips] Fix missing sign extension in expansion of sub-word atomic max (#77072)"
* 995539ce05ba [LLD] [COFF] Don't add pseudo relocs for dangling references (#88487)
* db67e6fb9ad1 [libc++] Fix -Wgnu-include-next in stddef.h (#88214)
* 647fbc710840 [SelectionDAG] Prevent combination on inconsistent type in `combineCarryDiamond` (#84888)
* eaae766a20fd [RISCV] Support rv{32, 64}e in the compiler builtins (#88252)
* c24b41d71f2e github-upload-release.py: Fix bug preventing release creation (#84571)
* c837970dd7e9 [Codegen][X86] Fix /HOTPATCH with clang-cl and inline asm (#87639)
* d0ddcce21d91 [InstSimplify] Make sure the simplified value doesn't generate poison in threadBinOpOverSelect (#87075)
* 4056cc29dfd3 Prepend all library intrinsics with `#` when building for Arm64EC (#87542)
* 6e071cf30599 [SLP]Fix a crash if the argument of call was affected by minbitwidth analysis.
* d89da2ac8839 [libcxx] coerce formatter precision to int (#87738)
* b6ebea7972cd [SPARC] Implement L and H inline asm argument modifiers (#87259)
* bffecba7ce4c [libc++] Simplify the implementation of <stddef.h> (#86843)
* 9899a2d76c8f [lit][ci] Publish lit wheels (#88072)
* 3ceccbdb1995 [clang-format] Correctly annotate braces of empty ctors/dtors (#82097)
* 429d62872525 [Headers] Don't declare unreachable() from stddef.h in C++ (#86748)
* feba8727f805 [ConstantRange] Fix off by 1 bugs in UIToFP and SIToFP handling. (#86041)
* e4259b583c92 [Float2Int] Pre-commit test for SIToFP/UIToFP ConstantRange bug. NFC
* daca56d8e162 Bump version to 18.1.4 (#87715)

(From OE-Core rev: adc2651a8e902af24fee6ff30a72f4b7c63bef6f)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index c4fd73f2d7..e7fa88b30e 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -17,14 +17,14 @@ inherit cmake pkgconfig
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
-PV = "18.1.3${VER_SUFFIX}"
+PV = "18.1.4${VER_SUFFIX}"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "c13b7485b87909fcf739f62cfa382b55407433c0"
+SRCREV = "e6c3289804a67ea0bb6a86fadbe454dd93b8d855"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-- 
2.30.2


