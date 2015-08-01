Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 665737666B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Aug 2015 09:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7196USJ018796; Sat, 1 Aug 2015 10:06:30 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4gFzoYCSqWml; Sat,  1 Aug 2015 10:06:30 +0100 (BST)
Received: from ted (5751f4a1.skybroadband.com [87.81.244.161])
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7196OBN018778
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 1 Aug 2015 10:06:26 +0100
Received: from richard by ted with local (Exim 4.84_RC1)
	(envelope-from <richard@dan.rpsys.net>)
	id 1ZLSkF-0000tX-KP; Sat, 01 Aug 2015 10:06:19 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Aug 2015 10:06:10 +0100
Message-Id: <1438419973-3394-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 1/4] libmpc: 1.0.2 -> 1.0.3
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
X-List-Received-Date: Sat, 01 Aug 2015 09:06:33 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/libmpc/{libmpc_1.0.2.bb => libmpc_1.0.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libmpc/{libmpc_1.0.2.bb => libmpc_1.0.3.bb} (64%)

diff --git a/meta/recipes-support/libmpc/libmpc_1.0.2.bb b/meta/recipes-support/libmpc/libmpc_1.0.3.bb
similarity index 64%
rename from meta/recipes-support/libmpc/libmpc_1.0.2.bb
rename to meta/recipes-support/libmpc/libmpc_1.0.3.bb
index 41177eb..f3e5a18 100644
--- a/meta/recipes-support/libmpc/libmpc_1.0.2.bb
+++ b/meta/recipes-support/libmpc/libmpc_1.0.3.bb
@@ -5,8 +5,8 @@ DEPENDS = "gmp mpfr"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
 SRC_URI = "http://www.multiprecision.org/mpc/download/mpc-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "68fadff3358fb3e7976c7a398a0af4c3"
-SRC_URI[sha256sum] = "b561f54d8a479cee3bc891ee52735f18ff86712ba30f036f8b8537bae380c488"
+SRC_URI[md5sum] = "d6a1d5f8ddea3abd2cc3e98f58352d26"
+SRC_URI[sha256sum] = "617decc6ea09889fb08ede330917a00b16809b8db88c29c31bfbb49cbf88ecc3"
 
 S = "${WORKDIR}/mpc-${PV}"
 BBCLASSEXTEND = "native nativesdk"
-- 
2.1.0


