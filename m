Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q5fVt-0008Cv-OQ
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 16:39:49 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Q5fTy-0002e5-28 from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 07:37:50 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 1 Apr 2011 07:36:07 -0700
Received: from localhost.localdomain ([172.30.80.69]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 1 Apr 2011 08:37:48 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Apr 2011 07:37:46 -0700
Message-Id: <40f91fb897a0ed40cdd05a71432b70ad4e39d2f9.1301668619.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1301668619.git.tom_rini@mentor.com>
References: <cover.1301668619.git.tom_rini@mentor.com>
X-OriginalArrivalTime: 01 Apr 2011 14:37:48.0720 (UTC)
	FILETIME=[5F632300:01CBF07A]
Subject: [PATCH 2/2] db: Switch to patchdir rather than applying in do_configure
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
X-List-Received-Date: Fri, 01 Apr 2011 14:39:49 -0000

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/recipes-support/db/db_5.1.19.bb |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/db/db_5.1.19.bb b/meta/recipes-support/db/db_5.1.19.bb
index 94ce180..7b7c4dd 100644
--- a/meta/recipes-support/db/db_5.1.19.bb
+++ b/meta/recipes-support/db/db_5.1.19.bb
@@ -17,7 +17,7 @@ CONFLICTS = "db3"
 PR = "r2"
 
 SRC_URI = "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz"
-SRC_URI += "file://arm-thumb-mutex_db5.patch;apply=no"
+SRC_URI += "file://arm-thumb-mutex_db5.patch;patchdir=.."
 
 SRC_URI[md5sum] = "76fcbfeebfcd09ba0b4d96bfdf8d884d"
 SRC_URI[sha256sum] = "0194d4ca9266ba1a1c0bfbc233b18bfd05f63163453c81ebcdfdc7112d5ac850"
@@ -79,10 +79,6 @@ do_configure() {
 	oe_runconf
 }
 
-do_patch_append() {
-	os.system("cd ${S}/.. ; patch -p1 -i ${WORKDIR}/arm-thumb-mutex_db5.patch")
-}
-
 do_install_append() {
 	mkdir -p ${D}/${includedir}/db51
 	#mv ${D}/${includedir}/db_185.h ${D}/${includedir}/db51/.
-- 
1.7.0.4



