Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GDH-0001PS-2g
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:27:11 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2012 05:15:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181613"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:15:14 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:13:48 +0300
Message-Id: <1ec6f55bed1e0a16ce4f610ef9e32dd4f49fa947.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED REQUEST 61/64] kernel.bbclass: remove default module_autoload and module_conf values
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
X-List-Received-Date: Tue, 14 Aug 2012 12:27:11 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

kernel.bbclass is a common class for many different kernel versions,
and as such the default module_autoload and module_conf values that
it contains are not relevant, or out of date for most builds.

Individual kernel recipes or distros can better specify these
values to meet their needs.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/kernel.bbclass |   19 -------------------
 1 files changed, 0 insertions(+), 19 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 2e8e86b..b24ab1a 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -297,25 +297,6 @@ if [ x"$D" = "x" ]; then
 fi
 }
 
-# autoload defaults (alphabetically sorted)
-module_autoload_hidp = "hidp"
-module_autoload_ipv6 = "ipv6"
-module_autoload_ipsec = "ipsec"
-module_autoload_ircomm-tty = "ircomm-tty"
-module_autoload_rfcomm = "rfcomm"
-module_autoload_sa1100-rtc = "sa1100-rtc"
-# sa1100-rtc was renamed in 2.6.23 onwards
-module_autoload_rtc-sa1100 = "rtc-sa1100"
-
-# alias defaults (alphabetically sorted)
-module_conf_af_packet = "alias net-pf-17 af_packet"
-module_conf_bluez = "alias net-pf-31 bluez"
-module_conf_bnep = "alias bt-proto-4 bnep"
-module_conf_hci_uart = "alias tty-ldisc-15 hci_uart"
-module_conf_l2cap = "alias bt-proto-0 l2cap"
-module_conf_sco = "alias bt-proto-2 sco"
-module_conf_rfcomm = "alias bt-proto-3 rfcomm"
-
 python populate_packages_prepend () {
     def extract_modinfo(file):
         import tempfile, re, subprocess
-- 
1.7.7.6



