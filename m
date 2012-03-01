Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S30XF-0007yn-Tj
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 08:34:46 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 Feb 2012 23:26:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113168884"
Received: from unknown (HELO swold-mobl.myhome.westell.com) ([10.255.15.82])
	by azsmga001.ch.intel.com with ESMTP; 29 Feb 2012 23:26:13 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Feb 2012 23:26:06 -0800
Message-Id: <bd8923b1b05b7b8c1271ff4c06c5cd076903c673.1330586641.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330586641.git.sgw@linux.intel.com>
References: <cover.1330586641.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330586641.git.sgw@linux.intel.com>
References: <cover.1330586641.git.sgw@linux.intel.com>
Subject: [PATCH 3/7] hdparm: update to 9.39
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
X-List-Received-Date: Thu, 01 Mar 2012 07:34:46 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../hdparm/{hdparm_9.37.bb => hdparm_9.39.bb}      |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/hdparm/{hdparm_9.37.bb => hdparm_9.39.bb} (89%)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.37.bb b/meta/recipes-extended/hdparm/hdparm_9.39.bb
similarity index 89%
rename from meta/recipes-extended/hdparm/hdparm_9.37.bb
rename to meta/recipes-extended/hdparm/hdparm_9.39.bb
index 8ea6f13..d8342cc 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.37.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.39.bb
@@ -16,8 +16,9 @@ FILES_${PN} = "${base_sbindir} ${mandir}"
 RDEPENDS_wiper = "bash gawk stat"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/hdparm-${PV}.tar.gz "
-SRC_URI[md5sum] = "0bb94ddd1bedd5c02b1ca62f1caaf6de"
-SRC_URI[sha256sum] = "87ede0a7cb5b4de500748232e9d251b75acfccce078e1d42c8d125b9e5b4ccd3"
+
+SRC_URI[md5sum] = "2bc17b72403885d4faf959682944243b"
+SRC_URI[sha256sum] = "72d550af4526aa96f0841c79321a0ee39d636cbaf1f294e52193e90c054b3cea"
 
 do_install () {
 	install -d ${D}/${base_sbindir} ${D}/${mandir}/man8 ${D}/${bindir}
-- 
1.7.7.6



