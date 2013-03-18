Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <olivier.guiter@linux.intel.com>) id 1UHbhj-0007Mq-Je
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 16:10:30 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Mar 2013 07:53:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,865,1355126400"; d="scan'208";a="303848613"
Received: from unknown (HELO oguiternx64.mp.intel.com) ([10.237.24.21])
	by orsmga002.jf.intel.com with ESMTP; 18 Mar 2013 07:53:37 -0700
From: Olivier Guiter <olivier.guiter@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Mar 2013 15:53:42 +0100
Message-Id: <1363618422-19390-1-git-send-email-olivier.guiter@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] neard: upgrade to 0.10
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Mar 2013 15:10:30 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

neard ver 0.10:
	Added initial WiFi handover support.
	Added Service Name Lookup support to nfctool.
	Added NDEF building unit tests.
	Added State support to Bluetooth handover agent.
	Added neard and neard.conf man pages.
	Added a copy of the NFC kernel header.
	Fixed handover validation tests failures.
	Fixed Tag and Device PropertyChanged signal.

Signed-off-by: Olivier Guiter <olivier.guiter@linux.intel.com>
---
 meta/recipes-connectivity/neard/neard_0.9.bb |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/neard/neard_0.9.bb b/meta/recipes-connectivity/neard/neard_0.9.bb
index 8e33a9d..3ece002 100644
--- a/meta/recipes-connectivity/neard/neard_0.9.bb
+++ b/meta/recipes-connectivity/neard/neard_0.9.bb
@@ -47,14 +47,14 @@ FILES_${PN}-dbg += "${libdir}/${BPN}/*/.debug"
 
 RDEPENDS_${PN}-tests = "python python-dbus python-pygobject"
 
-# This is valid for 0.9+
+# This is valid for 0.10+
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
  file://src/near.h;beginline=1;endline=20;md5=358e4deefef251a4761e1ffacc965d13 \
  "
 S	= "${WORKDIR}/git"
-SRCREV	= "1e20e396cb837017b7e5ef822bfdab6ce060d2cf"
-PV	= "0.9-git${SRCPV}"
-PR	= "r1"
+SRCREV	= "eb486bf35e24d7d1db61350f5ab393a0c880523d"
+PV	= "0.10-git${SRCPV}"
+PR	= "r0"
 
 SRC_URI  = "git://git.kernel.org/pub/scm/network/nfc/neard.git;protocol=git \
 	file://neard.in \
-- 
1.7.9.5



