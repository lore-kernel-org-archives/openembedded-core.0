Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QhqQr-00067P-HP
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jul 2011 00:00:25 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 15 Jul 2011 14:51:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,210,1309762800"; d="scan'208";a="28238713"
Received: from unknown (HELO localhost) ([10.255.14.16])
	by orsmga001.jf.intel.com with ESMTP; 15 Jul 2011 14:51:32 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2011 14:51:28 -0700
Message-Id: <8fa1659821ae83babe6f28d57fbb5d25cf5146ce.1310766615.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1310766615.git.dvhart@linux.intel.com>
References: <cover.1310766615.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1310766615.git.dvhart@linux.intel.com>
References: <cover.1310766615.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 1/1] ofono: fix test block syntax error
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
X-List-Received-Date: Fri, 15 Jul 2011 22:00:25 -0000

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
1.7.1



