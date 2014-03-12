Return-Path: <alexandrux.palalau@linux.intel.com>
Received: from mga14.intel.com (unknown [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 6767D6F791
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 12:23:05 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 12 Mar 2014 05:23:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,637,1389772800"; d="scan'208";a="346800020"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Mar 2014 05:23:06 -0700
Received: from localhost.localdomain (unknown [10.237.112.121])
	by linux.intel.com (Postfix) with ESMTP id 9F0326A4083;
	Wed, 12 Mar 2014 05:22:53 -0700 (PDT)
From: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Mar 2014 14:27:23 +0200
Message-Id: <1394627248-13097-2-git-send-email-alexandrux.palalau@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1394627248-13097-1-git-send-email-alexandrux.palalau@linux.intel.com>
References: <1394627248-13097-1-git-send-email-alexandrux.palalau@linux.intel.com>
Subject: [PATCH v2 1/6] gnome-desktop: removed gconf inheritance
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
X-List-Received-Date: Wed, 12 Mar 2014 12:23:08 -0000

In order to remove WARN-QA message regarding --disable-schemas-install configure option.

Signed-off-by: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
---
 meta/recipes-gnome/gnome/gnome-desktop.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gnome/gnome-desktop.inc b/meta/recipes-gnome/gnome/gnome-desktop.inc
index 4fcf6ab..8bdf476 100644
--- a/meta/recipes-gnome/gnome/gnome-desktop.inc
+++ b/meta/recipes-gnome/gnome/gnome-desktop.inc
@@ -13,7 +13,7 @@ FILES_${PN} += "${datadir}/gnome-about ${datadir}/libgnome-desktop/pnp.ids"
 
 PR = "r6"
 
-inherit gnome pkgconfig
+inherit gnomebase mime gtk-icon-cache
 
 do_install_append () {
 	sed -i -e's,${STAGING_BINDIR_NATIVE},${bindir},g' ${D}${bindir}/gnome-about
-- 
1.8.3.1


