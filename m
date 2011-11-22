Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RSzO8-0003bD-RS
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 00:04:29 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Nov 2011 14:57:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,556,1315206000"; d="scan'208";a="40292556"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.38])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Nov 2011 14:57:55 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Nov 2011 14:57:45 -0800
Message-Id: <5d3a55fb05cf99587ed825eeaeccc863f29f3d22.1322001497.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <cover.1322001497.git.josh@linux.intel.com>
References: <cover.1322001497.git.josh@linux.intel.com>
In-Reply-To: <cover.1322001497.git.josh@linux.intel.com>
References: <cover.1322001497.git.josh@linux.intel.com>
Subject: [PATCH 02/10] multilib.conf: update clutter
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
X-List-Received-Date: Tue, 22 Nov 2011 23:04:29 -0000

Add clutter-1.8 recipes

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/conf/multilib.conf |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index de53540..ce7c01c 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -43,6 +43,9 @@ BBCLASSEXTEND_append_pn-calibrateproto = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-chkconfig = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-clutter-1.6 = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-clutter-box2d-1.6 = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-clutter-1.8 = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-clutter-gst-1.8 = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-clutter-gtk-1.8 = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-compositeproto = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-connman-gnome = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-connman = " ${MULTILIBS}"
-- 
1.7.7.3



