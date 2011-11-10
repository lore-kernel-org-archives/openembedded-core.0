Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1ROJYv-0000Ik-Ma
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 02:36:17 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Nov 2011 17:29:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,486,1315206000"; d="scan'208";a="72645365"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.15])
	by azsmga001.ch.intel.com with ESMTP; 09 Nov 2011 17:29:58 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 17:29:54 -0800
Message-Id: <6a10e053a48203f8926b190b5590cf9872dfef24.1320888203.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1320888203.git.josh@linux.intel.com>
References: <cover.1320888203.git.josh@linux.intel.com>
In-Reply-To: <cover.1320888203.git.josh@linux.intel.com>
References: <cover.1320888203.git.josh@linux.intel.com>
Subject: [PATCH 7/7] multilibs: remove clutter-1.6 recipes
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
X-List-Received-Date: Thu, 10 Nov 2011 01:36:18 -0000

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/conf/multilib.conf |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 53c0bbb..6cbac8c 100644
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
1.7.7



