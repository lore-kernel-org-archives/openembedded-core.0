Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Ptcyf-0007Da-VC
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:49 +0100
Received: by mail-wy0-f175.google.com with SMTP id 38so2800543wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:30:24 -0800 (PST)
Received: by 10.227.134.135 with SMTP id j7mr3831810wbt.12.1298799023923;
	Sun, 27 Feb 2011 01:30:23 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id y29sm2267175wbd.16.2011.02.27.01.30.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:30:23 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:58 +0100
Message-Id: <1ecf7dd63f8be5421aac552352c4d71f4299ee58.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 45/50] libxml-parser-perl: remove FILES_${PN}
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
X-List-Received-Date: Sun, 27 Feb 2011 09:36:29 -0000

From: Jingdong Lu <jingdong.lu@windriver.com>

Because of the error path in FILES_${PN} we got nothing in libxml-parser-perl package.
Romove "FILES_${PN}"

[sgw Bump PR]
Signed-off-by: Jingdong Lu <jingdong.lu@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../perl/libxml-parser-perl_2.36.bb                |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.36.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.36.bb
index 5742879..3287d26 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.36.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.36.bb
@@ -3,6 +3,8 @@ LICENSE = "Artistic"
 LIC_FILES_CHKSUM = "file://README;endline=6;md5=fa7bbbd54d37d6ecf4ef33b7c98b9cd7"
 DEPENDS += "expat expat-native"
 
+PR = "r1"
+
 SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Parser-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "1b868962b658bd87e1563ecd56498ded"
@@ -19,7 +21,3 @@ do_compile() {
 	cpan_do_compile
 }
 
-
-
-FILES_${PN} = "${PERLLIBDIRS}/auto/XML/Parser/Expat/* \
-                ${PERLLIBDIRS}/XML"
-- 
1.6.6.1



