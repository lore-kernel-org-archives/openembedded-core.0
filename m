Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 204A673177
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 12:50:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 Apr 2016 05:50:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,512,1455004800"; d="scan'208";a="937197896"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 21 Apr 2016 05:50:46 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Apr 2016 15:50:39 +0300
Message-Id: <53542c5ce5ba60d87ee173265a2dca48c73bcc75.1461235563.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ef643a07644ce1fb207503c2bcaa4148eb8c18ff.1461235563.git.jussi.kukkonen@intel.com>
References: <ef643a07644ce1fb207503c2bcaa4148eb8c18ff.1461235563.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1461235563.git.jussi.kukkonen@intel.com>
References: <cover.1461235563.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/3] connman-gnome: Depend on dbus-glib-native
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
X-List-Received-Date: Thu, 21 Apr 2016 12:50:48 -0000

This is required for dbus-binding-tool.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-connectivity/connman/connman-gnome_0.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
index 7b875f0..3521c7f 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://properties/main.c;beginline=1;endline=20;md5=50c77c81871308b033ab7a1504626afb \
                     file://common/connman-dbus.c;beginline=1;endline=20;md5=de6b485c0e717a0236402d220187717a"
 
-DEPENDS = "gtk+ dbus-glib intltool-native gettext-native"
+DEPENDS = "gtk+ dbus-glib dbus-glib-native intltool-native gettext-native"
 
 # 0.7 tag
 SRCREV = "cf3c325b23dae843c5499a113591cfbc98acb143"
-- 
2.1.4


