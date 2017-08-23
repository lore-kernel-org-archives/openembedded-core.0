Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1863271D79
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 02:24:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7N2OdBi013337
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 19:24:39 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 22 Aug 2017 19:24:38 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Aug 2017 10:23:58 +0800
Message-ID: <20170823022358.13931-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] libva-utils: add opengl to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Wed, 23 Aug 2017 02:24:39 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

libva-utils depends on libva which requires opengl in
DISTRO_FEATURES.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-graphics/libva/libva-utils_1.8.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/libva/libva-utils_1.8.3.bb b/meta/recipes-graphics/libva/libva-utils_1.8.3.bb
index 9c2c0d657b..c082c18b52 100644
--- a/meta/recipes-graphics/libva/libva-utils_1.8.3.bb
+++ b/meta/recipes-graphics/libva/libva-utils_1.8.3.bb
@@ -25,6 +25,9 @@ DEPENDS = "libva"
 
 inherit autotools pkgconfig distro_features_check
 
+# depends on libva which requires opengl
+REQUIRED_DISTRO_FEATURES = "opengl"
+
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)}"
 PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 libxext libxfixes"
 PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,wayland-native wayland"
-- 
2.11.0


