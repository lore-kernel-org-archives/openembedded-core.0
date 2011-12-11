Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RZsIP-0003rn-FN
	for openembedded-core@lists.openembedded.org;
	Sun, 11 Dec 2011 23:55:02 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Dec 2011 14:48:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="86045465"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.46])
	by orsmga002.jf.intel.com with ESMTP; 11 Dec 2011 14:48:01 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Dec 2011 14:47:49 -0800
Message-Id: <31c46062757320106e281787568fe7aa3d176360.1323643433.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323643433.git.sgw@linux.intel.com>
References: <cover.1323643433.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323643433.git.sgw@linux.intel.com>
References: <cover.1323643433.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 22/26] scripts/send-pull-request: fix typo
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
X-List-Received-Date: Sun, 11 Dec 2011 22:55:03 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

s/No cover letter will be send./No cover letter will be sent./

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 scripts/send-pull-request |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/send-pull-request b/scripts/send-pull-request
index 8d51ce2..09f4245 100755
--- a/scripts/send-pull-request
+++ b/scripts/send-pull-request
@@ -118,7 +118,7 @@ if [ -e $PDIR/0000-cover-letter.patch ]; then
 		fi
 	done
 else
-	echo "WARNING: No cover letter will be send."
+	echo "WARNING: No cover letter will be sent."
 fi
 
 # Harvest emails from the generated patches and populate AUTO_CC.
-- 
1.7.6.4



