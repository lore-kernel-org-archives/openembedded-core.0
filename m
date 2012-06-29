Received: from c-71-193-189-117.hsd1.wa.comcast.net ([71.193.189.117]
	helo=yujin.bigsur.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@yujin.bigsur.com>) id 1SkisK-00087L-Ld
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 23:37:13 +0200
Received: from yujin.bigsur.com (localhost [127.0.0.1])
	by yujin.bigsur.com (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	q5TLLPPd028222 for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 14:21:25 -0700
Received: (from sgw@localhost)
	by yujin.bigsur.com (8.14.4/8.14.4/Submit) id q5TLLP4g028221
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 14:21:25 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jun 2012 14:21:17 -0700
Message-Id: <ec743228cc864a7a017dc4ae6c972470855aa431.1341004548.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1341004548.git.sgw@linux.intel.com>
References: <cover.1341004548.git.sgw@linux.intel.com>
In-Reply-To: <cover.1341004548.git.sgw@linux.intel.com>
References: <cover.1341004548.git.sgw@linux.intel.com>
Subject: [PATCH 5/7] db: use lib_package bbclass
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
X-List-Received-Date: Fri, 29 Jun 2012 21:37:13 -0000

This is a clean-up following the recent addition of PN-bin
to bitbake.conf and lib_package

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/db/db_5.3.15.bb |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-support/db/db_5.3.15.bb b/meta/recipes-support/db/db_5.3.15.bb
index 0df874e..0fc396e 100644
--- a/meta/recipes-support/db/db_5.3.15.bb
+++ b/meta/recipes-support/db/db_5.3.15.bb
@@ -14,7 +14,7 @@ HOMEPAGE = "http://www.oracle.com/technology/products/berkeley-db/db/index.html"
 LICENSE = "Sleepycat"
 VIRTUAL_NAME ?= "virtual/db"
 RCONFLICTS_${PN} = "db3"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz"
 SRC_URI += "file://arm-thumb-mutex_db5.patch;patchdir=.."
@@ -47,8 +47,6 @@ B = "${WORKDIR}/db-${PV}/build_unix"
 # management on the system.
 inherit lib_package
 
-# Package contents
-FILES_${PN}-bin = "${bindir}/*"
 # The dev package has the .so link (as in db3) and the .a's -
 # it is therefore incompatible (cannot be installed at the
 # same time) as the db3 package
-- 
1.7.10.4



