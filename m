Received: from c-71-193-189-117.hsd1.wa.comcast.net ([71.193.189.117]
	helo=yujin.bigsur.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@yujin.bigsur.com>) id 1SkisJ-00087L-Nw
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 23:37:12 +0200
Received: from yujin.bigsur.com (localhost [127.0.0.1])
	by yujin.bigsur.com (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	q5TLLOha028206 for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 14:21:24 -0700
Received: (from sgw@localhost)
	by yujin.bigsur.com (8.14.4/8.14.4/Submit) id q5TLLNR7028205
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 14:21:23 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jun 2012 14:21:13 -0700
Message-Id: <d273d0ea0fd0059499c54b68ba420043a31f2bb7.1341004548.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1341004548.git.sgw@linux.intel.com>
References: <cover.1341004548.git.sgw@linux.intel.com>
In-Reply-To: <cover.1341004548.git.sgw@linux.intel.com>
References: <cover.1341004548.git.sgw@linux.intel.com>
Subject: [PATCH 1/7] bitbake.conf: Add PACKAGE_BEFORE_PN to PACKAGES
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
X-List-Received-Date: Fri, 29 Jun 2012 21:37:12 -0000

By doing this we can easily add addtional packages that can be
greedy before PN, but after some of the other standard packages.

This will also allow us to simplify the lib_package class to set
this variable.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/bitbake.conf |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9377ee6..df4907e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -254,7 +254,8 @@ SOLIBSDEV_darwin = ".dylib"
 SOLIBSDEV_darwin8 = ".dylib"
 SOLIBSDEV_darwin9 = ".dylib"
 
-PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PN}"
+PACKAGE_BEFORE_PN ?= ""
+PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
 PACKAGES_DYNAMIC = "${PN}-locale-*"
 FILES = ""
 
-- 
1.7.10.4



