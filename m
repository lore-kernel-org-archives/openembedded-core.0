Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T3Nq6-0001Va-QT
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 11:00:03 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Aug 2012 01:47:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,796,1336374000"; d="scan'208";a="188632124"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.92])
	by orsmga002.jf.intel.com with ESMTP; 20 Aug 2012 01:47:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2012 09:47:56 +0100
Message-Id: <1345452476-5231-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] classes/sanity: remove texi2html from required host utilities
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
X-List-Received-Date: Mon, 20 Aug 2012 09:00:03 -0000

texi2html is not actually required to build world of OE-Core anymore,
so we don't need to mandate it. The only difference without it (verified
with buildhistory) is that groff doesn't produce HTML documentation; the
rest of its docs are still produced and packaged and no other packages
are affected.

Part of the work towards [YOCTO #2423].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sanity.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 575ce15..ff7c73b 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -2,7 +2,7 @@
 # Sanity check the users setup for common misconfigurations
 #
 
-SANITY_REQUIRED_UTILITIES ?= "patch diffstat texi2html makeinfo git bzip2 tar gzip gawk chrpath wget cpio"
+SANITY_REQUIRED_UTILITIES ?= "patch diffstat makeinfo git bzip2 tar gzip gawk chrpath wget cpio"
 
 def raise_sanity_error(msg, d):
     if d.getVar("SANITY_USE_EVENTS", True) == "1":
-- 
1.7.9.5



