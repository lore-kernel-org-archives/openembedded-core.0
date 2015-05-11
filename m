Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1920772E49
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 06:08:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4B68psf003165
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 May 2015 23:08:51 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 10 May 2015 23:08:51 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 10 May 2015 23:08:45 -0700
Message-ID: <b599315eb92f496885999b3f057031ad738f6721.1431324180.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1431324180.git.liezhi.yang@windriver.com>
References: <cover.1431324180.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 12/12] at-spi2-atk: add x11 to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Mon, 11 May 2015 06:08:50 -0000
Content-Type: text/plain

It can't be built withou x11 in DISTRO_FEATURES.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/atk/at-spi2-atk_2.16.0.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/atk/at-spi2-atk_2.16.0.bb b/meta/recipes-support/atk/at-spi2-atk_2.16.0.bb
index d8379c1..7d95fdb 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.16.0.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.16.0.bb
@@ -10,7 +10,10 @@ SRC_URI[sha256sum] = "78efc45ec36383bf785f8636e64a8d866defeb020e00a08f92978f1fc3
 
 DEPENDS = "dbus glib-2.0 atk at-spi2-core"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
+
+# The at-spi2-core requires x11 in DISTRO_FEATURES
+REQUIRED_DISTRO_FEATURES = "x11"
 
 PACKAGES =+ "${PN}-gnome ${PN}-gtk2"
 
-- 
1.7.9.5


