Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qlyu8-0001t1-4h
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 09:51:44 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Jul 2011 00:47:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,275,1309762800"; d="scan'208";a="31949284"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 27 Jul 2011 00:47:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 00:46:53 -0700
Message-Id: <9dff2e00d5383e9404125cbd405d37f3e62ce940.1311752531.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
Subject: [Consolidated & Tested 03/35] meta/conf/local.conf.sample: improve terminal examples/comments
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
X-List-Received-Date: Wed, 27 Jul 2011 07:51:44 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Default to XTERM_TERM* instead of KONSOLE_TERM* since Konsole support
only works for KDE 3.x, and note this in the comments (see Yocto bug 1294
for further details.) Also add a comment about PATCHRESOLVE = "noop".

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/local.conf.sample |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 6bdd314..1f66c89 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -194,8 +194,12 @@ NO32LIBS = "1"
 # when resolving patches which cannot be applied
 # Supported shell prefixes for *_TERMCMD and *_TERMCMDRUN ARE:
 # GNOME, SCREEN, XTERM and KONSOLE
-#TERMCMD = "${KONSOLE_TERMCMD}"
-#TERMCMDRUN = "${KONSOLE_TERMCMDRUN}"
+# Note: currently, Konsole support only works for KDE 3.x due to the way
+# newer Konsole versions behave
+#TERMCMD = "${XTERM_TERMCMD}"
+#TERMCMDRUN = "${XTERM_TERMCMDRUN}"
+# Alternatively, if you prefer you can disable patch resolution:
+#PATCHRESOLVE = "noop"
 
 # Uncomment this if your host distribution provides the help2man tool.
 #ASSUME_PROVIDED += "help2man-native"
-- 
1.7.3.4



