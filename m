Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DBE2478227
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:39:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:39:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1180945898"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 08:39:06 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:34:34 +0300
Message-Id: <a1b02a7fb4ed25aa406aa815f4d52dc721a8b1ae.1507735448.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 42/50] vte: update to 0.50.1
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
X-List-Received-Date: Wed, 11 Oct 2017 15:39:07 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/vte/{vte_0.48.3.bb => vte_0.50.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/vte/{vte_0.48.3.bb => vte_0.50.1.bb} (91%)

diff --git a/meta/recipes-support/vte/vte_0.48.3.bb b/meta/recipes-support/vte/vte_0.50.1.bb
similarity index 91%
rename from meta/recipes-support/vte/vte_0.48.3.bb
rename to meta/recipes-support/vte/vte_0.50.1.bb
index 47208417b45..1c77c7dceea 100644
--- a/meta/recipes-support/vte/vte_0.48.3.bb
+++ b/meta/recipes-support/vte/vte_0.50.1.bb
@@ -11,8 +11,8 @@ inherit gnomebase gtk-doc distro_features_check upstream-version-is-even gobject
 SRC_URI += "file://0001-Don-t-enable-stack-protection-by-default.patch \
             ${@bb.utils.contains('PACKAGECONFIG', 'vala', '', 'file://0001-Add-m4-vapigen.m4.patch', d) } \
             "
-SRC_URI[archive.md5sum] = "b300675ac5f269aa6eb48fe89a0d726d"
-SRC_URI[archive.sha256sum] = "a3a9fb182740b392a45cd3f46fa61a985f68bb6b1817b52daec22034c46158c3"
+SRC_URI[archive.md5sum] = "a6f8fec3787e3cb72b3b31a8be6751a4"
+SRC_URI[archive.sha256sum] = "cf1708e3e573160e1db107014b3ef70888fefe6b668373fed70e8d1cac45a8c2"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.14.1


