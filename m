Return-Path: <alexandrux.palalau@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 15AE06F796
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 12:23:46 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 Mar 2014 05:23:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,637,1389772800"; d="scan'208";a="490451100"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 12 Mar 2014 05:23:11 -0700
Received: from localhost.localdomain (unknown [10.237.112.121])
	by linux.intel.com (Postfix) with ESMTP id 99FEB6A4083;
	Wed, 12 Mar 2014 05:22:58 -0700 (PDT)
From: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Mar 2014 14:27:27 +0200
Message-Id: <1394627248-13097-6-git-send-email-alexandrux.palalau@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1394627248-13097-1-git-send-email-alexandrux.palalau@linux.intel.com>
References: <1394627248-13097-1-git-send-email-alexandrux.palalau@linux.intel.com>
Subject: [PATCH v2 5/6] gnome-doc-utils: removed gconf inheritance
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
X-List-Received-Date: Wed, 12 Mar 2014 12:23:47 -0000

In order to remove WARN-QA message regarding --disable-schemas-install configure option.

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


