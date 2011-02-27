Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PtcyK-0007Da-AG
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:24 +0100
Received: by mail-wy0-f175.google.com with SMTP id 38so2800543wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:30:02 -0800 (PST)
Received: by 10.216.10.208 with SMTP id 58mr3767432wev.14.1298799002535;
	Sun, 27 Feb 2011 01:30:02 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id s50sm1284705weh.22.2011.02.27.01.30.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:30:02 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:36 +0100
Message-Id: <98c9fcbc13246e86a6c119f3c9d5a432b0f786dd.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 28/50] poky-image-lsb-sdk.bb: add image for LSB SDK Build
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
X-List-Received-Date: Sun, 27 Feb 2011 09:36:29 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/images/poky-image-lsb-sdk.bb |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/images/poky-image-lsb-sdk.bb

diff --git a/meta/recipes-extended/images/poky-image-lsb-sdk.bb b/meta/recipes-extended/images/poky-image-lsb-sdk.bb
new file mode 100644
index 0000000..184b5d7
--- /dev/null
+++ b/meta/recipes-extended/images/poky-image-lsb-sdk.bb
@@ -0,0 +1,9 @@
+IMAGE_FEATURES += "apps-console-core tools-debug tools-profile tools-sdk dev-pkgs"
+
+IMAGE_INSTALL = "\
+    ${POKY_BASE_INSTALL} \
+    task-poky-basic \
+    task-poky-lsb \
+    "
+
+inherit poky-image
-- 
1.6.6.1



