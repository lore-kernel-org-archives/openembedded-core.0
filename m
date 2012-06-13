Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Seqdy-0005dx-Ud
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jun 2012 18:42:07 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 Jun 2012 09:31:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="152668158"
Received: from unknown (HELO shamshir.jf.intel.com) ([10.7.198.155])
	by orsmga001.jf.intel.com with ESMTP; 13 Jun 2012 09:31:30 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jun 2012 09:31:26 -0700
Message-Id: <ce0ae088f2b523cd40c94c77cd26785df381f0bf.1339604980.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.10.2
In-Reply-To: <cover.1339604980.git.josh@linux.intel.com>
References: <cover.1339604980.git.josh@linux.intel.com>
In-Reply-To: <cover.1339604980.git.josh@linux.intel.com>
References: <cover.1339604980.git.josh@linux.intel.com>
Subject: [2011-1 PATCH 1/2] ghostscript-native: Ensure the sys/time/h fix is applied for native builds
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
X-List-Received-Date: Wed, 13 Jun 2012 16:42:07 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

On my system, the sys/time.h header is in a subdir off /usr/include
which causes a build failure. Apply the target CFLAGS fix to native
builds as well to address this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.02.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.02.bb b/meta/recipes-extended/ghostscript/ghostscript_9.02.bb
index 9b21c66..99c4f5c 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.02.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.02.bb
@@ -40,6 +40,7 @@ EXTRA_OECONF = "--without-x --with-system-libtiff --without-jbig2dec --without-j
 # http://bugs.ghostscript.com/show_bug.cgi?id=692443
 # http://bugs.ghostscript.com/show_bug.cgi?id=692426
 CFLAGS += "-DHAVE_SYS_TIME_H=1"
+BUILD_CFLAGS += "-DHAVE_SYS_TIME_H=1"
 
 inherit autotools
 
-- 
1.7.10.2



