Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jukka.rissanen@linux.intel.com>) id 1UHaYn-0003dv-Gu
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 14:57:20 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Mar 2013 06:38:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,865,1355126400"; d="scan'208";a="303818139"
Received: from unknown (HELO localhost.localdomain) ([10.237.72.58])
	by orsmga002.jf.intel.com with ESMTP; 18 Mar 2013 06:38:34 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Mar 2013 15:38:28 +0200
Message-Id: <1363613908-20116-3-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <1363613908-20116-1-git-send-email-jukka.rissanen@linux.intel.com>
References: <1363613908-20116-1-git-send-email-jukka.rissanen@linux.intel.com>
Subject: [PATCH 2/2] connman-conf: Avoid appending IPv4 address
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Mar 2013 13:57:28 -0000

If run more than once, the IP addresses would be appended
to IPv4 variable. Avoid that by rewriting the IPv4 always.

Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
 meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup b/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup
index 135a6c1..bfdbfb3 100644
--- a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup
+++ b/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup
@@ -12,5 +12,5 @@ if [ "x$NET_CONF" = "x" ]; then
 	rm ${CONFIGF}
 else
 	# Setup a connman config accordingly
-	sed -i -e "s|^\(IPv4 =\)|\1 ${NET_CONF}|" ${CONFIGF}
+	sed -i -e "s|^IPv4 =.*|IPv4 = ${NET_CONF}|" ${CONFIGF}
 fi
-- 
1.7.11.4



