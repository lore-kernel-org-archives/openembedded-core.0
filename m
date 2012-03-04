Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1S45wc-00047S-91
	for openembedded-core@lists.openembedded.org;
	Sun, 04 Mar 2012 08:33:26 +0100
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M0C00JN0KH8NIA0@vms173019.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Sun, 04 Mar 2012 00:24:49 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 270CD2016D; Sun,
	04 Mar 2012 01:24:44 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 04 Mar 2012 01:24:34 -0500
Message-id: <1330842274-13635-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.7.8.5
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] soc-family.inc: to be included in machine.conf to add SOC_FAMILY to MACHINEOVERRIDE
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
X-List-Received-Date: Sun, 04 Mar 2012 07:33:26 -0000

From: Denys Dmytriyenko <denys@ti.com>

Add a soc-family.inc file that can be included in a machine.conf to enable
the use of SOC_FAMILY in MACHINEOVERRIDE, which could be useful to group
multiple machines with the same common base. Some examples can be seen in
meta-ti BSP layer.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/conf/machine/include/soc-family.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)
 create mode 100644 meta/conf/machine/include/soc-family.inc

diff --git a/meta/conf/machine/include/soc-family.inc b/meta/conf/machine/include/soc-family.inc
new file mode 100644
index 0000000..612039c
--- /dev/null
+++ b/meta/conf/machine/include/soc-family.inc
@@ -0,0 +1,2 @@
+# Add SOC_FAMILY to machine overrides so we get access to e.g. 'omap3' and 'ti335x'
+MACHINEOVERRIDES .= "${@['', ':${SOC_FAMILY}']['${SOC_FAMILY}' != '']}"
-- 
1.7.8.5



