Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 560D77D7A2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 05:17:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x3T5H7Ti026054
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Apr 2019 22:17:07 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Sun, 28 Apr 2019 22:17:06 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Apr 2019 13:27:32 +0800
Message-ID: <23e19cccff4e1fc1e2d52cbb8273449711ca1bd6.1556515629.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1556515629.git.Qi.Chen@windriver.com>
References: <cover.1556515629.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libsdl: set CVE_PRODUCT
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
X-List-Received-Date: Mon, 29 Apr 2019 05:17:07 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb  | 2 ++
 meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index 3680ea9..7718d11 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -31,6 +31,8 @@ BINCONFIG = "${bindir}/sdl-config"
 
 inherit autotools lib_package binconfig-disabled pkgconfig
 
+CVE_PRODUCT = "simple_directmedia_layer sdl"
+
 EXTRA_OECONF = "--disable-static --enable-cdrom --enable-threads --enable-timers \
                 --enable-file --disable-oss --disable-esd --disable-arts \
                 --disable-diskaudio --disable-nas \
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb
index c741cfb..bac91d3 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb
@@ -23,6 +23,8 @@ SRC_URI[sha256sum] = "255186dc676ecd0c1dbf10ec8a2cc5d6869b5079d8a38194c2aecdff54
 
 inherit autotools lib_package binconfig pkgconfig
 
+CVE_PRODUCT = "simple_directmedia_layer sdl"
+
 EXTRA_OECONF = "--disable-oss --disable-esd --disable-arts \
                 --disable-diskaudio --disable-nas --disable-esd-shared --disable-esdtest \
                 --disable-video-dummy \
-- 
1.9.1


