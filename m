Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RSzOB-0003bD-3j
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 00:04:33 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Nov 2011 14:57:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,556,1315206000"; d="scan'208";a="40292567"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.38])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Nov 2011 14:57:57 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Nov 2011 14:57:50 -0800
Message-Id: <87dcfd2edaa7d9c847d6d88f49b1899441263e8d.1322001497.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <cover.1322001497.git.josh@linux.intel.com>
References: <cover.1322001497.git.josh@linux.intel.com>
In-Reply-To: <cover.1322001497.git.josh@linux.intel.com>
References: <cover.1322001497.git.josh@linux.intel.com>
Subject: [PATCH 07/10] multilibs: remove clutter-1.6 recipes
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
X-List-Received-Date: Tue, 22 Nov 2011 23:04:33 -0000

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/conf/multilib.conf |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index ce7c01c..3689482 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -41,9 +41,8 @@ BBCLASSEXTEND_append_pn-bzip2 = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-cairo = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-calibrateproto = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-chkconfig = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-clutter-1.6 = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-clutter-box2d-1.6 = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-clutter-1.8 = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-clutter-box2d-1.6 = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-clutter-gst-1.8 = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-clutter-gtk-1.8 = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-compositeproto = " ${MULTILIBS}"
-- 
1.7.7.3



