Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RNrME-0002iP-PW
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 20:29:18 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 08 Nov 2011 11:23:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,477,1315206000"; d="scan'208";a="34587136"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Nov 2011 11:23:02 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2011 11:22:45 -0800
Message-Id: <af51496a9a35ecee0487d554f0493c662c335228.1320780004.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320780004.git.sgw@linux.intel.com>
References: <cover.1320780004.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320780004.git.sgw@linux.intel.com>
References: <cover.1320780004.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 05/17] dhcp: rename dhcp4.inc to dhcp.inc
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
X-List-Received-Date: Tue, 08 Nov 2011 19:29:19 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../dhcp/{dhcp4.inc => dhcp.inc}                   |    0
 meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb       |    2 +-
 2 files changed, 1 insertions(+), 1 deletions(-)
 rename meta/recipes-connectivity/dhcp/{dhcp4.inc => dhcp.inc} (100%)

diff --git a/meta/recipes-connectivity/dhcp/dhcp4.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp4.inc
rename to meta/recipes-connectivity/dhcp/dhcp.inc
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb b/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
index 85f473d..223522f 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
@@ -1,4 +1,4 @@
-require dhcp4.inc
+require dhcp.inc
 
 PR = "r2"
 
-- 
1.7.6.4



