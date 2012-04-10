Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SHdHq-0006vl-PT
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 17:47:19 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 10 Apr 2012 08:38:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="87392780"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Apr 2012 08:37:59 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2012 23:32:07 +0800
Message-Id: <42844d3e207bb688a6ce1c615c03930ead0e45ff.1334071773.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1334071773.git.lianhao.lu@intel.com>
References: <cover.1334071773.git.lianhao.lu@intel.com>
Subject: [PATCH V4 1/1] connman: add ofono dependency.
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
X-List-Received-Date: Tue, 10 Apr 2012 15:47:19 -0000

Added dependency to ofono because we always enable ofono plug-in.

We did this because the 1.2 release cycle is coming to an end. We should
use PACKAGECONFIG in 1.3.

This is part of the 1.2 bug fixing [YOCTO #2216].

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc     |    1 +
 meta/recipes-connectivity/connman/connman_0.79.bb |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 1a6dd1b..bfe6620 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -17,6 +17,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
 DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
             ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluez4', '', d)} \
             ${@base_contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
+            ofono \
             "
 
 EXTRA_OECONF += "\
diff --git a/meta/recipes-connectivity/connman/connman_0.79.bb b/meta/recipes-connectivity/connman/connman_0.79.bb
index f87c4dd..388041a 100644
--- a/meta/recipes-connectivity/connman/connman_0.79.bb
+++ b/meta/recipes-connectivity/connman/connman_0.79.bb
@@ -8,4 +8,4 @@ SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
             file://disable_alg-test.patch \
             file://connman"
 S = "${WORKDIR}/git"
-PR = "r1"
+PR = "r2"
-- 
1.7.0.4



