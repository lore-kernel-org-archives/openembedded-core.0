Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SuSc9-0006c7-13
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 20:16:45 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6QI5BVE016900;
	Thu, 26 Jul 2012 11:05:12 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 26 Jul 2012 14:04:31 -0400
Message-Id: <15363b249e50ef40bad737d3a6c2a1c28d3a2dc9.1343325569.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1343325569.git.bruce.ashfield@windriver.com>
References: <cover.1343325569.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1343325569.git.bruce.ashfield@windriver.com>
References: <cover.1343325569.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] kernel.bbclass: remove default module_autoload and module_conf values
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
X-List-Received-Date: Thu, 26 Jul 2012 18:16:45 -0000

kernel.bbclass is a common class for many different kernel versions,
and as such the default module_autoload and module_conf values that
it contains are not relevant, or out of date for most builds.

Individual kernel recipes or distros can better specify these
values to meet their needs.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel.bbclass |   19 -------------------
 1 files changed, 0 insertions(+), 19 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index ab984e3..c647e9b 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -293,25 +293,6 @@ if [ x"$D" = "x" ]; then
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
1.7.5.4



