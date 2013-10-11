Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 2BAFC6D054
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 15:27:29 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Oct 2013 08:27:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1081,1371106800"; d="scan'208";a="373506414"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.234])
	by azsmga001.ch.intel.com with ESMTP; 11 Oct 2013 08:27:30 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2013 08:27:12 -0700
Message-Id: <5e7ea36acb28f96f6d55a35df71c852f1261db7c.1381505051.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
References: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
In-Reply-To: <cover.1381505051.git.sgw@linux.intel.com>
References: <cover.1381505051.git.sgw@linux.intel.com>
Subject: [PATCH 06/18] libbsd: upgrade to 0.6.0
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
X-List-Received-Date: Fri, 11 Oct 2013 15:27:29 -0000

(From OE-Core rev: d7cc46a17b42b23c4f98a3eee3e061be858ab556)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/libbsd/{libbsd_0.5.2.bb => libbsd_0.6.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libbsd/{libbsd_0.5.2.bb => libbsd_0.6.0.bb} (83%)

diff --git a/meta/recipes-support/libbsd/libbsd_0.5.2.bb b/meta/recipes-support/libbsd/libbsd_0.6.0.bb
similarity index 83%
rename from meta/recipes-support/libbsd/libbsd_0.5.2.bb
rename to meta/recipes-support/libbsd/libbsd_0.6.0.bb
index 952f212..771f322 100644
--- a/meta/recipes-support/libbsd/libbsd_0.5.2.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.6.0.bb
@@ -13,7 +13,7 @@ SECTION = "libs"
 DEPENDS = ""
 
 SRC_URI = "http://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "be8b2e0dc4614699834c49693574fd1a"
-SRC_URI[sha256sum] = "5340cf67555a8d92e7652d96540a47986a26eeafb9a0a3e22d3b3e5701ebe23f"
+SRC_URI[md5sum] = "f6c75f0a9818e323a589bcbd560a0eb4"
+SRC_URI[sha256sum] = "9e8f34ffa9c8579c87965a55a82d8ac37a1dc64858f717b7c49452ade277cc62"
 
 inherit autotools pkgconfig
-- 
1.8.3.1


