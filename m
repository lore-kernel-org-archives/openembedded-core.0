Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RFXEk-0003VD-PV
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Oct 2011 22:23:12 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Oct 2011 13:17:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,354,1315206000"; d="scan'208";a="74375149"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.6])
	by fmsmga001.fm.intel.com with ESMTP; 16 Oct 2011 13:17:21 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Oct 2011 13:17:04 -0700
Message-Id: <c518010507c97a75c64eb672b1cd4f07f4063dec.1318796061.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1318796061.git.sgw@linux.intel.com>
References: <cover.1318796061.git.sgw@linux.intel.com>
In-Reply-To: <cover.1318796061.git.sgw@linux.intel.com>
References: <cover.1318796061.git.sgw@linux.intel.com>
Subject: [v2 -CONSOLIDATED PULL 02/14] resolvconf: Update to 1.61
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
X-List-Received-Date: Sun, 16 Oct 2011 20:23:12 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{resolvconf_1.59.bb => resolvconf_1.61.bb}     |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.59.bb => resolvconf_1.61.bb} (87%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.59.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.61.bb
similarity index 87%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.59.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.61.bb
index 8e0b215..c924fe0 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.59.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.61.bb
@@ -10,12 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 AUTHOR = "Thomas Hood"
 HOMEPAGE = "http://packages.debian.org/resolvconf"
 RDEPENDS_${PN} = "bash"
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.gz"
 
-SRC_URI[md5sum] = "59b20258bb8a3c25b8c4083fc0279547"
-SRC_URI[sha256sum] = "37691677cea24da66d6664c98668b5f16667c0133f17feb166f246ee923ad756"
+SRC_URI[md5sum] = "ac1cfa1abc7c690f1d8917f746ad80a5"
+SRC_URI[sha256sum] = "0eaa97fa29f8e30a541d549abe76766e5e4edfa841721529c85616d7c0089908"
 
 inherit allarch
 
-- 
1.7.6.2



