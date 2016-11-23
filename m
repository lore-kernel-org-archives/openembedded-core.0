Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4711A6072C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 13:47:41 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id 253EF80DB0897
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 13:47:38 +0000 (GMT)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Wed, 23 Nov 2016 13:47:40 +0000
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Nov 2016 13:47:27 +0000
Message-ID: <20161123134733.38276-2-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123134733.38276-1-Zubair.Kakakhel@imgtec.com>
References: <20161123134733.38276-1-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [Patch 1/7] webkitgtk: Use MIPS MACHINE_OVERRIDES
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
X-List-Received-Date: Wed, 23 Nov 2016 13:47:42 -0000
Content-Type: text/plain

The mipsarch* MACHINE_OVERRIDES can be used to pass the same
parameters to MIPS pre-R2 and R6 ISA variants.

Use them to reduce duplication in supporting MIPS R6 ISA.

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.14.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb
index 1f2166c..3637e05 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb
@@ -77,8 +77,7 @@ EXTRA_OECMAKE_append_armv4 = " -DENABLE_JIT=OFF "
 # binutils 2.25.1 has a bug on aarch64:
 # https://sourceware.org/bugzilla/show_bug.cgi?id=18430
 EXTRA_OECMAKE_append_aarch64 = " -DUSE_LD_GOLD=OFF "
-EXTRA_OECMAKE_append_mips = " -DUSE_LD_GOLD=OFF "
-EXTRA_OECMAKE_append_mips64 = " -DUSE_LD_GOLD=OFF "
+EXTRA_OECMAKE_append_mipsarch = " -DUSE_LD_GOLD=OFF "
 EXTRA_OECMAKE_append_toolchain-clang = " -DUSE_LD_GOLD=OFF "
 
 # JIT not supported on MIPS either
@@ -106,4 +105,5 @@ ARM_INSTRUCTION_SET_armv7ve = "thumb"
 
 # WebKit2-4.0: ../../libgpg-error-1.21/src/posix-lock.c:119: get_lock_object: Assertion `!"sizeof lock obj"' failed.
 # qemu: uncaught target signal 6 (Aborted) - core dumped
-EXTRA_OECMAKE_append_mips64 = " -DENABLE_INTROSPECTION=OFF -DENABLE_GTKDOC=OFF"
+EXTRA_OECMAKE_append_mipsarchn32 = " -DENABLE_INTROSPECTION=OFF -DENABLE_GTKDOC=OFF"
+EXTRA_OECMAKE_append_mipsarchn64 = " -DENABLE_INTROSPECTION=OFF -DENABLE_GTKDOC=OFF"
-- 
2.10.2


