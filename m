Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C2F236011A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 08:35:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2018 00:35:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,534,1511856000"; d="scan'208";a="18866101"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga008.fm.intel.com with ESMTP; 19 Feb 2018 00:35:15 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id AB01A5802D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 00:35:14 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Feb 2018 10:37:14 +0200
Message-Id: <1519029438-11092-24-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
References: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 23/27] xf86-input-libinput: fix header-file installation path
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

Fix the header-file installation path (sdkdir) of xf86-input-libinput.
This was caused by the change of pkg-config provider to pkgconf.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.26.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.26.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.26.0.bb
index 54c33d7..edc9037 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.26.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.26.0.bb
@@ -9,3 +9,5 @@ SRC_URI[md5sum] = "da47ef62eab1d0e922a8fa929ff81758"
 SRC_URI[sha256sum] = "abca558fc2226f295691f1cf3412d4c0edeaa439f677ca25b5c9fab310d2387b"
 
 FILES_${PN} += "${datadir}/X11/xorg.conf.d"
+
+EXTRA_OECONF += "--with-sdkdir=${includedir}/xorg"
-- 
2.4.0


