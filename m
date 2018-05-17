Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 3507F7488C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 11:46:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 May 2018 04:46:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,410,1520924400"; d="scan'208";a="229395414"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 17 May 2018 04:46:14 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 May 2018 14:38:36 +0300
Message-Id: <20180517113837.24240-9-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180517113837.24240-1-alexander.kanavin@linux.intel.com>
References: <20180517113837.24240-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 09/10] meson: update to 0.46.1
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
X-List-Received-Date: Thu, 17 May 2018 11:46:14 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../meson/{meson_0.46.0.bb => meson_0.46.1.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/meson/{meson_0.46.0.bb => meson_0.46.1.bb} (83%)

diff --git a/meta/recipes-devtools/meson/meson_0.46.0.bb b/meta/recipes-devtools/meson/meson_0.46.1.bb
similarity index 83%
rename from meta/recipes-devtools/meson/meson_0.46.0.bb
rename to meta/recipes-devtools/meson/meson_0.46.1.bb
index 7334045e05f..a18cab81f4a 100644
--- a/meta/recipes-devtools/meson/meson_0.46.0.bb
+++ b/meta/recipes-devtools/meson/meson_0.46.1.bb
@@ -10,8 +10,8 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/${BP}.tar
            file://0001-Linker-rules-move-cross_args-in-front-of-output_args.patch \
            file://0003-native_bindir.patch \
            "
-SRC_URI[md5sum] = "e3301606017e364a0d7e1c3b755e7a28"
-SRC_URI[sha256sum] = "b7df91b01a358a8facdbfa33596a47cda38a760435ab55e1985c0bff06a9cbf0"
+SRC_URI[md5sum] = "1698f6526574839de5dcdc45e3f7d582"
+SRC_URI[sha256sum] = "19497a03e7e5b303d8d11f98789a79aba59b5ad4a81bd00f4d099be0212cee78"
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
 
 inherit setuptools3
-- 
2.17.0


