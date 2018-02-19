Return-Path: <maxin.john@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id E00D8606A8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 08:35:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2018 00:35:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,534,1511856000"; d="scan'208";a="21241534"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 19 Feb 2018 00:35:14 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 9619458030D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 00:35:13 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Feb 2018 10:37:13 +0200
Message-Id: <1519029438-11092-23-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
References: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 22/27] xf86-input-mouse: fix header-file installation path
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
X-List-Received-Date: Mon, 19 Feb 2018 08:35:13 -0000

Fix the header-file installation paths of xf86-input-mouse.
This was caused by the change of pkg-config provider to pkgconf.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.2.bb b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.2.bb
index 0750476..2945eb0 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.2.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.2.bb
@@ -12,3 +12,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=90ea9f90d72b6d9327dede5ffdb2a510"
 
 SRC_URI[md5sum] = "ce2d679283a22c8e0dccdd9248594845"
 SRC_URI[sha256sum] = "f425d5b05c6ab412a27e0a1106bb83f9e2662b307210abbe48270892387f4b2f"
+
+EXTRA_OECONF += "--with-sdkdir=${includedir}/xorg"
-- 
2.4.0


