Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UPJ2i-0006iG-5Q
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 22:51:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Apr 2013 13:34:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,432,1363158000"; d="scan'208";a="291937563"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.17])
	by orsmga001.jf.intel.com with ESMTP; 08 Apr 2013 13:34:20 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Apr 2013 13:34:20 -0700
Message-Id: <1365453260-32342-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH] alsa-tools: Fix sys/io.h patch
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
X-List-Received-Date: Mon, 08 Apr 2013 20:51:56 -0000

I blew my #if expression!

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-multimedia/alsa/alsa-tools/mips_has_no_io_h.patch | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools/mips_has_no_io_h.patch b/meta/recipes-multimedia/alsa/alsa-tools/mips_has_no_io_h.patch
index 7083cb2..09b10f1 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools/mips_has_no_io_h.patch
+++ b/meta/recipes-multimedia/alsa/alsa-tools/mips_has_no_io_h.patch
@@ -1,3 +1,6 @@
+Upstream-Status: Pending
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
 Index: alsa-tools-1.0.26.1/hda-verb/hda-verb.c
 ===================================================================
 --- alsa-tools-1.0.26.1.orig/hda-verb/hda-verb.c
@@ -7,7 +10,7 @@ Index: alsa-tools-1.0.26.1/hda-verb/hda-verb.c
  #include <unistd.h>
  #include <sys/ioctl.h>
 -#ifndef __PPC__
-+#if __PPC__ || __MIPS__
++#if !(__PPC__ || __mips__)
  #include <sys/io.h>
  #endif
  #include <sys/types.h>
-- 
1.8.0.2



