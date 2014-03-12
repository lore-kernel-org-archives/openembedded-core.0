Return-Path: <alexandrux.palalau@linux.intel.com>
Received: from mga14.intel.com (unknown [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 6163C6F79F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 12:23:09 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 12 Mar 2014 05:23:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,637,1389772800"; d="scan'208";a="346800024"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Mar 2014 05:23:09 -0700
Received: from localhost.localdomain (unknown [10.237.112.121])
	by linux.intel.com (Postfix) with ESMTP id 58E116A4083;
	Wed, 12 Mar 2014 05:22:57 -0700 (PDT)
From: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Mar 2014 14:27:26 +0200
Message-Id: <1394627248-13097-5-git-send-email-alexandrux.palalau@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1394627248-13097-1-git-send-email-alexandrux.palalau@linux.intel.com>
References: <1394627248-13097-1-git-send-email-alexandrux.palalau@linux.intel.com>
Subject: [PATCH v2 4/6] gsettings-desktop-schemas: removed unneeded class inheritance
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
X-List-Received-Date: Wed, 12 Mar 2014 12:23:09 -0000

Removed gconf, gtk-icon-cache and mime classes as they are not needed

Signed-off-by: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
---
 meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb b/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb
index 40e5b11..312d288 100644
--- a/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb
+++ b/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb
@@ -8,7 +8,7 @@ PR = "r1"
 
 DEPENDS = "glib-2.0"
 
-inherit gnome gsettings gettext
+inherit gnomebase gsettings gettext
 
 GNOME_COMPRESS_TYPE = "xz"
 
-- 
1.8.3.1


