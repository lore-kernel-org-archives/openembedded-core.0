Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QgPjK-0005b2-T9
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 01:17:35 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Jul 2011 16:13:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,517,1304319600"; d="scan'208";a="26491803"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.180])
	by orsmga001.jf.intel.com with ESMTP; 11 Jul 2011 16:13:35 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2011 16:13:09 -0700
Message-Id: <b90b7b8264c0c24d64e6e64a322c44b60bc62855.1310425837.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310425837.git.sgw@linux.intel.com>
References: <cover.1310425837.git.sgw@linux.intel.com>
In-Reply-To: <cover.1310425837.git.sgw@linux.intel.com>
References: <cover.1310425837.git.sgw@linux.intel.com>
Subject: [PATCH 02/26] lib_package.bbclass: add *_nonshared.a to -dev package
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
X-List-Received-Date: Mon, 11 Jul 2011 23:17:35 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/lib_package.bbclass |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/lib_package.bbclass b/meta/classes/lib_package.bbclass
index 5ce8727..4378052 100644
--- a/meta/classes/lib_package.bbclass
+++ b/meta/classes/lib_package.bbclass
@@ -1,10 +1,11 @@
 PACKAGES += "${PN}-bin"
+FILES_${PN}-bin = "${bindir}/* ${sbindir}/* /bin/* /sbin/*"
 
 FILES_${PN} = "${libexecdir} ${libdir}/lib*${SOLIBS} \
 	    ${sysconfdir} ${sharedstatedir} ${localstatedir} \
 	    ${base_libdir}/*${SOLIBS} \
 	    ${datadir}/${PN} ${libdir}/${PN}"
 FILES_${PN}-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
-		${libdir}/*.o ${libdir}/pkgconfig /lib/*.o \
-		${datadir}/aclocal ${bindir}/*-config"
-FILES_${PN}-bin = "${bindir}/* ${sbindir}/* /bin/* /sbin/*"
+            ${libdir}/*.o ${libdir}/pkgconfig /lib/*.o \
+            ${datadir}/aclocal ${bindir}/*-config \
+            ${libdir}/*_nonshared.a"
-- 
1.7.3.4



