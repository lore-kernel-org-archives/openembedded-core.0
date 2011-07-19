Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjB3Z-0001do-AD
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 16:13:53 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jul 2011 07:09:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,228,1309762800"; d="scan'208";a="29396949"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 19 Jul 2011 07:09:39 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 23:51:02 -0700
Message-Id: <4aeb6f8b792e6da9227247f8bcee33bedd43922e.1311058024.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311058024.git.sgw@linux.intel.com>
References: <cover.1311058024.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311058024.git.sgw@linux.intel.com>
References: <cover.1311058024.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 15/22] ofono: fix test block syntax error
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
X-List-Received-Date: Tue, 19 Jul 2011 14:13:53 -0000

From: Darren Hart <dvhart@linux.intel.com>

A space is required prior to the closing square bracket. Without it,
a parsing error is reported to the console. I don't have hardware to
confirm, but I suspect the service would fail to function properly
as well.

Correct the typo.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/recipes-connectivity/ofono/ofono/ofono |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/ofono/ofono/ofono b/meta/recipes-connectivity/ofono/ofono/ofono
index 6d46fb8..cc99709 100644
--- a/meta/recipes-connectivity/ofono/ofono/ofono
+++ b/meta/recipes-connectivity/ofono/ofono/ofono
@@ -4,7 +4,7 @@ DAEMON=/usr/sbin/ofonod
 PIDFILE=/var/run/ofonod.pid
 DESC="Telephony daemon"
 
-if [ -f /etc/default/ofono] ; then
+if [ -f /etc/default/ofono ] ; then
 	. /etc/default/ofono
 fi
 
-- 
1.7.3.4



