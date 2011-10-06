Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RBqgd-0008VG-IX
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 18:20:43 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 06 Oct 2011 09:15:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,496,1312182000"; d="scan'208";a="59495917"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.197])
	by azsmga001.ch.intel.com with ESMTP; 06 Oct 2011 09:15:04 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2011 09:14:46 -0700
Message-Id: <5494f0ddd5379f902f2b6fc45a5fcc65cc4a7d8d.1317917297.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1317917297.git.sgw@linux.intel.com>
References: <cover.1317917297.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317917297.git.sgw@linux.intel.com>
References: <cover.1317917297.git.sgw@linux.intel.com>
Subject: [PATCH 07/21] clutter-gst-1.6: Add SRC_URI Checksum
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
X-List-Received-Date: Thu, 06 Oct 2011 16:20:43 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../clutter/clutter-gst-1.6_1.3.6.bb               |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter-gst-1.6_1.3.6.bb b/meta/recipes-graphics/clutter/clutter-gst-1.6_1.3.6.bb
index d787b80..cf1da04 100644
--- a/meta/recipes-graphics/clutter/clutter-gst-1.6_1.3.6.bb
+++ b/meta/recipes-graphics/clutter/clutter-gst-1.6_1.3.6.bb
@@ -5,9 +5,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
 
 DEPENDS += "clutter-1.6"
 
+PR = "r1"
+
 SRC_URI = "http://source.clutter-project.org/sources/clutter-gst/1.3/clutter-gst-${PV}.tar.bz2 \
            file://enable_tests.patch"
 
+SRC_URI[md5sum] = "5ec828cd10713c1c32996e5fa65aa956"
+SRC_URI[sha256sum] = "68c79596ae46ed54885409cac1eeeaf6819673e2f41ee3014fe9705dfbbc1b5a"
+
 S = "${WORKDIR}/clutter-gst-${PV}"
 
 do_configure_prepend () {
-- 
1.7.6.2



