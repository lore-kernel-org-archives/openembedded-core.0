Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0A8C7748BF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 11:54:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Apr 2018 04:54:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,427,1517904000"; d="scan'208";a="218897620"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 09 Apr 2018 04:54:50 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 8F6C9580425
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 04:54:49 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Apr 2018 14:55:08 +0300
Message-Id: <1523274911-20401-6-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1523274911-20401-1-git-send-email-maxin.john@intel.com>
References: <1523274911-20401-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 5/8] gtk+3: upgrade to version 3.22.29
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
X-List-Received-Date: Mon, 09 Apr 2018 11:54:49 -0000

* Wayland
 - add an input method based on the text protocol

* File chooser
 - Stop activating without double-click

* Bugs fixed:
  710888 GtkInfoBar not shown after calling gtk_widget_show
  743975 Better deprecation information for GtkStatusIcon
  775546 gdkscreen-x11: Don't try to calculate a refresh rate for RandR 1.3
  794008 GtkListBoxRow signal poorly documented

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-gnome/gtk+/{gtk+3_3.22.28.bb => gtk+3_3.22.29.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.22.28.bb => gtk+3_3.22.29.bb} (83%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.22.28.bb b/meta/recipes-gnome/gtk+/gtk+3_3.22.29.bb
similarity index 83%
rename from meta/recipes-gnome/gtk+/gtk+3_3.22.28.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.22.29.bb
index 864e826..c3c786b 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.22.28.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.22.29.bb
@@ -7,8 +7,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0002-Do-not-try-to-initialize-GL-without-libGL.patch \
            file://0003-Add-disable-opengl-configure-option.patch \
           "
-SRC_URI[md5sum] = "8c1f5ab987ddc7dab3e59660f89dcd9b"
-SRC_URI[sha256sum] = "d299612b018cfed7b2c689168ab52b668023708e17c335eb592260d186f15e1f"
+SRC_URI[md5sum] = "229a39f7d9ada53398baa39652630f2e"
+SRC_URI[sha256sum] = "a07d64b939fcc034a066b7723fdf9b24e92c9cfb6a8497593f3471fe56fbbbf8"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.4.0


