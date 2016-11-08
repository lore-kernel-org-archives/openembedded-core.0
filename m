Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4A98171A88
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 17:12:49 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id 6205326ECC54D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 17:12:46 +0000 (GMT)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Tue, 8 Nov 2016 17:12:49 +0000
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Nov 2016 17:12:35 +0000
Message-ID: <20161108171235.41837-15-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161108171235.41837-1-Zubair.Kakakhel@imgtec.com>
References: <20161108171235.41837-1-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [Patch v2 14/14] webkit: Reduce duplication in MIPS variants.
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
X-List-Received-Date: Tue, 08 Nov 2016 17:12:49 -0000
Content-Type: text/plain

Reduce duplication in MIPS variants now that the MACHINEOVERRIDES
variable is defined

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.14.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb
index a2586de..a67ff0a 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb
@@ -82,8 +82,7 @@ EXTRA_OECMAKE_append_mips64 = " -DUSE_LD_GOLD=OFF "
 EXTRA_OECMAKE_append_toolchain-clang = " -DUSE_LD_GOLD=OFF "
 
 # JIT not supported on MIPS either
-EXTRA_OECMAKE_append_mips = " -DENABLE_JIT=OFF "
-EXTRA_OECMAKE_append_mips64 = " -DENABLE_JIT=OFF "
+EXTRA_OECMAKE_append_mipsarch = " -DENABLE_JIT=OFF "
 
 SECURITY_CFLAGS_remove_aarch64 = "-fpie"
 SECURITY_CFLAGS_append_aarch64 = " -fPIE"
-- 
2.10.2


