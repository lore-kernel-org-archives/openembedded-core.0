Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S8Z7y-0007IJ-4Y for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 16:31:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2GFMoWs004487
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 15:22:50 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04374-02 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 15:22:46 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2GFMgFG004477
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 15:22:43 GMT
Message-ID: <1331911362.18586.193.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Mar 2012 15:22:42 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] unzip: Fix unpackaged files warnings
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
X-List-Received-Date: Fri, 16 Mar 2012 15:31:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

WARNING: For recipe unzip, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/man

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index 79e450d..e11f9f7 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94caec5a51ef55ef711ee4e8b1c69e29"
 PE = "1"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "ftp://ftp.info-zip.org/pub/infozip/src/unzip60.tgz \
 	file://avoid-strip.patch"
@@ -26,6 +26,7 @@ do_install() {
         oe_runmake -f unix/Makefile install prefix=${D}${prefix}
 	install -d ${D}${mandir}
 	mv ${D}${prefix}/man/* ${D}${mandir}
+	rmdir ${D}${prefix}/man/
 }
 
 BBCLASSEXTEND = "native"




