Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7648065CBB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 09:42:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Jun 2016 02:42:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,444,1459839600"; d="scan'208";a="994181133"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 09 Jun 2016 02:42:46 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jun 2016 12:42:48 +0300
Message-Id: <1465465368-26196-2-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1465465368-26196-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1465465368-26196-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/2] python3-pygobject: only check for even upstream versions
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
X-List-Received-Date: Thu, 09 Jun 2016 09:42:46 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/python/python3-pygobject_3.18.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.18.2.bb b/meta/recipes-devtools/python/python3-pygobject_3.18.2.bb
index 4ddae81..03c6c76 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.18.2.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.18.2.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
-inherit autotools pkgconfig gnomebase distutils3-base gobject-introspection
+inherit autotools pkgconfig gnomebase distutils3-base gobject-introspection upstream-version-is-even
 
 DEPENDS += "python3 glib-2.0"
 
-- 
2.8.1


