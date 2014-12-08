Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id A245D72497
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Dec 2014 11:17:28 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1XxwJl-0000OG-Dn from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Dec 2014 03:17:29 -0800
Received: from awais-Precision-M4700.mgc.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.181.6; Mon, 8 Dec 2014 11:17:27 +0000
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Dec 2014 16:17:22 +0500
Message-ID: <1418037442-4369-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] libxcb, xcbproto: upgrade to version 1.11
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
X-List-Received-Date: Mon, 08 Dec 2014 11:17:37 -0000
Content-Type: text/plain

Update libxcb and xcb-proto to 1.11 from 1.10.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 .../xorg-lib/{libxcb_1.10.bb => libxcb_1.11.bb}    |    5 +++--
 .../{xcb-proto_1.10.bb => xcb-proto_1.11.bb}       |    4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxcb_1.10.bb => libxcb_1.11.bb} (48%)
 rename meta/recipes-graphics/xorg-proto/{xcb-proto_1.10.bb => xcb-proto_1.11.bb} (60%)

diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.10.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.11.bb
similarity index 48%
rename from meta/recipes-graphics/xorg-lib/libxcb_1.10.bb
rename to meta/recipes-graphics/xorg-lib/libxcb_1.11.bb
index d88b025..d533c7d 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.10.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.11.bb
@@ -6,5 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7"
 
 DEPENDS += "libxdmcp"
 
-SRC_URI[md5sum] = "074c335cc4453467eeb234e3dadda700"
-SRC_URI[sha256sum] = "98d9ab05b636dd088603b64229dd1ab2d2cc02ab807892e107d674f9c3f2d5b5"
+SRC_URI[md5sum] = "5a873ebd383d1a60612dd6ec6b42c781"
+SRC_URI[sha256sum] = "03635d70045b9ede90778e67516135828a57de87ac508f987024f43c03620ff7"
+
diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.10.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.11.bb
similarity index 60%
rename from meta/recipes-graphics/xorg-proto/xcb-proto_1.10.bb
rename to meta/recipes-graphics/xorg-proto/xcb-proto_1.11.bb
index 0b67b57..5bc5a11 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.10.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.11.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7 \
                     file://src/dri2.xml;beginline=2;endline=28;md5=f8763b13ff432e8597e0d610cf598e65"
 
 
-SRC_URI[md5sum] = "ade74b8e9c870dc7515adfa209e66063"
-SRC_URI[sha256sum] = "7ef40ddd855b750bc597d2a435da21e55e502a0fefa85b274f2c922800baaf05"
+SRC_URI[md5sum] = "6bf2797445dc6d43e9e4707c082eff9c"
+SRC_URI[sha256sum] = "b4aceee6502a0ce45fc39b33c541a2df4715d00b72e660ebe8c5bb444771e32e"
-- 
1.7.9.5


