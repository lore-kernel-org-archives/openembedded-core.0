Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RNrME-0002iM-44
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 20:29:18 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 08 Nov 2011 11:23:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,477,1315206000"; d="scan'208";a="34587131"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Nov 2011 11:23:01 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2011 11:22:43 -0800
Message-Id: <1a340471694204937981513dee4cc24bc2dc6f7e.1320780004.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320780004.git.sgw@linux.intel.com>
References: <cover.1320780004.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320780004.git.sgw@linux.intel.com>
References: <cover.1320780004.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 03/17] files/device_table-minimal.txt: add /dev/kmsg
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
X-List-Received-Date: Tue, 08 Nov 2011 19:29:18 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/files/device_table-minimal.txt |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/files/device_table-minimal.txt b/meta/files/device_table-minimal.txt
index 495b5d5..c6e5463 100644
--- a/meta/files/device_table-minimal.txt
+++ b/meta/files/device_table-minimal.txt
@@ -15,6 +15,7 @@
 /dev/hda	b	660	0	6	3	0	-	-	-
 /dev/hda	b	660	0	6	3	1	1	1	20
 /dev/kmem	c	640	0	15	1	2	-	-	-
+/dev/kmsg	c	600	0	0	1	11	-	-	-
 /dev/mem	c	640	0	15	1	1	-	-	-
 /dev/null	c	666	0	0	1	3	-	-	-
 /dev/ram	b	640	0	0	1	0	0	1	4
-- 
1.7.6.4



