Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 763746FF22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 03:26:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5T3QJBC004515
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Jun 2016 20:26:19 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 28 Jun 2016 20:26:18 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Jun 2016 23:26:13 -0400
Message-ID: <262e8e169a2d0903a61a79decd1a4ffd8b3cb2a8.1467170719.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1467170719.git.hongxu.jia@windriver.com>
References: <cover.1467170719.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] l3afpad: Use distro_features_check for gtk+3
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
X-List-Received-Date: Wed, 29 Jun 2016 03:26:20 -0000
Content-Type: text/plain

Since l3afpad depends gtk+3, use distro_features_check to fix
bitbake world dependency problems while DISTRO_FEATURES_remove = "x11"

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-sato/l3afpad/l3afpad_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-sato/l3afpad/l3afpad_git.bb b/meta/recipes-sato/l3afpad/l3afpad_git.bb
index 1e7c82f..8f8a7ec 100644
--- a/meta/recipes-sato/l3afpad/l3afpad_git.bb
+++ b/meta/recipes-sato/l3afpad/l3afpad_git.bb
@@ -9,6 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://src/l3afpad.h;endline=20;md5=8848fd645cd45115d8cb47ca5c42a50e \
                     file://src/utils.c;endline=20;md5=ae4792f69d3bb7b7ba91d582ba9b1a05"
 
+inherit distro_features_check
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+
 DEPENDS = "gtk+3 intltool-native gettext-native"
 
 PV = "0.8.18.1.11+git${SRCPV}"
-- 
2.8.1


