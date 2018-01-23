Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 34B0D787B4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 14:04:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jan 2018 06:04:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,401,1511856000"; d="scan'208";a="168456066"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 23 Jan 2018 06:04:19 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 3E5705800D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 06:04:19 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jan 2018 16:05:51 +0200
Message-Id: <1516716352-32735-12-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1516716352-32735-1-git-send-email-maxin.john@intel.com>
References: <1516716352-32735-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 11/12] gtk-icon-utils-native: upgrade to version 3.22.26
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
X-List-Received-Date: Tue, 23 Jan 2018 14:04:27 -0000

3.22.17 -> 3.22.26

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...-icon-utils-native_3.22.17.bb => gtk-icon-utils-native_3.22.26.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.22.17.bb => gtk-icon-utils-native_3.22.26.bb} (94%)

diff --git a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.17.bb b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.26.bb
similarity index 94%
rename from meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.17.bb
rename to meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.26.bb
index 032d82d..140931b 100644
--- a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.17.bb
+++ b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.26.bb
@@ -10,8 +10,8 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
           file://Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch"
-SRC_URI[md5sum] = "29f85430cf7cfa8ca8d0703ba65dbe11"
-SRC_URI[sha256sum] = "a6c1fb8f229c626a3d9c0e1ce6ea138de7f64a5a6bc799d45fa286fe461c3437"
+SRC_URI[md5sum] = "eeeb8038fe0d386c7516fa46cd4fff6b"
+SRC_URI[sha256sum] = "61eef0d320e541976e2dfe445729f12b5ade53050ee9de6184235cb60cd4b967"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
                     file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
-- 
2.4.0


