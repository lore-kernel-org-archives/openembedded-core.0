Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id 05C0077512
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 15:10:29 +0000 (UTC)
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Forcepoint Email with ESMTPS id AF65EBC92BC83
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 15:10:26 +0000 (GMT)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	hhmail02.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Thu, 2 Mar 2017 15:10:29 +0000
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 2 Mar 2017 15:10:22 +0000
Message-ID: <20170302151022.7237-1-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [Patch][Morty] openssl: Add support for many MIPS configurations
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
X-List-Received-Date: Thu, 02 Mar 2017 15:10:30 -0000
Content-Type: text/plain

Add more case statements to catch MIPS tune configurations

(From OE-Core rev: cd1f6fbf9a2113cf510c25de2eb3895468e79149)

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/openssl/openssl.inc | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index f3a2c5a..2ef8b38 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -107,18 +107,24 @@ do_configure () {
 	linux-gnu64-x86_64)
 		target=linux-x86_64
 		;;
-	linux-mips)
-		target=debian-mips
+	linux-gnun32-mips*el)
+		target=debian-mipsn32el
+		;;
+	linux-gnun32-mips*)
+		target=debian-mipsn32
+		;;
+	linux-mips*64*el)
+		target=debian-mips64el
 		;;
-	linux-mipsel)
+	linux-mips*64*)
+		target=debian-mips64
+		;;
+	linux-mips*el)
 		target=debian-mipsel
 		;;
-        linux-*-mips64 | linux-mips64)
-               target=debian-mips64
-                ;;
-        linux-*-mips64el | linux-mips64el)
-               target=debian-mips64el
-                ;;
+	linux-mips*)
+		target=debian-mips
+		;;
 	linux-microblaze*|linux-nios2*)
 		target=linux-generic32
 		;;
-- 
2.10.2


