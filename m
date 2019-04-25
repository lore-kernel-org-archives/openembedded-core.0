Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C2EDD7D691
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 06:03:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3P63ZCH031629
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 23:03:45 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Wed, 24 Apr 2019 23:03:24 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Apr 2019 14:14:03 +0800
Message-ID: <d3f918db8a372e564d29044d274deb74f3afec26.1556172784.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1556172784.git.Qi.Chen@windriver.com>
References: <cover.1556172784.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] webkitgtk: set CVE_PRODUCT
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
X-List-Received-Date: Thu, 25 Apr 2019 06:03:54 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.24.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.24.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.24.0.bb
index 4a82dae..58c06dc 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.24.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.24.0.bb
@@ -29,6 +29,8 @@ inherit cmake pkgconfig gobject-introspection perlnative distro_features_check u
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
+CVE_PRODUCT = "webkitgtk webkitgtk\+"
+
 DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn libgcrypt \
            gtk+3 gstreamer1.0 gstreamer1.0-plugins-base flex-native gperf-native sqlite3 \
 	   pango icu bison-native gawk intltool-native libwebp \
-- 
1.9.1


