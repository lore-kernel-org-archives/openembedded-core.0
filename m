Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Ptcyc-0007FT-Ur
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:42 +0100
Received: by mail-ww0-f43.google.com with SMTP id 15so3169077wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:30:21 -0800 (PST)
Received: by 10.216.171.76 with SMTP id q54mr3518624wel.93.1298799021709;
	Sun, 27 Feb 2011 01:30:21 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id t5sm1283580wes.33.2011.02.27.01.30.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:30:21 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:55 +0100
Message-Id: <433097b803822c14de35195889734d3fd9100446.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 43/50] prelink: Add missing macro.prelink file
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
X-List-Received-Date: Sun, 27 Feb 2011 09:31:43 -0000

From: Mark Hatle <mark.hatle@windriver.com>

Add the missing macro.prelink file...

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../prelink/prelink/macros.prelink                 |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/prelink/prelink/macros.prelink

diff --git a/meta/recipes-devtools/prelink/prelink/macros.prelink b/meta/recipes-devtools/prelink/prelink/macros.prelink
new file mode 100644
index 0000000..cb16695
--- /dev/null
+++ b/meta/recipes-devtools/prelink/prelink/macros.prelink
@@ -0,0 +1,5 @@
+# rpm-4.1 verifies prelinked libraries using a prelink undo helper.
+#       Note: The 2nd token is used as argv[0] and "library" is a
+#       placeholder that will be deleted and replaced with the appropriate
+#       library file path.
+%__prelink_undo_cmd     /usr/sbin/prelink prelink -y library
-- 
1.6.6.1



