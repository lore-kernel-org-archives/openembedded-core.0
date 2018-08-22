Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A574279153
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 10:25:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Aug 2018 03:25:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,273,1531810800"; d="scan'208";a="83936488"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 22 Aug 2018 03:25:35 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 341DB5802C8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 03:25:35 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 13:27:25 +0300
Message-Id: <1534933645-30369-7-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1534933645-30369-1-git-send-email-maxin.john@intel.com>
References: <1534933645-30369-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 6/6] libinput: upgrade 1.11.2 -> 1.11.3
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
X-List-Received-Date: Wed, 22 Aug 2018 10:25:34 -0000

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../wayland/{libinput_1.11.2.bb => libinput_1.11.3.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.11.2.bb => libinput_1.11.3.bb} (86%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.11.2.bb b/meta/recipes-graphics/wayland/libinput_1.11.3.bb
similarity index 86%
rename from meta/recipes-graphics/wayland/libinput_1.11.2.bb
rename to meta/recipes-graphics/wayland/libinput_1.11.3.bb
index c1800a5..12e2091 100644
--- a/meta/recipes-graphics/wayland/libinput_1.11.2.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.11.3.bb
@@ -9,8 +9,8 @@ DEPENDS = "libevdev udev mtdev"
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            "
-SRC_URI[md5sum] = "d179b5afbf414b34ce36ffe6ea8a401d"
-SRC_URI[sha256sum] = "6b36e1163d306c292ec8359b35aa65431cd29d0a5254923775e8019ff5018107"
+SRC_URI[md5sum] = "df6e877f11de4a9793511e9abfe7ef01"
+SRC_URI[sha256sum] = "f31191d96e425b4f16319842279d65946d9d983dcd3d9e466ae1206aa10ecb06"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 inherit meson pkgconfig lib_package
-- 
2.4.0


