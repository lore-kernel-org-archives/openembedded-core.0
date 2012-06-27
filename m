Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SjuZX-0001h1-FE
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 17:54:27 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Jun 2012 08:43:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="161344542"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by azsmga001.ch.intel.com with ESMTP; 27 Jun 2012 08:43:30 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jun 2012 08:43:17 -0700
Message-Id: <3e9e2a0df9bbf08d3b4f3c68ea86b593909eaee2.1340811559.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340811559.git.sgw@linux.intel.com>
References: <cover.1340811559.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340811559.git.sgw@linux.intel.com>
References: <cover.1340811559.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 12/20] busybox: add correct ALTERNATIVE_TARGET for init.d/syslog
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
X-List-Received-Date: Wed, 27 Jun 2012 15:54:27 -0000

[YOCTO #2535]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/busybox/busybox.inc       |    3 ++-
 meta/recipes-core/busybox/busybox_1.19.4.bb |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index a9a58e2..82137a3 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -210,11 +210,12 @@ ALTERNATIVE_PRIORITY = "50"
 ALTERNATIVE_${PN}-syslog = "syslog-init syslog-startup-conf"
 
 ALTERNATIVE_LINK_NAME[syslog-init] = "${sysconfdir}/init.d/syslog"
+ALTERNATIVE_TARGET[syslog-init] = "${sysconfdir}/init.d/syslog.${BPN}"
 
 ALTERNATIVE_LINK_NAME[syslog-startup-conf] = "${sysconfdir}/syslog-startup.conf"
+ALTERNATIVE_TARGET[syslog-startup-conf] = "${sysconfdir}/syslog-startup.conf.${BPN}"
 
 ALTERNATIVE_TARGET = "/bin/busybox"
-ALTERNATIVE_TARGET[syslog-startup-conf] = "${sysconfdir}/syslog-startup.conf.${BPN}"
 
 python do_package_prepend () {
 	# We need to load the full set of busybox provides from the /etc/busybox.links
diff --git a/meta/recipes-core/busybox/busybox_1.19.4.bb b/meta/recipes-core/busybox/busybox_1.19.4.bb
index 5b3f356..de331ad 100644
--- a/meta/recipes-core/busybox/busybox_1.19.4.bb
+++ b/meta/recipes-core/busybox/busybox_1.19.4.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://B921600.patch \
-- 
1.7.7.6



