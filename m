Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7C42D6060F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 08:35:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2018 00:35:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,534,1511856000"; d="scan'208";a="29064669"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 19 Feb 2018 00:35:13 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 812625802D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 00:35:12 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Feb 2018 10:37:12 +0200
Message-Id: <1519029438-11092-22-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
References: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 21/27] xf86-input-synaptics: fix installation paths
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
X-List-Received-Date: Mon, 19 Feb 2018 08:35:11 -0000

Fix the installations paths of xf86-input-synaptics.
This was caused by the change of pkg-config provider to pkgconf.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.0.bb
index d327a3b..35dbe50 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.0.bb
@@ -14,3 +14,5 @@ SRC_URI[md5sum] = "58e5b7722a402114093bf193962d1e3a"
 SRC_URI[sha256sum] = "afba3289d7a40217a19d90db98ce181772f9ca6d77e1898727b0afcf02073b5a"
 
 DEPENDS += "libxi mtdev libxtst libevdev"
+
+EXTRA_OECONF += "--with-sdkdir=${includedir}/xorg --with-xorg-conf-dir=${datadir}/X11/xorg.conf.d"
-- 
2.4.0


