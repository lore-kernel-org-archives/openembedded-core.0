Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1RmUpq-0004dS-2W
	for openembedded-core@lists.openembedded.org;
	Sun, 15 Jan 2012 19:29:43 +0100
Received: from compute5.internal (compute5.nyi.mail.srv.osa [10.202.2.45])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 726D521115
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jan 2012 13:14:23 -0500 (EST)
Received: from frontend1.nyi.mail.srv.osa ([10.202.2.160])
	by compute5.internal (MEProxy); Sun, 15 Jan 2012 13:14:23 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:date:content-type
	:message-id:mime-version; s=smtpout; bh=0UrxPpcwKTQbHgHIeHnogPSj
	6oU=; b=ffaM56HL5EuMGMPap7Ls6tBxl7Hyx/8GkyMPwdoSlychUz3Hvy+ZTg7F
	Fip1W9tPANPSZDAKBXmZBpLIQYuM1JYUgeNmw5cx8jNBPh/vOhU5UfHh2vXFXtMv
	mEerTcWlTtaSzyGXUZOBHItbL0G69yejhGdFfgg9wJgWEzNy6WI=
X-Sasl-enc: 2ftnfacOfBKCis3AamR7rCow/CHzRgaryMfWF6aI6fke 1326651261
Received: from [192.168.69.14] (236.sub-97-165-253.myvzw.com [97.165.253.236])
	by mail.messagingengine.com (Postfix) with ESMTPA id EA89E8E016B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jan 2012 13:14:20 -0500 (EST)
From: Colin Walters <walters@verbum.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Jan 2012 13:13:59 -0500
X-Mailer: Evolution 3.0.3 (3.0.3-1.fc15) 
Message-ID: <1326651241.9066.0.camel@lenny>
Mime-Version: 1.0
Subject: [PATCH] libtool: Put all libltdl headers in the correct libltdl-dev package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Jan 2012 18:29:43 -0000
X-Groupsio-MsgNum: 16008
Content-Type: multipart/mixed; boundary="=-+CxVkNxWKUSIxSOGBVXM"

--=-+CxVkNxWKUSIxSOGBVXM
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

See attached.


--=-+CxVkNxWKUSIxSOGBVXM
Content-Disposition: attachment;
	filename*0=0001-libtool-Put-all-libltdl-headers-in-the-correct-liblt.pat;
	filename*1=ch
Content-Type: text/x-patch;
	name="0001-libtool-Put-all-libltdl-headers-in-the-correct-liblt.patch";
	charset="UTF-8"
Content-Transfer-Encoding: 7bit

From e525d755da98d9f6accab007ed46fee52f4b6e44 Mon Sep 17 00:00:00 2001
From: Colin Walters <walters@verbum.org>
Date: Sun, 15 Jan 2012 13:11:43 -0500
Subject: [PATCH] libtool: Put all libltdl headers in the correct libltdl-dev
 package

/usr/include/ltdl.h was in libtldl-dev, but not the headers it depends
on.
---
 meta/recipes-devtools/libtool/libtool-2.4.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.inc b/meta/recipes-devtools/libtool/libtool-2.4.inc
index e3d17b7..d4f6011 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.inc
@@ -4,10 +4,10 @@ DEPENDS = "libtool-native"
 PACKAGES =+ "libltdl libltdl-dev libltdl-dbg"
 FILES_${PN} += "${datadir}/aclocal*"
 FILES_libltdl = "${libdir}/libltdl.so.*"
-FILES_libltdl-dev = "${libdir}/libltdl.* ${includedir}/ltdl.h"
+FILES_libltdl-dev = "${libdir}/libltdl.* ${includedir}/ltdl.h ${includedir}/libltdl/*.h"
 FILES_libltdl-dbg = "${libdir}/.debug/"
 
 SRC_URI[md5sum] = "b32b04148ecdd7344abc6fe8bd1bb021"
 SRC_URI[sha256sum] = "13df57ab63a94e196c5d6e95d64e53262834fe780d5e82c28f177f9f71ddf62e"
 
-EXTRA_OECONF = "--with-sysroot"
\ No newline at end of file
+EXTRA_OECONF = "--with-sysroot"
-- 
1.7.6.4


--=-+CxVkNxWKUSIxSOGBVXM--
