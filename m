Return-Path: <alexandrux.palalau@linux.intel.com>
Received: from mga14.intel.com (unknown [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 4EF4C60C19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 08:32:05 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 12 Mar 2014 01:32:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,636,1389772800"; d="scan'208";a="346784063"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Mar 2014 01:32:06 -0700
Received: from localhost.localdomain (unknown [10.237.112.121])
	by linux.intel.com (Postfix) with ESMTP id 870546A4087;
	Wed, 12 Mar 2014 01:31:53 -0700 (PDT)
From: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Mar 2014 10:36:21 +0200
Message-Id: <1394613382-28992-6-git-send-email-alexandrux.palalau@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1394613382-28992-1-git-send-email-alexandrux.palalau@linux.intel.com>
References: <1394613382-28992-1-git-send-email-alexandrux.palalau@linux.intel.com>
Subject: [PATCH 5/6] gnome-doc-utils: removed gconf inheritance
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
X-List-Received-Date: Wed, 12 Mar 2014 08:32:06 -0000

Signed-off-by: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
---
 meta/recipes-gnome/gnome/gnome-doc-utils.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils.inc b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
index 0cc0ee5..ddda3a6 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils.inc
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 DEPENDS = "libxml2 libxslt libxslt-native gnome-doc-utils-native glib-2.0"
 DEPENDS_class-native = "libxml2-native libxslt-native intltool-native glib-2.0-native"
 
-inherit gnome gettext python-dir pythonnative autotools-brokensep
+inherit gnomebase gettext python-dir pythonnative autotools-brokensep gtk-icon-cache mime
 
 EXTRA_OECONF += "--disable-scrollkeeper"
 
-- 
1.8.3.1


