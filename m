Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3B6716B7C3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 10:05:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7GA5d6e015883
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 16 Aug 2013 03:05:39 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Fri, 16 Aug 2013 03:05:37 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Fri, 16 Aug 2013 18:05:30 +0800
Message-ID: <b861e570e04aa288f05c344b161815b0dec8e788.1376647416.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1376647416.git.kai.kang@windriver.com>
References: <cover.1376647416.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Cc: Zhangle.Yang@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] qemu: update dependency of native package
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
X-List-Received-Date: Fri, 16 Aug 2013 10:05:37 -0000
Content-Type: text/plain

[YOCTO #4973]

It fails to start qemu with core-image-sato on Fedora 19. The error
message shows:

Could not initialize SDL(No available video device) - exiting

Add dependecy libxext-native to qemu-native to fix this error.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 97e9b7b..a96e00c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "open source processor emulator"
 HOMEPAGE = "http://qemu.org"
 LICENSE = "GPLv2 & LGPLv2.1"
 DEPENDS = "glib-2.0 zlib alsa-lib virtual/libx11 pixman dtc libsdl"
-DEPENDS_class-native = "zlib-native alsa-lib-native glib-2.0-native pixman-native dtc-native"
+DEPENDS_class-native = "zlib-native alsa-lib-native glib-2.0-native pixman-native dtc-native libxext-native"
 DEPENDS_class-nativesdk = "nativesdk-zlib nativesdk-libsdl nativesdk-glib-2.0 nativesdk-pixman nativesdk-dtc"
 RDEPENDS_${PN}_class-nativesdk = "nativesdk-libsdl"
 
-- 
1.8.1.2


