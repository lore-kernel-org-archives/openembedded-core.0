Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 0D87971993
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 11:51:51 +0000 (UTC)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Dec 2017 03:51:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,363,1508828400"; 
   d="scan'208";a="258859"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga008.fm.intel.com with ESMTP; 05 Dec 2017 03:51:52 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id E490F5802CA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 03:51:51 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 13:51:45 +0200
Message-Id: <1512474706-9286-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1512474706-9286-1-git-send-email-maxin.john@intel.com>
References: <1512474706-9286-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/3] orc: upgrade to 0.4.28
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
X-List-Received-Date: Tue, 05 Dec 2017 11:51:52 -0000

0.4.27 -> 0.4.28

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-devtools/orc/{orc_0.4.27.bb => orc_0.4.28.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/orc/{orc_0.4.27.bb => orc_0.4.28.bb} (84%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.27.bb b/meta/recipes-devtools/orc/orc_0.4.28.bb
similarity index 84%
rename from meta/recipes-devtools/orc/orc_0.4.27.bb
rename to meta/recipes-devtools/orc/orc_0.4.28.bb
index 303f991..415de64 100644
--- a/meta/recipes-devtools/orc/orc_0.4.27.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.28.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "5837dc20dacb5b668935bbded10cbb61"
-SRC_URI[sha256sum] = "51e53e58fc8158e5986a1f1a49a6d970c5b16493841cf7b9de2c2bde7ce36b93"
+SRC_URI[md5sum] = "6b582ec4b3275c5efd51e3ae6406d445"
+SRC_URI[sha256sum] = "bfcd7c6563b05672386c4eedfc4c0d4a0a12b4b4775b74ec6deb88fc2bcd83ce"
 
 inherit autotools pkgconfig gtk-doc
 
-- 
2.4.0


