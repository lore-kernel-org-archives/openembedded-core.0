Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3968B785DC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 12:00:17 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Nov 2017 04:00:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,374,1505804400"; d="scan'208";a="1242466385"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 10 Nov 2017 04:00:18 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id AC70F5801AD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 04:00:17 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Nov 2017 14:00:26 +0200
Message-Id: <1510315228-24186-6-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1510315228-24186-1-git-send-email-maxin.john@intel.com>
References: <1510315228-24186-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 5/7] libproxy: upgrade to 0.4.15
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
X-List-Received-Date: Fri, 10 Nov 2017 12:00:17 -0000

0.4.14 -> 0.4.15

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../libproxy/{libproxy_0.4.14.bb => libproxy_0.4.15.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libproxy/{libproxy_0.4.14.bb => libproxy_0.4.15.bb} (89%)

diff --git a/meta/recipes-support/libproxy/libproxy_0.4.14.bb b/meta/recipes-support/libproxy/libproxy_0.4.15.bb
similarity index 89%
rename from meta/recipes-support/libproxy/libproxy_0.4.14.bb
rename to meta/recipes-support/libproxy/libproxy_0.4.15.bb
index 4c39f52..9a687df 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.14.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.15.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "glib-2.0"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz"
-SRC_URI[md5sum] = "e7514f78f5432210e17a01b6b618dde2"
-SRC_URI[sha256sum] = "e25d046850346a505c0617646f1e68b660092efadf665548a89c280900262ea6"
+SRC_URI[md5sum] = "f6b1d2a1e17a99cd3debaae6d04ab152"
+SRC_URI[sha256sum] = "654db464120c9534654590b6683c7fa3887b3dad0ca1c4cd412af24fbfca6d4f"
 
 UPSTREAM_CHECK_URI = "https://github.com/libproxy/libproxy/releases"
 UPSTREAM_CHECK_REGEX = "libproxy-(?P<pver>.*)\.tar"
-- 
2.4.0


