Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id A098D6FEFA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 13:14:33 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id 474054845B628
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 14:14:19 +0100 (IST)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Thu, 8 Sep 2016 14:14:22 +0100
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Sep 2016 14:14:17 +0100
Message-ID: <1473340457-31797-1-git-send-email-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [PATCH] valgrind: MIPS: Make toolchain basename generic
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
X-List-Received-Date: Thu, 08 Sep 2016 13:14:34 -0000
Content-Type: text/plain

For the hard float case, COMPATIBLE_HOST should be set to ".*-linux"
since OE can support multiple distro layers, not just poky.

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>

---
Pointed out by Andre McCurdy but patch v1 had already been accepted
and applied.
---
 meta/recipes-devtools/valgrind/valgrind_3.11.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
index 3d49131..42fd27f 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
@@ -39,8 +39,8 @@ COMPATIBLE_HOST_armv5 = 'null'
 COMPATIBLE_HOST_armv6 = 'null'
 
 # valgrind doesn't like mips soft float
-COMPATIBLE_HOST_mips = "${@bb.utils.contains("TARGET_FPU", "soft", "null", "mips-poky-linux", d)}"
-COMPATIBLE_HOST_mipsel = "${@bb.utils.contains("TARGET_FPU", "soft", "null", "mipsel-poky-linux", d)}"
+COMPATIBLE_HOST_mips = "${@bb.utils.contains("TARGET_FPU", "soft", "null", ".*-linux", d)}"
+COMPATIBLE_HOST_mipsel = "${@bb.utils.contains("TARGET_FPU", "soft", "null", ".*-linux", d)}"
 
 inherit autotools ptest
 
-- 
1.9.1


