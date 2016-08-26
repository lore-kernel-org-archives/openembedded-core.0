Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2A26577026
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 14:30:37 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP; 26 Aug 2016 07:30:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,581,1464678000"; 
   d="scan'208";a="1525570"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by orsmga004.jf.intel.com with ESMTP; 26 Aug 2016 07:30:37 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 17:28:28 +0300
Message-Id: <fe8639f400be16389a1019c58374a889d0b2bf4f.1472221205.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 13/28] dbus-glib: enable gtk-doc
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
X-List-Received-Date: Fri, 26 Aug 2016 14:30:37 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-core/dbus/dbus-glib.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus-glib.inc b/meta/recipes-core/dbus/dbus-glib.inc
index 4661e3a..55f710f 100644
--- a/meta/recipes-core/dbus/dbus-glib.inc
+++ b/meta/recipes-core/dbus/dbus-glib.inc
@@ -15,7 +15,7 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-${PV}.tar.gz
            file://test-install-makefile.patch \
 "
 
-inherit autotools pkgconfig gettext bash-completion
+inherit autotools pkgconfig gettext bash-completion gtk-doc
 
 #default disable regression tests, some unit test code in non testing code
 #PACKAGECONFIG_pn-${PN} = "tests" enable regression tests local.conf
-- 
2.9.3


