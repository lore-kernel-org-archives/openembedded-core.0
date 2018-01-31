Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 14EA8700F0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 14:56:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jan 2018 06:56:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,440,1511856000"; d="scan'208";a="27746057"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 31 Jan 2018 06:56:57 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 366EA5801AC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 06:56:57 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jan 2018 16:58:56 +0200
Message-Id: <1517410738-11104-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/3] libinput: upgrade to version 1.9.4
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
X-List-Received-Date: Wed, 31 Jan 2018 14:56:57 -0000

1.8.4 -> 1.9.4

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../wayland/{libinput_1.8.4.bb => libinput_1.9.4.bb}                 | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.8.4.bb => libinput_1.9.4.bb} (85%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.8.4.bb b/meta/recipes-graphics/wayland/libinput_1.9.4.bb
similarity index 85%
rename from meta/recipes-graphics/wayland/libinput_1.8.4.bb
rename to meta/recipes-graphics/wayland/libinput_1.9.4.bb
index 8389953..2843314 100644
--- a/meta/recipes-graphics/wayland/libinput_1.8.4.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.9.4.bb
@@ -9,9 +9,8 @@ DEPENDS = "libevdev udev mtdev"
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            "
-
-SRC_URI[md5sum] = "aeeb79bfe1b1cb64c939098468d350b3"
-SRC_URI[sha256sum] = "5ad95c8db75d59f1662199df748f912b150c3294d33cd4dd592aeb1908fe9d7f"
+SRC_URI[md5sum] = "8b43d07d1698fb207a0492fc67554d4f"
+SRC_URI[sha256sum] = "0bcdbd4c4e3c2a2db322fbdf2ef3284f2e6d6fb7be3af80e6d8de7783f675190"
 
 inherit meson pkgconfig lib_package
 
-- 
2.4.0


