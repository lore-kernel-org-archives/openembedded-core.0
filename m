Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id C99587318D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 16:53:31 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id DB3B05ECC5302
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 17:53:16 +0100 (IST)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Wed, 14 Sep 2016 17:53:20 +0100
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Sep 2016 17:53:11 +0100
Message-ID: <1473871991-48873-1-git-send-email-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [Patch] openssl: Fix MIPS64be and add MIPS64le
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
X-List-Received-Date: Wed, 14 Sep 2016 16:53:32 -0000
Content-Type: text/plain

MIPS64 target was being configured for linux-mips which defaults to
MIPS32. Doesn't cause any issue as far as I can see but it would be
wiser to use the correct target configuration.

Also add MIPS64le configuration which is missing.

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 meta/recipes-connectivity/openssl/openssl.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index de8b6ac..f83664c 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -114,7 +114,10 @@ do_configure () {
 		target=debian-mipsel
 		;;
         linux-*-mips64 | linux-mips64)
-               target=linux-mips
+               target=debian-mips64
+                ;;
+        linux-*-mips64el | linux-mips64el)
+               target=debian-mips64el
                 ;;
 	linux-microblaze*|linux-nios2*)
 		target=linux-generic32
-- 
1.9.1


