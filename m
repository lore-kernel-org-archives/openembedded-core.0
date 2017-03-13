Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A1A09776C7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 23:06:20 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Mar 2017 16:06:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,161,1486454400"; d="scan'208";a="67073531"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga004.jf.intel.com with ESMTP; 13 Mar 2017 16:06:21 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Mar 2017 16:06:16 -0700
Message-Id: <1489446377-13434-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489446377-13434-1-git-send-email-juro.bystricky@intel.com>
References: <1489446377-13434-1-git-send-email-juro.bystricky@intel.com>
Cc: richard.purdie@intel.com, jurobystricky@hotmail.com
Subject: [morty][PATCH 1/2] gdb-cross-canadian: Depend on nativesdk-python3-importlib
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
X-List-Received-Date: Mon, 13 Mar 2017 23:06:31 -0000

From: George McCollister <george.mccollister@gmail.com>

Add missing dependency on nativesdk-python3-importlib so the imp Python
module is installed.

Before this patch, running gdb from the sdk would give the following
error:

Python Exception <class 'ImportError'> No module named 'imp':

(From OE-Core rev: ad00a31fbe93e073a2d83616efcd08c5a7ef37c9)

Signed-off-by: George McCollister <george.mccollister@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index e53081d..3ff1989 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -14,7 +14,8 @@ GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 PACKAGECONFIG ??= "python readline"
 PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,nativesdk-python3, \
                          nativesdk-python3-core nativesdk-python3-lang nativesdk-python3-re \
-                         nativesdk-python3-codecs nativesdk-python3-netclient"
+                         nativesdk-python3-codecs nativesdk-python3-netclient \
+                         nativesdk-python3-importlib"
 PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,nativesdk-readline"
 
 SSTATE_DUPWHITELIST += "${STAGING_DATADIR}/gdb"
-- 
2.7.4


