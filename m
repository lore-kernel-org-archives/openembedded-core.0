Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S0bC5-0004tn-1Z
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 17:06:57 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2012 07:58:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128652360"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.72])
	by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2012 07:58:32 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 07:58:15 -0800
Message-Id: <36fdd134f4864f5efdf8c271c3bf6e822bc10961.1330012543.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 11/25] busybox: don't create /etc/default
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
X-List-Received-Date: Thu, 23 Feb 2012 16:06:57 -0000

From: Andreas Oberritter <obi@opendreambox.org>

* It's not used by the recipe and its creation
  currently depends on CONFIG_HWCLOCK=y.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-core/busybox/busybox.inc       |    1 -
 meta/recipes-core/busybox/busybox_1.19.3.bb |    2 +-
 2 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 5fb436e..fc69d65 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -179,7 +179,6 @@ do_install () {
 		install -m 0755 ${WORKDIR}/busybox-udhcpd ${D}${sysconfdir}/init.d/
 	fi
 	if grep "CONFIG_HWCLOCK=y" ${WORKDIR}/defconfig; then
-		install -d ${D}${sysconfdir}/default
 		install -m 0755 ${WORKDIR}/hwclock.sh ${D}${sysconfdir}/init.d/
 	fi
 	if grep "CONFIG_UDHCPC=y" ${WORKDIR}/defconfig; then
diff --git a/meta/recipes-core/busybox/busybox_1.19.3.bb b/meta/recipes-core/busybox/busybox_1.19.3.bb
index a075407..45e284f 100644
--- a/meta/recipes-core/busybox/busybox_1.19.3.bb
+++ b/meta/recipes-core/busybox/busybox_1.19.3.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://udhcpscript.patch \
-- 
1.7.6.5



