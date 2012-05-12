Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1STB4j-0008GD-2j
	for openembedded-core@lists.openembedded.org;
	Sat, 12 May 2012 14:05:29 +0200
Received: by wgbdr1 with SMTP id dr1so2996377wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 May 2012 04:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=VNKk6SU+4Oj9o0odSUPUqTQ8EDAo98MhRi3tK5/jAOI=;
	b=KhIy+Bxg+MM1p51F81jvVSQFZ3RjEve1HiWtGlhtmdh59sexf47UNHr08ujM6AxZQf
	3Xr286B0DQobtfpb26nWg8Xv/GtM83RC0AOSvPxvdFj08GvDqWJY92r3Z5XnxHFznGLD
	IOwUkxptlp8KiXwMiK9iOkMSqZFa70J36J/XszLBWFgCIJ29w9lxuLpjDPD2VFKDSKn2
	kiBx1UVyuxqQJrKl0/zBxRTd/gTSKGbKJ01fnoko1GzZdxkQmGPvbHqwhEmYdiXo5y7U
	N9Q4DDVQc1Aiwcuopvpc+c7v0z3BT+wOjlr1G8o6Q/unrBKYlSvuCVUEy1vO3RmT9o8N
	tskA==
Received: by 10.216.134.27 with SMTP id r27mr991671wei.107.1336823732964;
	Sat, 12 May 2012 04:55:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l5sm18283080wia.11.2012.05.12.04.55.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 May 2012 04:55:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 May 2012 13:55:29 +0200
Message-Id: <1336823729-14191-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1336823299-13967-1-git-send-email-Martin.Jansa@gmail.com>
References: <1336823299-13967-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv2] xserver-xorg-lite: disable xmlto like full xserver-xorg does
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 12 May 2012 12:05:29 -0000

* xmlto-native is unusable (see YOCTO #2416)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-xserver/xserver-xorg-1.11.2.inc           |    2 +-
 .../xorg-xserver/xserver-xorg-lite.inc             |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
index 6a86af4..fc41568 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
@@ -7,5 +7,5 @@ SRC_URI += "file://crosscompile.patch \
 SRC_URI[md5sum] = "8796fff441e5435ee36a72579008af24"
 SRC_URI[sha256sum] = "fa415decf02027ca278b06254ccfbcceba2a83c2741405257ebf749da4a73cf2"
 
-PR = "r2"
+PR = "r3"
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
index 57615f5..02db5bf 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
@@ -4,4 +4,5 @@ EXTRA_OECONF += "\
                  --disable-dri \
                  --disable-glx \
                  --disable-dga \
+                 --without-xmlto \
 "
-- 
1.7.8.6



