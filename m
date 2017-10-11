Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2592278242
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:39:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:39:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1180945911"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 08:39:11 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:34:39 +0300
Message-Id: <3ee4de992fc5e6a3c23967ea682b598bbb89e5a4.1507735448.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 47/50] atk: update to 2.26.0
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
X-List-Received-Date: Wed, 11 Oct 2017 15:39:11 -0000

Remove --disable-glibtest as ./configure no longer has it.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/atk/{atk_2.24.0.bb => atk_2.26.0.bb} | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-support/atk/{atk_2.24.0.bb => atk_2.26.0.bb} (72%)

diff --git a/meta/recipes-support/atk/atk_2.24.0.bb b/meta/recipes-support/atk/atk_2.26.0.bb
similarity index 72%
rename from meta/recipes-support/atk/atk_2.24.0.bb
rename to meta/recipes-support/atk/atk_2.26.0.bb
index d62319c1ff4..e014ba032d9 100644
--- a/meta/recipes-support/atk/atk_2.24.0.bb
+++ b/meta/recipes-support/atk/atk_2.26.0.bb
@@ -12,10 +12,8 @@ DEPENDS = "glib-2.0"
 
 inherit gnomebase gtk-doc gettext upstream-version-is-even gobject-introspection
 
-SRC_URI[archive.md5sum] = "3747a80089dfa3c0bbcf21adfff9968b"
-SRC_URI[archive.sha256sum] = "bb2daa9a808c73a7a79d2983f333e0ba74be42fc51e3ba1faf2551a636487a49"
+SRC_URI[archive.md5sum] = "ee9c329784dead6e386e8b2e0d4d8d6f"
+SRC_URI[archive.sha256sum] = "eafe49d5c4546cb723ec98053290d7e0b8d85b3fdb123938213acb7bb4178827"
 
 BBCLASSEXTEND = "native"
 
-EXTRA_OECONF = "--disable-glibtest \
-               "
-- 
2.14.1


