Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QeEWy-0006xw-RG
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 00:55:49 +0200
Received: by rex (Postfix, from userid 1000)
	id 3A0B131337; Tue,  5 Jul 2011 23:51:26 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2011 23:51:14 +0100
Message-Id: <1e134055b8c00dd2f93a40a50cf69377c7b325c0.1309906154.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <696f00b67217242f3a372d070c2473f8ced639ed.1309906154.git.richard.purdie@linuxfoundation.org>
References: <696f00b67217242f3a372d070c2473f8ced639ed.1309906154.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1309906154.git.richard.purdie@linuxfoundation.org>
References: <cover.1309906154.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 13/17] apt: Package unpackaged files
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
X-List-Received-Date: Tue, 05 Jul 2011 22:55:49 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/apt/apt-package.inc |    2 +-
 meta/recipes-devtools/apt/apt_0.7.14.bb   |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/apt/apt-package.inc b/meta/recipes-devtools/apt/apt-package.inc
index 9e104f1..2e3be38 100644
--- a/meta/recipes-devtools/apt/apt-package.inc
+++ b/meta/recipes-devtools/apt/apt-package.inc
@@ -62,7 +62,7 @@ FILES_${PN}-utils = "${bindir}/apt-sortpkgs ${bindir}/apt-extracttemplates"
 FILES_${PN}-doc = "${@get_files_apt_doc(d, bb, bb.data.getVar('apt-manpages', d, 1))} \
 		   ${docdir}/apt"
 FILES_${PN}-utils-doc = "${@get_files_apt_doc(d, bb, bb.data.getVar('apt-utils-manpages', d, 1))}"
-FILES_${PN}-dev = "${libdir}/libapt*.so"
+FILES_${PN}-dev = "${libdir}/libapt*.so ${includedir}"
 
 do_install () {
 	set -x
diff --git a/meta/recipes-devtools/apt/apt_0.7.14.bb b/meta/recipes-devtools/apt/apt_0.7.14.bb
index aa155d9..1335c16 100644
--- a/meta/recipes-devtools/apt/apt_0.7.14.bb
+++ b/meta/recipes-devtools/apt/apt_0.7.14.bb
@@ -3,10 +3,10 @@ RDEPENDS_${PN} = "dpkg"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
 require apt.inc
 
-PR = "r6"
+PR = "r7"
 
 SRC_URI += "file://nodoc.patch \
-	    file://includes-fix.patch "
+            file://includes-fix.patch "
 
 SRC_URI[md5sum] = "19efa18fb1ef20c58b9b44e94258b814"
 SRC_URI[sha256sum] = "8fc06effaf8a4e4333308eedcdc6840f1c8056f2e924210f151dfc076bcd4045"
-- 
1.7.4.1



