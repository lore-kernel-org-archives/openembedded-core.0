Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BB6B06011A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 08:35:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2018 00:35:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,534,1511856000"; d="scan'208";a="29064680"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 19 Feb 2018 00:35:16 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id C019758030D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 00:35:15 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Feb 2018 10:37:15 +0200
Message-Id: <1519029438-11092-25-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
References: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 24/27] xf86-input-evdev: fix header-file installation path
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
X-List-Received-Date: Mon, 19 Feb 2018 08:35:15 -0000

Fix the header-file installation path (sdkdir) of xf86-input-evdev.
This was caused by the change of pkg-config provider to pkgconf.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.5.bb b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.5.bb
index 96b220c..eaa7507 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.5.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.5.bb
@@ -19,3 +19,4 @@ DEPENDS += "mtdev libevdev"
 SRC_URI[md5sum] = "94c2c8354c74ab1cfbbb0a222078b9c6"
 SRC_URI[sha256sum] = "9edaa6205baf6d2922cc4db3d8e54a7e7773b5f733b0ae90f6be7725f983b70d"
 
+EXTRA_OECONF += "--with-sdkdir=${includedir}/xorg"
-- 
2.4.0


