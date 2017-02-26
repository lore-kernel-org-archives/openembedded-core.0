Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 71909730A3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2017 16:50:59 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Feb 2017 08:51:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,209,1484035200"; d="scan'208";a="938297108"
Received: from dgpeters-mobl5.ger.corp.intel.com (HELO
	heimdall.ger.corp.intel.com) ([10.252.1.186])
	by orsmga003.jf.intel.com with ESMTP; 26 Feb 2017 08:50:59 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Feb 2017 18:50:52 +0200
Message-Id: <3521a77ad3774e178723f7bd767e29c4317d9cc8.1488125460.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1488125460.git.jussi.kukkonen@intel.com>
References: <cover.1488125460.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/6] wayland: Upgrade 1.12.0 -> 1.13.0
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
X-List-Received-Date: Sun, 26 Feb 2017 16:51:00 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../recipes-graphics/wayland/{wayland_1.12.0.bb => wayland_1.13.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland_1.12.0.bb => wayland_1.13.0.bb} (92%)

diff --git a/meta/recipes-graphics/wayland/wayland_1.12.0.bb b/meta/recipes-graphics/wayland/wayland_1.13.0.bb
similarity index 92%
rename from meta/recipes-graphics/wayland/wayland_1.12.0.bb
rename to meta/recipes-graphics/wayland/wayland_1.13.0.bb
index 026227a533c..b9396b6c75a 100644
--- a/meta/recipes-graphics/wayland/wayland_1.12.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.13.0.bb
@@ -14,8 +14,8 @@ DEPENDS = "expat libxml2 libffi wayland-native"
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[md5sum] = "ee615e2d1e205eec48b02f069327eb96"
-SRC_URI[sha256sum] = "d6b4135cba0188abcb7275513c72dede751d6194f6edc5b82183a3ba8b821ab1"
+SRC_URI[md5sum] = "cae152ed956da6de53f9727bc1c45039"
+SRC_URI[sha256sum] = "69b052c031a61e89af7cc8780893d0da1e301492352aa449dee9345043e6fe51"
 
 inherit autotools pkgconfig
 
-- 
2.11.0


