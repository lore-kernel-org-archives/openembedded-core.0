Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RWGUx-0007bT-Gk
	for openembedded-core@openembedded.org; Fri, 02 Dec 2011 00:57:03 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Dec 2011 15:50:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,281,1320652800"; d="scan'208";a="81299149"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by azsmga001.ch.intel.com with ESMTP; 01 Dec 2011 15:50:19 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Thu,  1 Dec 2011 15:50:13 -0800
Message-Id: <6f8f1b966ba613b232c9df99aa0883e0c8426359.1322783370.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322783370.git.sgw@linux.intel.com>
References: <cover.1322783370.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322783370.git.sgw@linux.intel.com>
References: <cover.1322783370.git.sgw@linux.intel.com>
Subject: [PATCH 1/6] resolvconf: Update to 1.62
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
X-List-Received-Date: Thu, 01 Dec 2011 23:57:03 -0000

 * remove unneeded directory that does not get packaged

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{resolvconf_1.61.bb => resolvconf_1.62.bb}     |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.61.bb => resolvconf_1.62.bb} (78%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.61.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.62.bb
similarity index 78%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.61.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.62.bb
index c924fe0..af72199 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.61.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.62.bb
@@ -14,8 +14,8 @@ PR = "r0"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.gz"
 
-SRC_URI[md5sum] = "ac1cfa1abc7c690f1d8917f746ad80a5"
-SRC_URI[sha256sum] = "0eaa97fa29f8e30a541d549abe76766e5e4edfa841721529c85616d7c0089908"
+SRC_URI[md5sum] = "5d9656c9d7a2e1304d9d41ed13cf54a4"
+SRC_URI[sha256sum] = "cd00b3757fc73d2729be6e2532ca033ddd5542c4deff451929695bcc3af97c61"
 
 inherit allarch
 
@@ -24,7 +24,7 @@ do_compile () {
 }
 
 do_install () {
-	install -d ${D}${sysconfdir} ${D}${sbindir} ${D}${base_sbindir} ${D}${localstatedir}/volatile/run/resolvconf/interface
+	install -d ${D}${sysconfdir} ${D}${base_sbindir} ${D}${localstatedir}/volatile/run/resolvconf/interface
 	install -d ${D}${mandir}/man8 ${D}${docdir}/${P}
 	cp -pPR etc/* ${D}${sysconfdir}/
 	chown -R root:root ${D}${sysconfdir}/
-- 
1.7.6.4



