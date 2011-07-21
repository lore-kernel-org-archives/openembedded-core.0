Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qjo8i-0001En-2j
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 09:57:48 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 21 Jul 2011 00:53:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,240,1309762800"; d="scan'208";a="29787094"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by azsmga001.ch.intel.com with ESMTP; 21 Jul 2011 00:53:16 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2011 00:53:08 -0700
Message-Id: <41872a8b09dd83bd3a0f8388bacb453a2c07dfb8.1311234475.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311234475.git.sgw@linux.intel.com>
References: <cover.1311234475.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311234475.git.sgw@linux.intel.com>
References: <cover.1311234475.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 20/20] local.conf.sample: Add a note about ASSUME_PROVIDED for help2man
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
X-List-Received-Date: Thu, 21 Jul 2011 07:57:54 -0000

From: Tom Rini <tom_rini@mentor.com>

Similar, but opposite of oe.dev example.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/conf/local.conf.sample |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index c33dc0e..812b896 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -186,3 +186,6 @@ NO32LIBS = "1"
 # GNOME, SCREEN, XTERM and KONSOLE
 #TERMCMD = "${KONSOLE_TERMCMD}"
 #TERMCMDRUN = "${KONSOLE_TERMCMDRUN}"
+
+# Uncomment this if your host distribution provides the help2man tool.
+#ASSUME_PROVIDED += "help2man-native"
-- 
1.7.3.4



