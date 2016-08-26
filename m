Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 111AA77041
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 14:30:28 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP; 26 Aug 2016 07:30:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,581,1464678000"; 
   d="scan'208";a="1525551"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by orsmga004.jf.intel.com with ESMTP; 26 Aug 2016 07:30:28 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 17:28:20 +0300
Message-Id: <f8d3719768cbb324f72a5e7e25fb50832b71385f.1472221205.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 05/28] kmod: do not let gtkdocize fail
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
X-List-Received-Date: Fri, 26 Aug 2016 14:30:28 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-kernel/kmod/kmod.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index 99c4a8f..d4c7b18 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -35,7 +35,7 @@ PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
 PACKAGECONFIG[logging] = " --enable-logging,--disable-logging"
 
 do_configure_prepend () {
-        gtkdocize --docdir ${S}/libkmod/docs || touch ${S}/libkmod/docs/gtk-doc.make
+        gtkdocize --docdir ${S}/libkmod/docs --srcdir ${S}
 }
 
 do_configure_append () {
-- 
2.9.3


