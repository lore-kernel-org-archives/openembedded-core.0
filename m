Return-Path: <alexandrux.palalau@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0DB296E8DE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 08:32:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Mar 2014 01:32:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,636,1389772800"; d="scan'208";a="470763999"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 12 Mar 2014 01:32:07 -0700
Received: from localhost.localdomain (unknown [10.237.112.121])
	by linux.intel.com (Postfix) with ESMTP id CD8746A4083;
	Wed, 12 Mar 2014 01:31:54 -0700 (PDT)
From: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Mar 2014 10:36:22 +0200
Message-Id: <1394613382-28992-7-git-send-email-alexandrux.palalau@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1394613382-28992-1-git-send-email-alexandrux.palalau@linux.intel.com>
References: <1394613382-28992-1-git-send-email-alexandrux.palalau@linux.intel.com>
Subject: [PATCH 6/6] gtk-engines: removed gconf inheritance
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
X-List-Received-Date: Wed, 12 Mar 2014 08:32:07 -0000

Signed-off-by: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
---
 meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
index ba07ac0..09534aa 100644
--- a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
+++ b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
@@ -26,7 +26,7 @@ FILES_${PN}-dbg += "${libdir}/gtk-2.0/*/engines/.debug"
 
 CFLAGS_prepend = "-DHAVE_ANIMATION "
 
-inherit gnome
+inherit gnomebase gtk-icon-cache mime
 
 python populate_packages_prepend() {
     engines_root = os.path.join(d.getVar('libdir', True), "gtk-2.0/2.10.0/engines")
-- 
1.8.3.1


