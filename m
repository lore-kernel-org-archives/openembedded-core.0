Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id 62A3C71A6A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 15:16:53 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id BB160628FCA3;
	Mon,  7 Nov 2016 15:01:40 +0000 (GMT)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Mon, 7 Nov 2016 15:01:43 +0000
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Nov 2016 15:01:27 +0000
Message-ID: <20161107150135.40266-6-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161107150135.40266-1-Zubair.Kakakhel@imgtec.com>
References: <20161107150135.40266-1-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [Patch 05/13] packagegroup: Reduce duplication in MIPS variants.
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
X-List-Received-Date: Mon, 07 Nov 2016 15:16:53 -0000
Content-Type: text/plain

Reduce duplication in MIPS variants now that the MACHINEOVERRIDES
variable is defined

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-sdk.bb       |  5 +----
 .../packagegroups/packagegroup-core-tools-profile.bb           | 10 ++--------
 2 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index aceba78..327cd8e 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -28,10 +28,7 @@ RDEPENDS_packagegroup-core-sdk = "\
 
 SANITIZERS = "libasan-dev libubsan-dev"
 SANITIZERS_aarch64 = ""
-SANITIZERS_mips = ""
-SANITIZERS_mipsel = ""
-SANITIZERS_mips64 = ""
-SANITIZERS_mips64n32 = ""
+SANITIZERS_mipsarch = ""
 SANITIZERS_nios2 = ""
 SANITIZERS_powerpc64 = ""
 SANITIZERS_sparc = ""
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index dd98445..31ad82b 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -36,10 +36,7 @@ PERF_libc-musl = ""
 SYSTEMTAP = "systemtap"
 SYSTEMTAP_libc-uclibc = ""
 SYSTEMTAP_libc-musl = ""
-SYSTEMTAP_mips = ""
-SYSTEMTAP_mipsel = ""
-SYSTEMTAP_mips64 = ""
-SYSTEMTAP_mips64n32 = ""
+SYSTEMTAP_mipsarch = ""
 SYSTEMTAP_nios2 = ""
 SYSTEMTAP_aarch64 = ""
 
@@ -65,10 +62,7 @@ BABELTRACE = "babeltrace"
 VALGRIND = "valgrind"
 VALGRIND_libc-uclibc = ""
 VALGRIND_libc-musl = ""
-VALGRIND_mips = ""
-VALGRIND_mipsel = ""
-VALGRIND_mips64 = ""
-VALGRIND_mips64n32 = ""
+VALGRIND_mipsarch = ""
 VALGRIND_nios2 = ""
 VALGRIND_armv4 = ""
 VALGRIND_armv5 = ""
-- 
2.10.2


