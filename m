Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrP5U-0004Vi-AJ
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 09:54:25 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Jul 2012 00:43:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="169736827"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by azsmga001.ch.intel.com with ESMTP; 18 Jul 2012 00:43:01 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2012 00:42:46 -0700
Message-Id: <aaa2f9d236a6254902de768102ef86bbe78b80fa.1342597081.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <fee3def2ca49e3349758d9cd9a9cf5645f03cf18.1342597081.git.sgw@linux.intel.com>
References: <fee3def2ca49e3349758d9cd9a9cf5645f03cf18.1342597081.git.sgw@linux.intel.com>
In-Reply-To: <cover.1342597081.git.sgw@linux.intel.com>
References: <cover.1342597081.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 17/18] slang: add header to patch
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
X-List-Received-Date: Wed, 18 Jul 2012 07:57:19 -0000

From: "Roy.Li" <rongqing.li@windriver.com>

Add description, Signed-off-by and Upstream-Status to
change-char-type-to-signed-char-in-macros.patch

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...change-char-type-to-signed-char-in-macros.patch |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/slang/slang/change-char-type-to-signed-char-in-macros.patch b/meta/recipes-extended/slang/slang/change-char-type-to-signed-char-in-macros.patch
index 18dea13..2ea1ffd 100644
--- a/meta/recipes-extended/slang/slang/change-char-type-to-signed-char-in-macros.patch
+++ b/meta/recipes-extended/slang/slang/change-char-type-to-signed-char-in-macros.patch
@@ -1,3 +1,19 @@
+slang: change char type to signed char in macros
+
+C language has 3 distinct char types:
+         char
+         unsigned char
+         signed char
+A char has the same range of values as signed char on X86,
+but same as unsigned char on ARM which made Slang's typecast()
+and array_sort() unable to work for char value on ARM, since
+Slang is assuming "char" as "signed char".
+
+Now we change "char" as "signed char" explicitly in
+util/mkslarith2.sl, and use it to regenerate src/slarith2.inc
+
+Upstream-Status: Submitted
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
 ---
  src/slarith2.inc       |   72 ++++++++++++++++++++++++-------------------------
  src/util/mkslarith2.sl |    2 -
-- 
1.7.7.6



