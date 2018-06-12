Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 9537378D7F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 11:25:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jun 2018 04:25:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,214,1526367600"; d="scan'208";a="207381397"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 12 Jun 2018 04:25:53 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id D072C5800AF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 04:25:52 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2018 14:18:05 +0300
Message-Id: <1528802295-11278-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1528802295-11278-1-git-send-email-maxin.john@intel.com>
References: <1528802295-11278-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 02/12] libinput: upgrade to 1.11.0
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
X-List-Received-Date: Tue, 12 Jun 2018 11:25:52 -0000

1.9.4 -> 1.11.0

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../wayland/{libinput_1.9.4.bb => libinput_1.11.0.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.9.4.bb => libinput_1.11.0.bb} (86%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.9.4.bb b/meta/recipes-graphics/wayland/libinput_1.11.0.bb
similarity index 86%
rename from meta/recipes-graphics/wayland/libinput_1.9.4.bb
rename to meta/recipes-graphics/wayland/libinput_1.11.0.bb
index 67a49df..97264ca 100644
--- a/meta/recipes-graphics/wayland/libinput_1.9.4.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.11.0.bb
@@ -9,8 +9,8 @@ DEPENDS = "libevdev udev mtdev"
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            "
-SRC_URI[md5sum] = "8b43d07d1698fb207a0492fc67554d4f"
-SRC_URI[sha256sum] = "0bcdbd4c4e3c2a2db322fbdf2ef3284f2e6d6fb7be3af80e6d8de7783f675190"
+SRC_URI[md5sum] = "a182dab52f4d33bc1ef50668dcf53cc6"
+SRC_URI[sha256sum] = "64a36c4f826f4b5d473bf2cb803122f96390a18243ec810f2ce8ac5076a0bc12"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 inherit meson pkgconfig lib_package
-- 
2.4.0


