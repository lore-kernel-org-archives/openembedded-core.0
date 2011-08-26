Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QwrFp-00012J-3M
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 09:55:05 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 26 Aug 2011 00:50:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,283,1312182000"; d="scan'208";a="11274489"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Aug 2011 00:50:15 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2011 15:52:20 +0800
Message-Id: <6154824fc4b6c0545c980af226412faf054f4e79.1314344548.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1314344548.git.dongxiao.xu@intel.com>
References: <cover.1314344548.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1314344548.git.dongxiao.xu@intel.com>
References: <cover.1314344548.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/5] base-passwd: Use BPN in FILES paths
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
X-List-Received-Date: Fri, 26 Aug 2011 07:55:09 -0000

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
1.7.1



