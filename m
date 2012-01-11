Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Rl3Pi-0005A6-1e
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 20:00:46 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0BIqk2k020538;
	Wed, 11 Jan 2012 10:52:49 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 11 Jan 2012 13:52:21 -0500
Message-Id: <444870b95bf46f817a7a9afd633ecaf2d71306dd.1326307011.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1326307011.git.bruce.ashfield@windriver.com>
References: <cover.1326307011.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1326307011.git.bruce.ashfield@windriver.com>
References: <cover.1326307011.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 3/5] qemuppc: add machconfig
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
X-List-Received-Date: Wed, 11 Jan 2012 19:00:46 -0000

From: Liming Wang <liming.wang@windriver.com>

Signed-off-by: Liming Wang <liming.wang@windriver.com>
---
 .../formfactor/files/qemuppc/machconfig            |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100755 meta/recipes-bsp/formfactor/files/qemuppc/machconfig

diff --git a/meta/recipes-bsp/formfactor/files/qemuppc/machconfig b/meta/recipes-bsp/formfactor/files/qemuppc/machconfig
new file mode 100755
index 0000000..5ea2270
--- /dev/null
+++ b/meta/recipes-bsp/formfactor/files/qemuppc/machconfig
@@ -0,0 +1,10 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+ 
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=800
+DISPLAY_HEIGHT_PIXELS=600
+DISPLAY_BPP=16
+DISPLAY_DPI=150
+DISPLAY_SUBPIXEL_ORDER=vrgb
-- 
1.7.4.1



