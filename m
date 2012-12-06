Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TghhY-0001dC-Vk
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 21:05:46 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 06 Dec 2012 11:50:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,232,1355126400"; d="scan'208";a="229984193"
Received: from unknown (HELO swold-linux.bigsur.com.bigsur.com)
	([10.255.12.65])
	by orsmga001.jf.intel.com with ESMTP; 06 Dec 2012 11:51:17 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Dec 2012 11:51:17 -0800
Message-Id: <1354823477-7424-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.1
Subject: [PATCH] sstate: fix typo
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
X-List-Received-Date: Thu, 06 Dec 2012 20:05:47 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 29c1007..d1dbb5a 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -217,7 +217,7 @@ def sstate_installpkg(ss, d):
     if not os.path.exists(sstatepkg):
         pstaging_fetch(sstatefetch, sstatepkg, d)
     if not os.path.exists(sstagepkg + ".siginfo"):
-        pstaging_fetch(sstatefetch + ".siginfo", ssstatepkg + ".siginfo", d)
+        pstaging_fetch(sstatefetch + ".siginfo", sstatepkg + ".siginfo", d)
 
     if not os.path.isfile(sstatepkg):
         bb.note("Staging package %s does not exist" % sstatepkg)
-- 
1.8.0.1



