Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6E59C7822B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 14:14:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Feb 2018 06:14:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,501,1511856000"; d="scan'208";a="30761230"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 12 Feb 2018 06:14:03 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 54B3E5802A7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 06:14:03 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Feb 2018 16:16:26 +0200
Message-Id: <1518444986-25886-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1518444986-25886-1-git-send-email-maxin.john@intel.com>
References: <1518444986-25886-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 4/4] libinput: fix upstream version check
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
X-List-Received-Date: Mon, 12 Feb 2018 14:14:02 -0000

Skip RC releases for libinput which follow the pattern: x.x.9xx

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-graphics/wayland/libinput_1.9.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/wayland/libinput_1.9.4.bb b/meta/recipes-graphics/wayland/libinput_1.9.4.bb
index 2843314..c250383 100644
--- a/meta/recipes-graphics/wayland/libinput_1.9.4.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.9.4.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
 SRC_URI[md5sum] = "8b43d07d1698fb207a0492fc67554d4f"
 SRC_URI[sha256sum] = "0bcdbd4c4e3c2a2db322fbdf2ef3284f2e6d6fb7be3af80e6d8de7783f675190"
 
+UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.[^9]\d*).tar.xz"
 inherit meson pkgconfig lib_package
 
 PACKAGECONFIG ??= ""
-- 
2.4.0


