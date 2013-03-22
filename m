Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jukka.rissanen@linux.intel.com>) id 1UIxMC-0004u1-Fx
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 09:29:49 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Mar 2013 01:11:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,891,1355126400"; d="scan'208";a="217668587"
Received: from sorvi.fi.intel.com ([10.237.72.58])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Mar 2013 01:11:46 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 10:11:42 +0200
Message-Id: <1363939902-23537-3-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <1363939902-23537-1-git-send-email-jukka.rissanen@linux.intel.com>
References: <1363939902-23537-1-git-send-email-jukka.rissanen@linux.intel.com>
Subject: [PATCH v2 2/2] connman-conf: Avoid appending IPv4 address
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
X-List-Received-Date: Fri, 22 Mar 2013 08:29:50 -0000

If run more than once, the IP addresses would be appended
to IPv4 variable. Avoid that by rewriting the IPv4 always.
---
 meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup b/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup
index 59ebb57..c46899e 100644
--- a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup
+++ b/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup
@@ -12,5 +12,5 @@ if [ "x$NET_CONF" = "x" ]; then
 	rm -f ${CONFIGF}
 else
 	# Setup a connman config accordingly
-	sed -i -e "s|^\(IPv4 =\)|\1 ${NET_CONF}|" ${CONFIGF}
+	sed -i -e "s|^IPv4 =.*|IPv4 = ${NET_CONF}|" ${CONFIGF}
 fi
-- 
1.7.11.4



