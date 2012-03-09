Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S5o91-0002q4-LP
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Mar 2012 01:57:19 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 08 Mar 2012 16:48:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="75389835"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.15.37])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Mar 2012 16:48:39 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2012 16:48:38 -0800
Message-Id: <1331254118-29279-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] image-vmdk: add NOISO to disable iso image creation since it's not needed
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
X-List-Received-Date: Fri, 09 Mar 2012 00:57:20 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image-vmdk.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/image-vmdk.bbclass b/meta/classes/image-vmdk.bbclass
index d3e5481..3e63006 100644
--- a/meta/classes/image-vmdk.bbclass
+++ b/meta/classes/image-vmdk.bbclass
@@ -1,4 +1,5 @@
 
+NOISO = "1"
 SYSLINUX_PROMPT = "0"
 SYSLINUX_TIMEOUT = "1"
 SYSLINUX_LABELS = "boot"
-- 
1.7.7.6



