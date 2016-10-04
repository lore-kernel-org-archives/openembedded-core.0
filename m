Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp02.imgtec.com [217.156.133.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7C5736FF5D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 11:31:33 +0000 (UTC)
Received: from HHMAIL03.hh.imgtec.org (unknown [10.44.0.21])
	by Forcepoint Email with ESMTPS id 6DF7413291EC7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 12:31:31 +0100 (IST)
Received: from HHMAIL01.hh.imgtec.org (10.100.10.19) by HHMAIL03.hh.imgtec.org
	(10.44.0.21) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Tue, 4 Oct 2016 12:31:34 +0100
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Tue, 4 Oct 2016 12:31:33 +0100
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Oct 2016 12:31:20 +0100
Message-ID: <1475580681-55081-9-git-send-email-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1475580681-55081-1-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1475580681-55081-1-git-send-email-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [PATCH 8/9] gcc-configure: Add mipsisa{32, 64}r6{el, } support
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
X-List-Received-Date: Tue, 04 Oct 2016 11:31:33 -0000
Content-Type: text/plain

Add support for MIPS Release 6 ISA

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 meta/recipes-devtools/gcc/gcc-configure-common.inc | 4 ++++
 meta/recipes-devtools/gcc/gcc-runtime.inc          | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index b374c30..ddebbb8 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -61,6 +61,10 @@ EXTRA_OECONF_append_mips64 = " --with-abi=64 --with-arch-64=mips64 --with-tune-6
 EXTRA_OECONF_append_mips64el = " --with-abi=64 --with-arch-64=mips64 --with-tune-64=mips64"
 EXTRA_OECONF_append_mips64n32 = " --with-abi=64 --with-arch-64=mips64 --with-tune-64=mips64"
 EXTRA_OECONF_append_mips64eln32 = " --with-abi=64 --with-arch-64=mips64 --with-tune-64=mips64"
+EXTRA_OECONF_append_mipsisa32r6el = " --with-abi=32 --with-arch=mips32r6"
+EXTRA_OECONF_append_mipsisa32r6 = " --with-abi=32 --with-arch=mips32r6"
+EXTRA_OECONF_append_mipsisa64r6el = " --with-abi=64 --with-arch-64=mips64r6"
+EXTRA_OECONF_append_mipsisa64r6 = " --with-abi=64 --with-arch-64=mips64r6"
 
 # ARMv6+ adds atomic instructions that affect the ABI in libraries built
 # with TUNE_CCARGS in gcc-runtime.  Make the compiler default to a
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 9791e21..321a6de 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -21,6 +21,10 @@ RUNTIMELIBITM_mips = ""
 RUNTIMELIBITM_mipsel = ""
 RUNTIMELIBITM_mips64 = ""
 RUNTIMELIBITM_mips64el = ""
+RUNTIMELIBITM_mipsisa32r6 = ""
+RUNTIMELIBITM_mipsisa32r6el = ""
+RUNTIMELIBITM_mipsisa64r6 = ""
+RUNTIMELIBITM_mipsisa64r6el = ""
 RUNTIMELIBITM_nios2 = ""
 RUNTIMELIBITM_microblaze = ""
 
-- 
1.9.1


