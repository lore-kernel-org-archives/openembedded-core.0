Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qx2Kf-0006Xw-En
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 21:44:49 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Aug 2011 12:39:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,286,1312182000"; d="scan'208";a="45450540"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.251])
	by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2011 12:39:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2011 12:39:44 -0700
Message-Id: <cb247225a96d57e67ce32c5674bb13b703e30a7c.1314387279.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314387279.git.sgw@linux.intel.com>
References: <cover.1314387279.git.sgw@linux.intel.com>
In-Reply-To: <cover.1314387279.git.sgw@linux.intel.com>
References: <cover.1314387279.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 14/21] bitbake.conf: Use BPN in FILES paths
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

Use BPN instead of PN in FILES path to support multilib.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/conf/bitbake.conf |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b3ff047..a68be07 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -262,7 +262,7 @@ FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS}
             ${sysconfdir} ${sharedstatedir} ${localstatedir} \
             ${base_bindir}/* ${base_sbindir}/* \
             ${base_libdir}/*${SOLIBS} \
-            ${datadir}/${PN} ${libdir}/${PN}/* \
+            ${datadir}/${BPN} ${libdir}/${BPN}/* \
             ${datadir}/pixmaps ${datadir}/applications \
             ${datadir}/idl ${datadir}/omf ${datadir}/sounds \
             ${libdir}/bonobo/servers"
@@ -283,7 +283,7 @@ SECTION_${PN}-staticdev = "devel"
 RDEPENDS_${PN}-staticdev = "${PN}-dev (= ${EXTENDPKGV})"
 
 DOTDEBUG-dbg = "${bindir}/.debug ${sbindir}/.debug ${libexecdir}/.debug ${libdir}/.debug \
-            ${base_bindir}/.debug ${base_sbindir}/.debug ${base_libdir}/.debug ${libdir}/${PN}/.debug \
+            ${base_bindir}/.debug ${base_sbindir}/.debug ${base_libdir}/.debug ${libdir}/${BPN}/.debug \
             ${libdir}/matchbox-panel/.debug /usr/src/debug"
 
 DEBUGFILEDIRECTORY-dbg = "/usr/lib/debug /usr/src/debug"
-- 
1.7.6



