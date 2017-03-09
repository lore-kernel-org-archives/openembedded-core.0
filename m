Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1942F7750B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 22:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v29MHiYZ030274; Thu, 9 Mar 2017 22:17:44 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id L3tmQUHBrQM8; Thu,  9 Mar 2017 22:17:44 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v29MHdT5030266
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 9 Mar 2017 22:17:40 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cm6NP-00055l-GL; Thu, 09 Mar 2017 22:17:39 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Mar 2017 22:17:32 +0000
Message-Id: <1489097854-19523-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489097854-19523-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1489097854-19523-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/5] libpng12: Use rm instead of unlink
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
X-List-Received-Date: Thu, 09 Mar 2017 22:17:45 -0000

Everything else in the system manages fine with rm, use rm instead of unlink
here too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-lsb4/libpng/libpng12_1.2.57.bb | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-lsb4/libpng/libpng12_1.2.57.bb b/meta/recipes-lsb4/libpng/libpng12_1.2.57.bb
index 0d5a2c4..9f74f5f 100644
--- a/meta/recipes-lsb4/libpng/libpng12_1.2.57.bb
+++ b/meta/recipes-lsb4/libpng/libpng12_1.2.57.bb
@@ -24,13 +24,13 @@ inherit autotools binconfig pkgconfig
 do_install_append() {
 	# The follow link files link to corresponding png12*.h and libpng12* files
 	# They conflict with higher verison, so drop them
-	unlink ${D}/${includedir}/png.h
-	unlink ${D}/${includedir}/pngconf.h
+	rm ${D}/${includedir}/png.h
+	rm ${D}/${includedir}/pngconf.h
 
-	unlink ${D}/${libdir}/libpng.la
-	unlink ${D}/${libdir}/libpng.so
-	unlink ${D}/${libdir}/libpng.a || true
-	unlink ${D}/${libdir}/pkgconfig/libpng.pc
+	rm ${D}/${libdir}/libpng.la
+	rm ${D}/${libdir}/libpng.so
+	rm ${D}/${libdir}/libpng.a || true
+	rm ${D}/${libdir}/pkgconfig/libpng.pc
 
-	unlink ${D}/${bindir}/libpng-config
+	rm ${D}/${bindir}/libpng-config
 }
-- 
2.7.4


