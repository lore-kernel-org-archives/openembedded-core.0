Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S8XZl-0004zf-Mj for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 14:52:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2GDhPnm003420
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 13:43:25 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01393-10 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 13:43:19 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2GDhGLp003405
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 13:43:18 GMT
Message-ID: <1331905397.18586.181.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Mar 2012 13:43:17 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] grep: Fix QA warnings
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
X-List-Received-Date: Fri, 16 Mar 2012 13:52:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

WARNING: For recipe grep, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/bin

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-extended/grep/grep_2.9.bb b/meta/recipes-extended/grep/grep_2.9.bb
index 9099bed..1bc79f2 100644
--- a/meta/recipes-extended/grep/grep_2.9.bb
+++ b/meta/recipes-extended/grep/grep_2.9.bb
@@ -6,7 +6,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8006d9c814277c1bfc4ca22af94b59ee"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.gz"
 
@@ -27,6 +27,7 @@ do_install () {
 	mv ${D}${bindir}/grep ${D}${base_bindir}/grep.${PN}
 	mv ${D}${bindir}/egrep ${D}${base_bindir}/egrep.${PN}
 	mv ${D}${bindir}/fgrep ${D}${base_bindir}/fgrep.${PN}
+	rmdir ${D}${bindir}/
 }
 
 pkg_postinst_${PN} () {




