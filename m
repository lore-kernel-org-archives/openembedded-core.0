Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F0F966013D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 22:25:57 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 18 Mar 2015 15:26:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,425,1422950400"; d="scan'208";a="694185164"
Received: from aehernan-devstation.zpn.intel.com ([10.219.4.44])
	by fmsmga002.fm.intel.com with ESMTP; 18 Mar 2015 15:25:59 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Mar 2015 16:25:55 -0600
Message-Id: <1426717555-4589-2-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1426717555-4589-1-git-send-email-alejandro.hernandez@linux.intel.com>
References: <1426717555-4589-1-git-send-email-alejandro.hernandez@linux.intel.com>
Subject: [PATCH v2 2/2] python-pexpect: Adds this module to buildtools, since it is needed by some of the automated runtime test code.
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
X-List-Received-Date: Wed, 18 Mar 2015 22:25:58 -0000

[YOCTO 7279]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 302510c..6d4c8c8 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -12,6 +12,7 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-python-modules \
     nativesdk-python-misc \
     nativesdk-python-git \
+    nativesdk-python-pexpect \
     nativesdk-ncurses-terminfo-base \
     nativesdk-chrpath \
     nativesdk-tar \
-- 
1.9.1


