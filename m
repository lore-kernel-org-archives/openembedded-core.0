Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sh11S-00027s-Qt
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 18:11:19 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jun 2012 09:00:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="155520375"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.123])
	by orsmga001.jf.intel.com with ESMTP; 19 Jun 2012 09:00:06 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 08:59:47 -0700
Message-Id: <0f351f1333ea3d69ef06bfac2ff033a2c0d4c1e2.1340121099.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
Subject: [PATCH 29/39] lttng-viewer: clean up FILE after PACKAGE reorder
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
X-List-Received-Date: Tue, 19 Jun 2012 16:11:19 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb b/meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb
index 233d836..9d94903 100644
--- a/meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb
+++ b/meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb
@@ -9,7 +9,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f650d5f5af1e9648fe0b40e290d3adbb \
                     file://ltt/ltt.h;beginline=2;endline=18;md5=8b7da9190028c50396d97fc85bad0da9 \
                     file://lttv/lttv/traceset.c;beginline=2;endline=17;md5=bcab42863b64b41d153bf81bbe2490a6"
-PR = "r2"
+PR = "r3"
 
 DEPENDS = "gtk+ pango popt"
 
@@ -28,6 +28,7 @@ inherit autotools
 
 LEAD_SONAME = "liblttvtraceread*"
 
+FILES_SOLIBSDEV = ""
 FILES_${PN} += "\
     ${libdir}/liblttvtraceread*.so \
     ${libdir}/lttv/plugins/*.so \
-- 
1.7.7.6



