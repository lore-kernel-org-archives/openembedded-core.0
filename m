Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1ROJYt-0000Ib-6j
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 02:36:15 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Nov 2011 17:29:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,486,1315206000"; d="scan'208";a="72645345"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.15])
	by azsmga001.ch.intel.com with ESMTP; 09 Nov 2011 17:29:57 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 17:29:49 -0800
Message-Id: <4ec3cef006b69c9f27718d38259276740c031bfe.1320888203.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1320888203.git.josh@linux.intel.com>
References: <cover.1320888203.git.josh@linux.intel.com>
In-Reply-To: <cover.1320888203.git.josh@linux.intel.com>
References: <cover.1320888203.git.josh@linux.intel.com>
Subject: [PATCH 2/7] multilib.conf: update clutter
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
X-List-Received-Date: Thu, 10 Nov 2011 01:36:15 -0000

Add clutter-1.8 recipes

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/conf/multilib.conf |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 5e4b435..53c0bbb 100644
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
1.7.7



