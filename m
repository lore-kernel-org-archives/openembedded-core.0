Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S8Vm5-00029v-6F
	for openembedded-core@openembedded.org; Fri, 16 Mar 2012 12:56:49 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2GBm1bU002354
	for <openembedded-core@openembedded.org>; Fri, 16 Mar 2012 11:48:01 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00526-10 for <openembedded-core@openembedded.org>;
	Fri, 16 Mar 2012 11:47:57 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2GBlrnN002348
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@openembedded.org>; Fri, 16 Mar 2012 11:47:54 GMT
Message-ID: <1331898473.18586.178.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@openembedded.org>
Date: Fri, 16 Mar 2012 11:47:53 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] make: Fix license warning
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
X-List-Received-Date: Fri, 16 Mar 2012 11:56:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

WARNING: make: No generic license file exists for: GPL in any provider

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/make/make.inc b/meta/recipes-devtools/make/make.inc
index 5c52c2a..6bfe576 100644
--- a/meta/recipes-devtools/make/make.inc
+++ b/meta/recipes-devtools/make/make.inc
@@ -4,7 +4,6 @@ program from the program's source files.  Make gets its knowledge of how to buil
 called the makefile, which lists each of the non-source files and how to compute it from other files."
 HOMEPAGE = "http://www.gnu.org/software/make/"
 SECTION = "devel"
-LICENSE = "GPL"
 
 SRC_URI = "${GNU_MIRROR}/make/make-${PV}.tar.bz2 \
            file://SCCS.patch"
diff --git a/meta/recipes-devtools/make/make_3.82.bb b/meta/recipes-devtools/make/make_3.82.bb
index bea3339..2b512bd 100644
--- a/meta/recipes-devtools/make/make_3.82.bb
+++ b/meta/recipes-devtools/make/make_3.82.bb
@@ -1,5 +1,5 @@
 PR = "r1"
-LICENSE="GPLv3&LGPLv2"
+LICENSE = "GPLv3 & LGPLv2"
 LIC_FILES_CHKSUM = "file://tests/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://glob/COPYING.LIB;md5=4a770b67e6be0f60da244beb2de0fce4"
 require make.inc




