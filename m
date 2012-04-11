Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHmaS-0002rH-IP
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 03:43:08 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 10 Apr 2012 18:33:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129434389"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.159])
	by azsmga001.ch.intel.com with ESMTP; 10 Apr 2012 18:33:48 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2012 18:33:42 -0700
Message-Id: <baa3cbb0ca324bfccaa902e535b750ecc2e1ff1c.1334107957.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334107957.git.sgw@linux.intel.com>
References: <cover.1334107957.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334107957.git.sgw@linux.intel.com>
References: <cover.1334107957.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL (for RC3) 1/5] connman: add ofono dependency.
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
X-List-Received-Date: Wed, 11 Apr 2012 01:43:08 -0000

From: Lianhao Lu <lianhao.lu@intel.com>

Added dependency to ofono because we always enable ofono plug-in.

We did this because the 1.2 release cycle is coming to an end. We should
use PACKAGECONFIG in 1.3.

This is part of the 1.2 bug fixing [YOCTO #2216].

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
-- 
1.7.7.6



