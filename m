Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 14841748BF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 11:54:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Apr 2018 04:54:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,427,1517904000"; d="scan'208";a="215142461"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 09 Apr 2018 04:54:53 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id BFA375803B6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 04:54:52 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Apr 2018 14:55:11 +0300
Message-Id: <1523274911-20401-9-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1523274911-20401-1-git-send-email-maxin.john@intel.com>
References: <1523274911-20401-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 8/8] gtk-icon-utils-native: upgrade to version 3.22.29
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
X-List-Received-Date: Mon, 09 Apr 2018 11:54:52 -0000

3.22.28 -> 3.22.29

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...-icon-utils-native_3.22.28.bb => gtk-icon-utils-native_3.22.29.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.22.28.bb => gtk-icon-utils-native_3.22.29.bb} (94%)

diff --git a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.28.bb b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.29.bb
similarity index 94%
rename from meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.28.bb
rename to meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.29.bb
index 942c047..eb35bcc 100644
--- a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.28.bb
+++ b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.29.bb
@@ -10,8 +10,8 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
           file://Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch"
-SRC_URI[md5sum] = "8c1f5ab987ddc7dab3e59660f89dcd9b"
-SRC_URI[sha256sum] = "d299612b018cfed7b2c689168ab52b668023708e17c335eb592260d186f15e1f"
+SRC_URI[md5sum] = "229a39f7d9ada53398baa39652630f2e"
+SRC_URI[sha256sum] = "a07d64b939fcc034a066b7723fdf9b24e92c9cfb6a8497593f3471fe56fbbbf8"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
                     file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
-- 
2.4.0


