Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qx2Kf-0006Xu-39
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 21:44:49 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Aug 2011 12:39:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,286,1312182000"; d="scan'208";a="45450537"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.251])
	by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2011 12:39:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2011 12:39:43 -0700
Message-Id: <ec62502988f0d79a69013513f2246980e0d8c01c.1314387279.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314387279.git.sgw@linux.intel.com>
References: <cover.1314387279.git.sgw@linux.intel.com>
In-Reply-To: <cover.1314387279.git.sgw@linux.intel.com>
References: <cover.1314387279.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 13/21] base-passwd: Use BPN in FILES paths
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
X-List-Received-Date: Fri, 26 Aug 2011 19:44:49 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Use BPN instead of PN in FILES paths.
This fixes the login issue by /etc/passwd missing in multilib images.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../recipes-core/base-passwd/base-passwd_3.5.22.bb |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
index a155b41..137512d 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
@@ -30,11 +30,11 @@ do_install () {
 	install -o root -g root -p -m 644 passwd.master ${D}${datadir}/base-passwd/
 	install -o root -g root -p -m 644 group.master ${D}${datadir}/base-passwd/
 
-	install -d -m 755 ${D}${docdir}/${PN}
-	install -p -m 644 debian/changelog ${D}${docdir}/${PN}/
-	gzip -9 ${D}${docdir}/${PN}/*
-	install -p -m 644 README ${D}${docdir}/${PN}/
-	install -p -m 644 debian/copyright ${D}${docdir}/${PN}/
+	install -d -m 755 ${D}${docdir}/${BPN}
+	install -p -m 644 debian/changelog ${D}${docdir}/${BPN}/
+	gzip -9 ${D}${docdir}/${BPN}/*
+	install -p -m 644 README ${D}${docdir}/${BPN}/
+	install -p -m 644 debian/copyright ${D}${docdir}/${BPN}/
 }
 
 pkg_postinst_${PN} () {
-- 
1.7.6



