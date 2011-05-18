Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMpFt-0003uj-Lr
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 00:30:13 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 May 2011 15:27:17 -0700
X-ExtLoop1: 1
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.160])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2011 15:27:17 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 15:26:30 -0700
Message-Id: <fc7402495a8a30b203d5535e73383bc4412e2a1f.1305756950.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1305756950.git.sgw@linux.intel.com>
References: <cover.1305756950.git.sgw@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 01/30] diffutils: fix libc overrides
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
X-List-Received-Date: Wed, 18 May 2011 22:30:13 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-extended/diffutils/diffutils_2.8.1.bb |    2 +-
 meta/recipes-extended/diffutils/diffutils_3.0.bb   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/diffutils/diffutils_2.8.1.bb b/meta/recipes-extended/diffutils/diffutils_2.8.1.bb
index 9489b35..0fb3a31 100644
--- a/meta/recipes-extended/diffutils/diffutils_2.8.1.bb
+++ b/meta/recipes-extended/diffutils/diffutils_2.8.1.bb
@@ -20,7 +20,7 @@ inherit autotools update-alternatives gettext
 # standard functionality.  regex.c actually breaks compilation
 # because it uses __mempcpy, there are other things (TBD:
 # see diffutils.mk in buildroot)
-EXTRA_OECONF_linux-uclibc = "--without-included-regex"
+EXTRA_OECONF_libc-uclibc = "--without-included-regex"
 
 ALTERNATIVE_LINKS = "${bindir}/diff ${bindir}/cmp"
 ALTERNATIVE_PRIORITY = "100"
diff --git a/meta/recipes-extended/diffutils/diffutils_3.0.bb b/meta/recipes-extended/diffutils/diffutils_3.0.bb
index 427efdf..ecff5cc 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.0.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.0.bb
@@ -16,7 +16,7 @@ inherit autotools update-alternatives gettext
 # standard functionality.  regex.c actually breaks compilation
 # because it uses __mempcpy, there are other things (TBD:
 # see diffutils.mk in buildroot)
-EXTRA_OECONF_linux-uclibc = "--without-included-regex"
+EXTRA_OECONF_libc-uclibc = "--without-included-regex"
 
 ALTERNATIVE_LINKS = "${bindir}/diff ${bindir}/cmp"
 ALTERNATIVE_PRIORITY = "100"
-- 
1.7.3.4



