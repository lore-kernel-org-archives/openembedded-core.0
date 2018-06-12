Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id D0E8260603
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 11:25:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jun 2018 04:25:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,214,1526367600"; d="scan'208";a="49237748"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga006.jf.intel.com with ESMTP; 12 Jun 2018 04:25:57 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 34D5C580116
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 04:25:56 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2018 14:18:09 +0300
Message-Id: <1528802295-11278-6-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1528802295-11278-1-git-send-email-maxin.john@intel.com>
References: <1528802295-11278-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 06/12] gtk+3: upgrade to 3.22.30
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
X-List-Received-Date: Tue, 12 Jun 2018 11:25:57 -0000

3.22.29 -> 3.22.30

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-gnome/gtk+/{gtk+3_3.22.29.bb => gtk+3_3.22.30.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.22.29.bb => gtk+3_3.22.30.bb} (83%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.22.29.bb b/meta/recipes-gnome/gtk+/gtk+3_3.22.30.bb
similarity index 83%
rename from meta/recipes-gnome/gtk+/gtk+3_3.22.29.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.22.30.bb
index c3c786b..697b518 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.22.29.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.22.30.bb
@@ -7,8 +7,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0002-Do-not-try-to-initialize-GL-without-libGL.patch \
            file://0003-Add-disable-opengl-configure-option.patch \
           "
-SRC_URI[md5sum] = "229a39f7d9ada53398baa39652630f2e"
-SRC_URI[sha256sum] = "a07d64b939fcc034a066b7723fdf9b24e92c9cfb6a8497593f3471fe56fbbbf8"
+SRC_URI[md5sum] = "61e60dc073e0a6893c72043d20579dc0"
+SRC_URI[sha256sum] = "a1a4a5c12703d4e1ccda28333b87ff462741dc365131fbc94c218ae81d9a6567"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.4.0


