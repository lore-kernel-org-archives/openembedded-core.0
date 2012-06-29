Received: from c-71-193-189-117.hsd1.wa.comcast.net ([71.193.189.117]
	helo=yujin.bigsur.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@yujin.bigsur.com>) id 1SkisI-00087L-PI
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 23:37:11 +0200
Received: from yujin.bigsur.com (localhost [127.0.0.1])
	by yujin.bigsur.com (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	q5TLLOOt028210 for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 14:21:24 -0700
Received: (from sgw@localhost)
	by yujin.bigsur.com (8.14.4/8.14.4/Submit) id q5TLLOXo028209
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 14:21:24 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jun 2012 14:21:14 -0700
Message-Id: <44a285e867a4fe78e2a116d7f8f265f2b6dde4da.1341004548.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1341004548.git.sgw@linux.intel.com>
References: <cover.1341004548.git.sgw@linux.intel.com>
In-Reply-To: <cover.1341004548.git.sgw@linux.intel.com>
References: <cover.1341004548.git.sgw@linux.intel.com>
Subject: [PATCH 2/7] lib_package: use PACKAGE_BEFORE_PN
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
X-List-Received-Date: Fri, 29 Jun 2012 21:37:11 -0000

Since this check effective is not a change becase the package
order that was in this file has not really changed no PR Bumps
are needed.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/lib_package.bbclass |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/lib_package.bbclass b/meta/classes/lib_package.bbclass
index 1f0542a..d514257 100644
--- a/meta/classes/lib_package.bbclass
+++ b/meta/classes/lib_package.bbclass
@@ -4,5 +4,4 @@
 # We need to allow the other packages to be greedy with what they
 # want out of /bin and /usr/bin before ${PN}-bin gets greedy.
 # 
-PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PN}-bin ${PN}"
-
+PACKAGE_BEFORE_PN = "${PN}-bin"
-- 
1.7.10.4



