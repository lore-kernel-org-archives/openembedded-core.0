Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id DB48371A8B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 17:12:43 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id CBB89432BC562
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 17:12:40 +0000 (GMT)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Tue, 8 Nov 2016 17:12:44 +0000
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Nov 2016 17:12:26 +0000
Message-ID: <20161108171235.41837-6-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161108171235.41837-1-Zubair.Kakakhel@imgtec.com>
References: <20161108171235.41837-1-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [Patch v2 05/14] glibc: Reduce duplication in MIPS variants
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
X-List-Received-Date: Tue, 08 Nov 2016 17:12:44 -0000
Content-Type: text/plain

Reduce duplication in MIPS variants now that the MACHINEOVERRIDES
variable is defined

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 meta/recipes-core/glibc/glibc-ld.inc | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-ld.inc b/meta/recipes-core/glibc/glibc-ld.inc
index b982368..e2e2474 100644
--- a/meta/recipes-core/glibc/glibc-ld.inc
+++ b/meta/recipes-core/glibc/glibc-ld.inc
@@ -7,21 +7,8 @@ def ld_append_if_tune_exists(d, infos, dict):
 
 def glibc_dl_info(d):
     ld_info_all = {
-        "mips": ["ld.so.1", "FLAG_ELF_LIBC6"],
-        "mips64-n32": ["ld.so.1", "FLAG_ELF_LIBC6"],
-        "mips64": ["ld.so.1", "FLAG_ELF_LIBC6"],
-        "mipsel": ["ld.so.1", "FLAG_ELF_LIBC6"],
-        "mips64el-n32": ["ld.so.1", "FLAG_ELF_LIBC6"],
-        "mips64el": ["ld.so.1", "FLAG_ELF_LIBC6"],
-        "mips-nf": ["ld.so.1", "FLAG_ELF_LIBC6"],
-        "mipsisa32r6": ["ld-linux-mipsn8.so.1", "FLAG_ELF_LIBC6"],
-        "mipsisa32r6el": ["ld-linux-mipsn8.so.1", "FLAG_ELF_LIBC6"],
-        "mips64-nf-n32": ["ld.so.1", "FLAG_ELF_LIBC6"],
-        "mips64-nf": ["ld.so.1", "FLAG_ELF_LIBC6"],
-        "mips64el-nf-n32": ["ld.so.1", "FLAG_ELF_LIBC6"],
-        "mips64el-nf": ["ld.so.1", "FLAG_ELF_LIBC6"],
-        "mipsisa64r6": ["ld-linux-mipsn8.so.1", "FLAG_ELF_LIBC6"],
-        "mipsisa64r6el": ["ld-linux-mipsn8.so.1", "FLAG_ELF_LIBC6"],
+        "mipsarch": ["ld.so.1", "FLAG_ELF_LIBC6"],
+        "mipsarchr6": ["ld-linux-mipsn8.so.1", "FLAG_ELF_LIBC6"],
         "powerpc": ["ld.so.1", "FLAG_ELF_LIBC6"],
         "powerpc-nf": ["ld.so.1", "FLAG_ELF_LIBC6"],
         "powerpc64": ["ld64.so.1", "FLAG_ELF_LIBC6"],
-- 
2.10.2


