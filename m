Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id E33916D07A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 15:27:32 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Oct 2013 08:27:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1081,1371106800"; d="scan'208";a="373506452"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.234])
	by azsmga001.ch.intel.com with ESMTP; 11 Oct 2013 08:27:34 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2013 08:27:22 -0700
Message-Id: <f41c10731ed3ca98ab7329ccdcbb6175d0b1e252.1381505051.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
References: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
In-Reply-To: <cover.1381505051.git.sgw@linux.intel.com>
References: <cover.1381505051.git.sgw@linux.intel.com>
Subject: [PATCH 16/18] kconfig-frontends: Update to 3.11.0.0
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
X-List-Received-Date: Fri, 11 Oct 2013 15:27:33 -0000

(From OE-Core rev: 83e265e23b258a8d5970841624f1d8d747c8f328)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{kconfig-frontends_3.10.0.0.bb => kconfig-frontends_3.11.0.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/kconfig-frontends/{kconfig-frontends_3.10.0.0.bb => kconfig-frontends_3.11.0.0.bb} (89%)

diff --git a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.10.0.0.bb b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.11.0.0.bb
similarity index 89%
rename from meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.10.0.0.bb
rename to meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.11.0.0.bb
index 901f115..e47c4d7 100644
--- a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.10.0.0.bb
+++ b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.11.0.0.bb
@@ -13,8 +13,8 @@ SECTION = "devel"
 DEPENDS += "ncurses flex bison gperf pkgconfig-native"
 SRC_URI = "http://ymorin.is-a-geek.org/download/${BPN}/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "1ebf13983eb5b2ce960d131cae290cad"
-SRC_URI[sha256sum] = "442a3794b6dd9427f411ecec25dccab1a4bfcf07fe734f62d40e538afd1f0c8a"
+SRC_URI[md5sum] = "b6bd173a39cc32f5e4a580fb1db2e677"
+SRC_URI[sha256sum] = "f4bbd7a2727bef3bb0693b37756457c47f2a08e1ed534cb11e4c8640489e6c8e"
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
-- 
1.8.3.1


