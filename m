Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 00687777F4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 21:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v27LlImU021485; Tue, 7 Mar 2017 21:47:18 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JWmVbL4sW0eV; Tue,  7 Mar 2017 21:47:18 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v27LlEvm021481
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 7 Mar 2017 21:47:15 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1clMws-0001aT-7x; Tue, 07 Mar 2017 21:47:14 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Mar 2017 21:47:11 +0000
Message-Id: <1488923231-6063-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] yocto-uninative: Update to the 1.5 release
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
X-List-Received-Date: Tue, 07 Mar 2017 21:47:22 -0000

This upgrades to a version of patchelf which works on newer distros
and doesn't inflate binaries in crazy ways.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 975edec..80dcfa0 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,6 +6,6 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/1.4/"
-UNINATIVE_CHECKSUM[i686] ?= "b4bc60511ce479736808273ffa043df4ed2a225407dd7ca150ae6220d9ce76d5"
-UNINATIVE_CHECKSUM[x86_64] ?= "101ff8f2580c193488db9e76f9646fb6ed38b65fb76f403acb0e2178ce7127ca"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/1.5/"
+UNINATIVE_CHECKSUM[i686] ?= "fd96bd5cd50fc10f536e86e526d6729878725b66b7cf1dae6cf3cfb5a0b9d24a"
+UNINATIVE_CHECKSUM[x86_64] ?= "5c5a3a74b98c2ad038953b8424bcb169b5574b571f67df11174a01f4e06f437d"
-- 
2.7.4


