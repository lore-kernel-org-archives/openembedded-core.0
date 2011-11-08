Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RNZNH-0003E0-Mx
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 01:17:11 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Nov 2011 16:10:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="72146545"
Received: from unknown (HELO shamshir.jf.intel.com) ([10.7.199.75])
	by orsmga001.jf.intel.com with ESMTP; 07 Nov 2011 16:10:50 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2011 16:10:46 -0800
Message-Id: <1098a2f12682e83a1445259f2f7d42cea0742370.1320709417.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1320709417.git.josh@linux.intel.com>
References: <cover.1320709417.git.josh@linux.intel.com>
In-Reply-To: <cover.1320709417.git.josh@linux.intel.com>
References: <cover.1320709417.git.josh@linux.intel.com>
Subject: [PATCH 09/12] gypsy: fix packaging
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Nov 2011 00:17:12 -0000

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-connectivity/gypsy/gypsy_0.8.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/gypsy/gypsy_0.8.bb b/meta/recipes-connectivity/gypsy/gypsy_0.8.bb
index f3d3fa7..59a34fa 100644
--- a/meta/recipes-connectivity/gypsy/gypsy_0.8.bb
+++ b/meta/recipes-connectivity/gypsy/gypsy_0.8.bb
@@ -16,11 +16,11 @@ DEPENDS = "glib-2.0 dbus bluez4 dbus-glib libxslt"
 SRC_URI = "http://gypsy.freedesktop.org/releases/gypsy-${PV}.tar.gz \
            file://fix-unused-but-set-variable-warning.patch \
           "
-PR = "r1"
+PR = "r2"
 
 inherit autotools pkgconfig
 
-FILES_${PN} += "/usr/share/dbus-1/services/"
+FILES_${PN} += "/usr/share/dbus-1/system-services/"
 
 SRC_URI[md5sum] = "32b8db24db86d2dac87b391dd255f4bf"
 SRC_URI[sha256sum] = "1986a58189614a950725c3bc7d05faa3b84695f35cb696326f340ef87fc3acaa"
-- 
1.7.7



