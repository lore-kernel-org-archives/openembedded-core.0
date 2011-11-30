Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RVYDt-0008Er-JS
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 01:40:29 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Nov 2011 16:33:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="81378090"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.15.149])
	by orsmga002.jf.intel.com with ESMTP; 29 Nov 2011 16:33:48 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 16:33:37 -0800
Message-Id: <ebeaf60c687fa4334f489b997f9657b06eb0c718.1322606832.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <cover.1322606832.git.josh@linux.intel.com>
References: <cover.1322606832.git.josh@linux.intel.com>
In-Reply-To: <cover.1322606832.git.josh@linux.intel.com>
References: <cover.1322606832.git.josh@linux.intel.com>
Subject: [PATCH 01/11] multilib.conf: remove clutter-1.6 and add clutter-1.8
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
X-List-Received-Date: Wed, 30 Nov 2011 00:40:29 -0000

clutter-1.8 is the future here.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/conf/multilib.conf |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index de53540..3689482 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -41,8 +41,10 @@ BBCLASSEXTEND_append_pn-bzip2 = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-cairo = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-calibrateproto = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-chkconfig = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-clutter-1.6 = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-clutter-1.8 = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-clutter-box2d-1.6 = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-clutter-gst-1.8 = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-clutter-gtk-1.8 = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-compositeproto = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-connman-gnome = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-connman = " ${MULTILIBS}"
-- 
1.7.7.3



