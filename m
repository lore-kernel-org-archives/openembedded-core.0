Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QljiA-0007Xy-Ie
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 17:38:22 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Jul 2011 08:33:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,270,1309762800"; d="scan'208";a="34658288"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.235])
	by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2011 08:33:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 16:33:35 +0100
Message-Id: <555a89ad6f8e908f695d40f1f7ff2d59f1ea2f1a.1311694250.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1311694250.git.paul.eggleton@linux.intel.com>
References: <cover.1311694250.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1311694250.git.paul.eggleton@linux.intel.com>
References: <cover.1311694250.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/4] meta/conf/local.conf.sample: improve terminal examples/comments
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
X-List-Received-Date: Tue, 26 Jul 2011 15:38:22 -0000

Default to XTERM_TERM* instead of KONSOLE_TERM* since Konsole support
only works for KDE 3.x, and note this in the comments (see Yocto bug 1294
for further details.) Also add a comment about PATCHRESOLVE = "noop".

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/local.conf.sample |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 1322202..d8e2383 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -183,8 +183,12 @@ NO32LIBS = "1"
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
1.7.4.1



