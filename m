Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAigZ-0005Ww-Nq
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 15:35:59 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so5356887bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ewr82uxfcHYyxRyiiXNYo42qUBZb0KY2HGKEW50o+4w=;
	b=lWyclFlalcb4RYYv+aSpzUX7Qr17miiGPfCoc/jvjTYfQriL2VlvpkQrsQ5B/ALxL2
	675li/7ZsOch1SJBQ9hllbUon4Gchfzj5U09guLjQcRcV8dAqYn3je7f26+Zuh5y/tKk
	60Gmp/QlURl7hTXYL1xosQ6ufyF+13wzHsdFk=
Received: by 10.204.150.70 with SMTP id x6mr9650162bkv.110.1317648629465;
	Mon, 03 Oct 2011 06:30:29 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z7sm13233109bkt.5.2011.10.03.06.30.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:30:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:28:42 +0200
Message-Id: <746c06d9f47e3e8764b5b6208edcd08e21119646.1317648041.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648040.git.Martin.Jansa@gmail.com>
References: <cover.1317648040.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 11/30] xserver-xf86: remove old 1.10.1 version
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
X-List-Received-Date: Mon, 03 Oct 2011 13:35:59 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb   |   20 --------------------
 .../xorg-xserver/xserver-xf86-lite_1.10.1.bb       |   12 ------------
 2 files changed, 0 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb
deleted file mode 100644
index 035e39c..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require xserver-xf86-dri-lite.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
-
-PROTO_DEPS += "xf86driproto dri2proto"
-
-DEPENDS += "font-util"
-
-PE = "1"
-PR = "r1"
-
-SRC_URI += "file://crosscompile.patch"
-
-# Misc build failure for master HEAD
-SRC_URI += "file://fix_open_max_preprocessor_error.patch"
-
-SRC_URI[md5sum] = "75f117c74f2ecaf9dd167f6a66ac98de"
-SRC_URI[sha256sum] = "143c7c3d7d4428352e1153dffa34fd64af391f72d30b2a03e911e54e36f00b5d"
-
-EXTRA_OECONF += "--enable-dri --enable-dri2"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb
deleted file mode 100644
index 5575c0f..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require xserver-xf86-lite.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
-
-PR = "r1"
-
-DEPENDS += "font-util"
-
-SRC_URI += "file://crosscompile.patch"
-
-# Misc build failure for master HEAD
-SRC_URI += "file://fix_open_max_preprocessor_error.patch;"
-- 
1.7.7



