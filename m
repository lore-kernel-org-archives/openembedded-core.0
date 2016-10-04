Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp02.imgtec.com [217.156.133.132])
	by mail.openembedded.org (Postfix) with ESMTP id BC0A171A0B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 11:31:32 +0000 (UTC)
Received: from HHMAIL03.hh.imgtec.org (unknown [10.44.0.21])
	by Forcepoint Email with ESMTPS id BE6E8E443C3FF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 12:31:30 +0100 (IST)
Received: from HHMAIL01.hh.imgtec.org (10.100.10.19) by HHMAIL03.hh.imgtec.org
	(10.44.0.21) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Tue, 4 Oct 2016 12:31:33 +0100
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Tue, 4 Oct 2016 12:31:33 +0100
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Oct 2016 12:31:19 +0100
Message-ID: <1475580681-55081-8-git-send-email-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1475580681-55081-1-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1475580681-55081-1-git-send-email-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [PATCH 7/9] glibc: Add mipsisa{32, 64}r6{el, } support
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

The loader is located at a new place for multiarch.
For more details, check https://wiki.debian.org/Multiarch
and https://sourceware.org/glibc/wiki/ABIList#mips

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 meta/recipes-core/glibc/glibc-ld.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc-ld.inc b/meta/recipes-core/glibc/glibc-ld.inc
index c5f4db2..b982368 100644
--- a/meta/recipes-core/glibc/glibc-ld.inc
+++ b/meta/recipes-core/glibc/glibc-ld.inc
@@ -14,10 +14,14 @@ def glibc_dl_info(d):
         "mips64el-n32": ["ld.so.1", "FLAG_ELF_LIBC6"],
         "mips64el": ["ld.so.1", "FLAG_ELF_LIBC6"],
         "mips-nf": ["ld.so.1", "FLAG_ELF_LIBC6"],
+        "mipsisa32r6": ["ld-linux-mipsn8.so.1", "FLAG_ELF_LIBC6"],
+        "mipsisa32r6el": ["ld-linux-mipsn8.so.1", "FLAG_ELF_LIBC6"],
         "mips64-nf-n32": ["ld.so.1", "FLAG_ELF_LIBC6"],
         "mips64-nf": ["ld.so.1", "FLAG_ELF_LIBC6"],
         "mips64el-nf-n32": ["ld.so.1", "FLAG_ELF_LIBC6"],
         "mips64el-nf": ["ld.so.1", "FLAG_ELF_LIBC6"],
+        "mipsisa64r6": ["ld-linux-mipsn8.so.1", "FLAG_ELF_LIBC6"],
+        "mipsisa64r6el": ["ld-linux-mipsn8.so.1", "FLAG_ELF_LIBC6"],
         "powerpc": ["ld.so.1", "FLAG_ELF_LIBC6"],
         "powerpc-nf": ["ld.so.1", "FLAG_ELF_LIBC6"],
         "powerpc64": ["ld64.so.1", "FLAG_ELF_LIBC6"],
-- 
1.9.1


