Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7427962137
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 20:42:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Apr 2016 13:42:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,548,1455004800"; d="scan'208";a="964922136"
Received: from unknown (HELO yocto-dev86.jf.intel.com) ([10.7.198.63])
	by orsmga002.jf.intel.com with ESMTP; 28 Apr 2016 13:42:49 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Apr 2016 13:43:27 -0700
Message-Id: <1461876207-9624-1-git-send-email-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.8.0
Subject: [PATCH] toolchain-scripts: replace source built-in call
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
X-List-Received-Date: Thu, 28 Apr 2016 20:42:52 -0000

Some shells (e.g. dash) do not support the source built-in. This
replaces it with the dot operator.

[ YOCTO #9535 ]

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 meta/classes/toolchain-scripts.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 2e2c93a..02e69c8 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -89,12 +89,12 @@ toolchain_shared_env_script () {
 # Append environment subscripts
 if [ -d "\$OECORE_TARGET_SYSROOT/environment-setup.d" ]; then
     for envfile in \$OECORE_TARGET_SYSROOT/environment-setup.d/*.sh; do
-	    source \$envfile
+	    . \$envfile
     done
 fi
 if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d" ]; then
     for envfile in \$OECORE_NATIVE_SYSROOT/environment-setup.d/*.sh; do
-	    source \$envfile
+	    . \$envfile
     done
 fi
 EOF
-- 
2.8.0


