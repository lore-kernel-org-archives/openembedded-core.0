Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1QjEeb-00079S-4B
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 20:04:22 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6JI0AMj031373
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2011 13:00:10 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2011 11:00:11 -0700
Message-Id: <4c72f46d7c21201c46156f9f8c0c604f2369d7f7.1311097889.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1311097889.git.tom_rini@mentor.com>
References: <cover.1311097889.git.tom_rini@mentor.com>
In-Reply-To: <cover.1311097889.git.tom_rini@mentor.com>
References: <cover.1311097889.git.tom_rini@mentor.com>
Subject: [PATCH v3 4/4] local.conf.sample: Add a note about ASSUME_PROVIDED for help2man
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
X-List-Received-Date: Tue, 19 Jul 2011 18:04:24 -0000

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
1.7.0.4



