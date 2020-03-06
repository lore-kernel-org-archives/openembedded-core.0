Return-Path: <nhartman@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A4EB661178
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2020 20:19:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 026KJcCN013818
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 6 Mar 2020 12:19:38 -0800 (PST)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.487.0;
	Fri, 6 Mar 2020 12:19:38 -0800
Received: by ala-lpggp3.wrs.com (Postfix, from userid 21149)	id 389D3901021;
	Fri,  6 Mar 2020 12:19:38 -0800 (PST)
From: Nathan Hartman <hnathan918@gmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Mar 2020 12:19:36 -0800
Message-ID: <20200306201936.62066-1-hnathan918@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: Nathan Hartman <hnathan918@gmail.com>
Subject: [PATCH] mesa: updated to mesa 20.0.1 release
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
X-List-Received-Date: Fri, 06 Mar 2020 20:19:39 -0000
Content-Type: text/plain

Updated to 20.0.1 release: https://www.mesa3d.org/relnotes/20.0.1.html

Signed-off-by: Nathan Hartman <hnathan918@gmail.com>
---
 .../mesa/{mesa-gl_20.0.0.bb => mesa-gl_20.0.1.bb}             | 0
 meta/recipes-graphics/mesa/{mesa_20.0.0.bb => mesa_20.0.1.bb} | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_20.0.0.bb => mesa-gl_20.0.1.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_20.0.0.bb => mesa_20.0.1.bb} (88%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_20.0.0.bb b/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_20.0.0.bb
rename to meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb
diff --git a/meta/recipes-graphics/mesa/mesa_20.0.0.bb b/meta/recipes-graphics/mesa/mesa_20.0.1.bb
similarity index 88%
rename from meta/recipes-graphics/mesa/mesa_20.0.0.bb
rename to meta/recipes-graphics/mesa/mesa_20.0.1.bb
index 2ed7ca2252..e18c00b051 100644
--- a/meta/recipes-graphics/mesa/mesa_20.0.0.bb
+++ b/meta/recipes-graphics/mesa/mesa_20.0.1.bb
@@ -9,8 +9,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            "
 
-SRC_URI[md5sum] = "681229d992bbd6250a5be4f308708795"
-SRC_URI[sha256sum] = "bb6db3e54b608d2536d4000b3de7dd3ae115fc114e8acbb5afff4b3bbed04b34"
+SRC_URI[md5sum] = "428ac511e4b05647a00b3778f1279da7"
+SRC_URI[sha256sum] = "6153ba3f8cb0524bbfc08e4db76b408126b2d1be8f789dffe28d1a0461eedde4"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.17.1


