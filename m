Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RpOrS-0004vE-Be
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jan 2012 19:43:25 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 Jan 2012 10:34:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="59212260"
Received: from unknown (HELO swold-mobl.lan) ([10.255.14.82])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Jan 2012 10:34:40 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 10:34:20 -0800
Message-Id: <c41986d3225ff70805abb776a58c092f4f338305.1327343524.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327343523.git.sgw@linux.intel.com>
References: <cover.1327343523.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327343523.git.sgw@linux.intel.com>
References: <cover.1327343523.git.sgw@linux.intel.com>
Subject: [PATCH v2 15/21] tcp-wrappers: refactor packages for staticdev
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
X-List-Received-Date: Mon, 23 Jan 2012 18:43:26 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index 985e848..9b865ba 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -5,13 +5,14 @@ SECTION = "console/network"
 
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://DISCLAIMER;md5=071bd69cb78b18888ea5e3da5c3127fa"
-PR ="r8"
+PR ="r9"
 
 
-PACKAGES = "${PN}-dbg libwrap libwrap-doc libwrap-dev ${PN} ${PN}-doc"
-FILES_libwrap = "${base_libdir}/lib*.so.*"
+PACKAGES = "${PN}-dbg libwrap libwrap-doc libwrap-dev libwrap-staticdev ${PN} ${PN}-doc"
+FILES_libwrap = "${base_libdir}/lib*${SOLIBS}"
 FILES_libwrap-doc = "${mandir}/man3 ${mandir}/man5"
-FILES_libwrap-dev = "${libdir}/lib*.so ${libdir}/lib*.a ${includedir}"
+FILES_libwrap-dev = "${libdir}/lib*${SOLIBSDEV} ${includedir}"
+FILES_libwrap-staticdev = "${libdir}/lib*.a"
 FILES_${PN} = "${sbindir}"
 FILES_${PN}-doc = "${mandir}/man8"
 
-- 
1.7.6.5



