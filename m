Return-Path: <Zubair.Kakakhel@imgtec.com>
X-Greylist: delayed 912 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 07 Nov 2016 15:16:52 UTC
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id 97ECC71A61
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 15:16:52 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id CB7384F7D95F0;
	Mon,  7 Nov 2016 15:01:39 +0000 (GMT)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Mon, 7 Nov 2016 15:01:42 +0000
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Nov 2016 15:01:26 +0000
Message-ID: <20161107150135.40266-5-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161107150135.40266-1-Zubair.Kakakhel@imgtec.com>
References: <20161107150135.40266-1-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [Patch 04/13] glibc: Reduce duplication in MIPS variants
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
X-List-Received-Date: Mon, 07 Nov 2016 15:16:52 -0000
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


