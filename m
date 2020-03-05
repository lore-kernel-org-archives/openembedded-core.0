Return-Path: <nhartman@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id ABEF561147
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2020 15:42:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 025Ffb5V030718
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 5 Mar 2020 07:41:47 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.487.0;
	Thu, 5 Mar 2020 07:41:27 -0800
Received: by ala-lpggp3.wrs.com (Postfix, from userid 21149)	id 2CC319005E8;
	Thu,  5 Mar 2020 07:41:27 -0800 (PST)
From: Nathan Hartman <hnathan918@gmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Mar 2020 07:41:19 -0800
Message-ID: <20200305154119.120789-1-hnathan918@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: Nathan Hartman <hnathan918@gmail.com>
Subject: [PATCH v2] mesa: updated to 20.0 release
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
X-List-Received-Date: Thu, 05 Mar 2020 15:42:14 -0000
Content-Type: text/plain

Updated mesa and mesa-gl recipes to 20.0 release.

The license checksum difference is due to a small change in the license
formatting. The asterisk for footnotes was changed to a '[1]'
See: https://gitlab.freedesktop.org/mesa/mesa/-/commit/199572b65b7a03ffc887783e7f0f96f95bf1f99d

glxgears runs successfully at 60 fps on a rpi4.

Signed-off-by: Nathan Hartman <hnathan918@gmail.com>
---
 .../mesa/{mesa-gl_19.3.4.bb => mesa-gl_20.0.0.bb}             | 0
 meta/recipes-graphics/mesa/mesa.inc                           | 2 +-
 meta/recipes-graphics/mesa/{mesa_19.3.4.bb => mesa_20.0.0.bb} | 4 ++--
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_19.3.4.bb => mesa-gl_20.0.0.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_19.3.4.bb => mesa_20.0.0.bb} (88%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.3.4.bb b/meta/recipes-graphics/mesa/mesa-gl_20.0.0.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_19.3.4.bb
rename to meta/recipes-graphics/mesa/mesa-gl_20.0.0.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 54d7ea8961..b7ef496fdc 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -10,7 +10,7 @@ HOMEPAGE = "http://mesa3d.org"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://docs/license.html;md5=3a4999caf82cc503ac8b9e37c235782e"
+LIC_FILES_CHKSUM = "file://docs/license.html;md5=c1843d93c460bbf778d6037ce324f9f7"
 
 PE = "2"
 
diff --git a/meta/recipes-graphics/mesa/mesa_19.3.4.bb b/meta/recipes-graphics/mesa/mesa_20.0.0.bb
similarity index 88%
rename from meta/recipes-graphics/mesa/mesa_19.3.4.bb
rename to meta/recipes-graphics/mesa/mesa_20.0.0.bb
index 5f456c2429..2ed7ca2252 100644
--- a/meta/recipes-graphics/mesa/mesa_19.3.4.bb
+++ b/meta/recipes-graphics/mesa/mesa_20.0.0.bb
@@ -9,8 +9,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            "
 
-SRC_URI[md5sum] = "09e7700d9af511384d131fb77b5802cb"
-SRC_URI[sha256sum] = "1da467e6ae2799a517e242462331eafd29ae77d9872f3a845df81f7c308e8fe4"
+SRC_URI[md5sum] = "681229d992bbd6250a5be4f308708795"
+SRC_URI[sha256sum] = "bb6db3e54b608d2536d4000b3de7dd3ae115fc114e8acbb5afff4b3bbed04b34"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.17.1


