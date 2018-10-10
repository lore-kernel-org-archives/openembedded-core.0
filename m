Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C79B27547F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 03:09:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9A395BQ013770
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Oct 2018 20:09:05 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 9 Oct 2018 20:09:04 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<raj.khem@gmail.com>, <alex.kanavin@gmail.com>
Date: Tue, 9 Oct 2018 20:09:04 -0700
Message-ID: <20181010030904.20641-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <CAMKF1spfZM_hxKfRYtVPeT-8FZa3RUUOxSkd-Rmb9cajMrS0iQ@mail.gmail.com>
References: <CAMKF1spfZM_hxKfRYtVPeT-8FZa3RUUOxSkd-Rmb9cajMrS0iQ@mail.gmail.com>
MIME-Version: 1.0
Subject: [PATCH V2] webkitgtk: add opengl to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Wed, 10 Oct 2018 03:09:05 -0000
Content-Type: text/plain

They can't be built without opengl in DISTRO_FEATURES.
[snip]
|webkitgtk-2.20.3/Source/WebCore/platform/graphics/OpenGLShims.h:23:10:
fatal error: GL/gl.h: No such file or directory
[snip]

Some sort of GL is needed yes. We indicate that with opengl losely in OE

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.20.5.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.20.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.20.5.bb
index c8d4f94..7f1ffce 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.20.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.20.5.bb
@@ -30,8 +30,7 @@ SRC_URI[sha256sum] = "15c0f8d26e9605afe0948d161ba5fd82efee8eda2debd409fd40a440ac
 
 inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
 
-# depends on libxt
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn libgcrypt \
            gtk+3 gstreamer1.0 gstreamer1.0-plugins-base flex-native gperf-native sqlite3 \
-- 
2.10.2


