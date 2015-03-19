Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7071C723BF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 21:50:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 19 Mar 2015 14:50:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,432,1422950400"; d="scan'208";a="701305691"
Received: from yctb03.ostc.intel.com (HELO yctb03.otcr.jf.intel.com)
	([10.23.219.52])
	by orsmga002.jf.intel.com with ESMTP; 19 Mar 2015 14:50:57 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Mar 2015 13:45:49 +0000
Message-Id: <72e05501cdcd7edf186d4aea4914c90fcb346327.1426772606.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1426772606.git.anibal.limon@linux.intel.com>
References: <cover.1426772606.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1426772606.git.anibal.limon@linux.intel.com>
References: <cover.1426772606.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv4 2/2] xserver-nodm-init: Change to vt1 when stop
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Mar 2015 21:50:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When X is stopped it remains in the same vt that was launched,
change to vt1 instead to avoid manual vt switch.

[YOCTO #5336]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
index ef6c11c..2e3e090 100755
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
@@ -48,6 +48,7 @@ case "$1" in
   stop)
         echo "Stopping XServer"
         killproc xinit
+        chvt 1
   ;;
 
   restart)
-- 
1.8.4.5


