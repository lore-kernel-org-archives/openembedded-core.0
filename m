Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UBYYK-0007fS-Da
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 23:36:01 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 Mar 2013 14:19:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,765,1355126400"; d="scan'208";a="269795583"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.231])
	by orsmga001.jf.intel.com with ESMTP; 01 Mar 2013 14:19:19 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Mar 2013 14:19:18 -0800
Message-Id: <1362176358-27077-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <1362176358-27077-1-git-send-email-sgw@linux.intel.com>
References: <1362176358-27077-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/2] pulseaudio: add config option to ensure valgrind is excluded
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Mar 2013 22:36:05 -0000

There have been occasions that pulseaudio sees valgrind and then later it's
not available, adding this setting ensures determinism by disabling it by
default

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 9929f1b..2506e41 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -41,6 +41,7 @@ EXTRA_OECONF = "\
 		--disable-xen \
 		--with-database=simple \
 		--without-fftw \
+                ac_cv_header_valgrind_memcheck_h=no \
 "
 
 EXTRA_OECONF_append_arm += "${@bb.utils.contains("TUNE_FEATURES", "neon", "", "--enable-neon-opt=no", d)}"
-- 
1.8.0.2



