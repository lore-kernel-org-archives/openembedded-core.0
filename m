Return-Path: <alexandrux.palalau@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 783D26EFCB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 10:01:44 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 27 Feb 2014 02:01:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,553,1389772800"; d="scan'208";a="344116655"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Feb 2014 02:01:38 -0800
Received: from localhost.localdomain (unknown [10.237.112.121])
	by linux.intel.com (Postfix) with ESMTP id BF30F6A4083;
	Thu, 27 Feb 2014 02:01:27 -0800 (PST)
From: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2014 12:05:41 +0200
Message-Id: <1393495541-13473-1-git-send-email-alexandrux.palalau@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Cc: Alexandru Palalau <alexandrux.palalau@intel.com>
Subject: [PATCH] libnotify: don't use gnome.bbclass
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
X-List-Received-Date: Thu, 27 Feb 2014 10:01:44 -0000

From: Alexandru Palalau <alexandrux.palalau@intel.com>

gnome.bbclass pulls in more functionality than this recipe needs (icon cache,
MIME, GConf), so instead just use gnomebase.bbclass.

Signed-off-by: Alexandru Palalau <alexandrux.palalau@intel.com>
---
 meta/recipes-gnome/libnotify/libnotify_0.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb b/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb
index 61ae5e6..d516e65 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb
@@ -7,7 +7,7 @@ PR = "r1"
 
 DEPENDS = "dbus gtk+"
 
-inherit gnome
+inherit gnomebase
 SRC_URI[archive.md5sum] = "732c9d2cd5eb6a9069264a319d330516"
 SRC_URI[archive.sha256sum] = "73b16a79bb2fed62dcf146b11c4405776cb96a09dce66379ca541da7dbd64210"
 
-- 
1.8.3.1


