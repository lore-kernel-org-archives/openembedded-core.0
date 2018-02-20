Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id EC615786C9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 15:41:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2018 07:41:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,539,1511856000"; d="scan'208";a="31430832"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 20 Feb 2018 07:41:24 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 62C7B5802E2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 07:41:23 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Feb 2018 17:44:02 +0200
Message-Id: <1519141444-25953-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1519141444-25953-1-git-send-email-maxin.john@intel.com>
References: <1519141444-25953-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/4] gtk+3: upgrade to version 3.22.28
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
X-List-Received-Date: Tue, 20 Feb 2018 15:41:23 -0000

3.22.26 -> 3.22.28

Bug-fix release

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-gnome/gtk+/{gtk+3_3.22.26.bb => gtk+3_3.22.28.bb}        | 4 ++--
 ...-icon-utils-native_3.22.26.bb => gtk-icon-utils-native_3.22.28.bb} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.22.26.bb => gtk+3_3.22.28.bb} (83%)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.22.26.bb => gtk-icon-utils-native_3.22.28.bb} (100%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.22.26.bb b/meta/recipes-gnome/gtk+/gtk+3_3.22.28.bb
similarity index 83%
rename from meta/recipes-gnome/gtk+/gtk+3_3.22.26.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.22.28.bb
index 6651ca6..864e826 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.22.26.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.22.28.bb
@@ -7,8 +7,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0002-Do-not-try-to-initialize-GL-without-libGL.patch \
            file://0003-Add-disable-opengl-configure-option.patch \
           "
-SRC_URI[md5sum] = "eeeb8038fe0d386c7516fa46cd4fff6b"
-SRC_URI[sha256sum] = "61eef0d320e541976e2dfe445729f12b5ade53050ee9de6184235cb60cd4b967"
+SRC_URI[md5sum] = "8c1f5ab987ddc7dab3e59660f89dcd9b"
+SRC_URI[sha256sum] = "d299612b018cfed7b2c689168ab52b668023708e17c335eb592260d186f15e1f"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
diff --git a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.26.bb b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.28.bb
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.26.bb
rename to meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.28.bb
-- 
2.4.0


