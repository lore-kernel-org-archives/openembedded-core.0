Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S8Z9S-0007P6-45 for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 16:33:10 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2GFOJTJ004510
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 15:24:19 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04374-03 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 15:24:13 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2GFOBwB004504
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 15:24:12 GMT
Message-ID: <1331911452.18586.195.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Mar 2012 15:24:12 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] sed: Fix unpackaged files warnings
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
X-List-Received-Date: Fri, 16 Mar 2012 15:33:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

WARNING: For recipe sed, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/bin

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-extended/sed/sed_4.2.1.bb b/meta/recipes-extended/sed/sed_4.2.1.bb
index d775d44..9fbb6e7 100644
--- a/meta/recipes-extended/sed/sed_4.2.1.bb
+++ b/meta/recipes-extended/sed/sed_4.2.1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
                     file://sed/sed.h;beginline=1;endline=17;md5=767ab3a06d7584f6fd0469abaec4412f"
 SECTION = "console/utils"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${GNU_MIRROR}/sed/sed-${PV}.tar.gz"
 
@@ -17,6 +17,7 @@ do_install () {
 	autotools_do_install
 	install -d ${D}${base_bindir}
 	mv ${D}${bindir}/sed ${D}${base_bindir}/sed.${PN}
+	rmdir ${D}${bindir}/
 }
 
 ALTERNATIVE_NAME = "sed"




