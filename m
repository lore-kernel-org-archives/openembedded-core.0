Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9C22665D18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 13:51:18 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Apr 2014 06:51:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,951,1389772800"; d="scan'208";a="531596763"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga002.jf.intel.com with ESMTP; 29 Apr 2014 06:51:15 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Apr 2014 16:29:51 +0300
Message-Id: <f63dea49da38e2980856bfe11b83264f43e39e02.1398775392.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1398775392.git.laurentiu.palcu@intel.com>
References: <cover.1398775392.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1398775392.git.laurentiu.palcu@intel.com>
References: <cover.1398775392.git.laurentiu.palcu@intel.com>
Subject: [PATCH 09/12] kexec-tools: upgrade to 2.0.6
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
X-List-Received-Date: Tue, 29 Apr 2014 13:51:18 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../{kexec-tools_2.0.4.bb => kexec-tools_2.0.6.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.4.bb => kexec-tools_2.0.6.bb} (57%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.4.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.6.bb
similarity index 57%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.4.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.6.bb
index de44cf0..38a8947 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.4.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.6.bb
@@ -2,8 +2,8 @@ require kexec-tools.inc
 export LDFLAGS = "-L${STAGING_LIBDIR}"
 EXTRA_OECONF = " --with-zlib=yes"
 
-SRC_URI[md5sum] = "b9f2a3ba0ba9c78625ee7a50532500d8"
-SRC_URI[sha256sum] = "6ba1872c58434b8e92506ff515c7ef64555671af54097bae51b833bda3f5126c"
+SRC_URI[md5sum] = "c39ea40a7598e49b6dc961ee7de38f57"
+SRC_URI[sha256sum] = "a9c6cd9adc8c1c37b3272782f581cb8b4b4070d0e3e921a558a9083f68dcf29a"
 
 PACKAGES =+ "kexec kdump"
 
-- 
1.7.9.5


