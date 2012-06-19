Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sh11K-00027q-Pk
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 18:11:12 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jun 2012 08:59:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="155520236"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.123])
	by orsmga001.jf.intel.com with ESMTP; 19 Jun 2012 08:59:59 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 08:59:21 -0700
Message-Id: <3a457040cfea6e45f12e09bd25ea73de48e7672b.1340121099.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
Subject: [PATCH 03/39] lib_package: remove the -dev list
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
X-List-Received-Date: Tue, 19 Jun 2012 16:11:12 -0000

Since we have re-order the full PACKAGES list, we do not need to reset
the -dev list, we still need this since the -bin package needs to be inserted.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/lib_package.bbclass |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/classes/lib_package.bbclass b/meta/classes/lib_package.bbclass
index 5ce8727..9843ed9 100644
--- a/meta/classes/lib_package.bbclass
+++ b/meta/classes/lib_package.bbclass
@@ -1,10 +1,8 @@
-PACKAGES += "${PN}-bin"
+PACKAGES =+ "${PN}-bin"
 
 FILES_${PN} = "${libexecdir} ${libdir}/lib*${SOLIBS} \
 	    ${sysconfdir} ${sharedstatedir} ${localstatedir} \
 	    ${base_libdir}/*${SOLIBS} \
-	    ${datadir}/${PN} ${libdir}/${PN}"
-FILES_${PN}-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
-		${libdir}/*.o ${libdir}/pkgconfig /lib/*.o \
-		${datadir}/aclocal ${bindir}/*-config"
+	    ${datadir}/${BPN} ${libdir}/${BPN}"
+
 FILES_${PN}-bin = "${bindir}/* ${sbindir}/* /bin/* /sbin/*"
-- 
1.7.7.6



