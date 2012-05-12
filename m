Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1ST1C0-0004qj-Ap
	for openembedded-core@lists.openembedded.org;
	Sat, 12 May 2012 03:32:20 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 11 May 2012 18:22:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="142988709"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.13.40])
	by orsmga002.jf.intel.com with ESMTP; 11 May 2012 18:22:23 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2012 18:22:20 -0700
Message-Id: <1336785740-15018-1-git-send-email-josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] meta/classes/sstate.bbclass: ensure sstate files have group R/W
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
X-List-Received-Date: Sat, 12 May 2012 01:32:20 -0000

In order to make sharing sstate files easier chmod them with 0664 permissions	so that they are readable and writable by the user and any other members of 	their group.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/classes/sstate.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index ad7d121..ffd55fd 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -468,6 +468,7 @@ sstate_create_package () {
 	else
 		tar -cz --file=$TFILE --files-from=/dev/null
 	fi
+	chmod 0664 $TFILE 
 	mv $TFILE ${SSTATE_PKG}
 
 	cd ${WORKDIR}
-- 
1.7.7.6



