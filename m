Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Qwmji-0007oQ-CZ
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 05:05:38 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 25 Aug 2011 20:00:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,283,1312182000"; d="scan'208";a="42594380"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by azsmga001.ch.intel.com with ESMTP; 25 Aug 2011 20:00:48 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2011 11:02:52 +0800
Message-Id: <3da591983cad7670d2107b92fb9367deaac1bebf.1314327528.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1314327528.git.dongxiao.xu@intel.com>
References: <cover.1314327528.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1314327528.git.dongxiao.xu@intel.com>
References: <cover.1314327528.git.dongxiao.xu@intel.com>
Subject: [PATCH 2/4] bitbake.conf: Use BPN in FILES paths
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
X-List-Received-Date: Fri, 26 Aug 2011 03:05:38 -0000

Use BPN instead of PN in FILES path to support multilib.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/conf/bitbake.conf |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b309516..2a77483 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -261,7 +261,7 @@ FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS}
             ${sysconfdir} ${sharedstatedir} ${localstatedir} \
             ${base_bindir}/* ${base_sbindir}/* \
             ${base_libdir}/*${SOLIBS} \
-            ${datadir}/${PN} ${libdir}/${PN}/* \
+            ${datadir}/${BPN} ${libdir}/${BPN}/* \
             ${datadir}/pixmaps ${datadir}/applications \
             ${datadir}/idl ${datadir}/omf ${datadir}/sounds \
             ${libdir}/bonobo/servers"
@@ -282,7 +282,7 @@ SECTION_${PN}-staticdev = "devel"
 RDEPENDS_${PN}-staticdev = "${PN}-dev (= ${EXTENDPKGV})"
 
 DOTDEBUG-dbg = "${bindir}/.debug ${sbindir}/.debug ${libexecdir}/.debug ${libdir}/.debug \
-            ${base_bindir}/.debug ${base_sbindir}/.debug ${base_libdir}/.debug ${libdir}/${PN}/.debug \
+            ${base_bindir}/.debug ${base_sbindir}/.debug ${base_libdir}/.debug ${libdir}/${BPN}/.debug \
             ${libdir}/matchbox-panel/.debug /usr/src/debug"
 
 DEBUGFILEDIRECTORY-dbg = "/usr/lib/debug /usr/src/debug"
-- 
1.7.1



