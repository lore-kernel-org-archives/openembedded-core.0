Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Ptcyo-0007FI-5X
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:54 +0100
Received: by mail-wy0-f175.google.com with SMTP id 38so2800700wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:30:32 -0800 (PST)
Received: by 10.216.186.142 with SMTP id w14mr4293725wem.18.1298799030660;
	Sun, 27 Feb 2011 01:30:30 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id f52sm1282992wes.35.2011.02.27.01.30.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:30:30 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:30:04 +0100
Message-Id: <439b2f752a323d27824ea634e67e9c4521fa1d42.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 50/50] task-poky-lsb: libqtopenqgl4 should be for qemux86 and atom-pc only
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
X-List-Received-Date: Sun, 27 Feb 2011 09:31:54 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/tasks/task-poky-lsb.bb |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/tasks/task-poky-lsb.bb b/meta/recipes-extended/tasks/task-poky-lsb.bb
index 5120764..ab640bd 100644
--- a/meta/recipes-extended/tasks/task-poky-lsb.bb
+++ b/meta/recipes-extended/tasks/task-poky-lsb.bb
@@ -149,7 +149,6 @@ RDEPENDS_task-poky-lsb-graphic-add = "\
     libqtsvg4 \
     libqtxml4 \
     libqtnetwork4 \
-    libqtopengl4 \
     libxt \
     libxxf86vm \
     libdrm \
@@ -159,6 +158,13 @@ RDEPENDS_task-poky-lsb-graphic-add = "\
     qt4-plugin-sqldriver-sqlite \
 "
 
+RDEPENDS_task-poky-lsb-graphic-add_qemux86 = "\
+    libqtopengl4 \
+"
+RDEPENDS_task-poky-lsb-graphic-add_atom-pc = "\
+    libqtopengl4 \
+"
+
 #    mesa-dri 
 
 RDEPENDS_task-poky-lsb-runtime-add = "\
-- 
1.6.6.1



