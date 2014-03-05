Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0AAE26E75A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 19:19:40 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id e49so664349eek.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Mar 2014 11:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=R2tHGmPeJYEO2zYmaBlSxBLJaQPzkJOnhXhmlx+U40Y=;
	b=nFLrxc67SmVU2iDa1IGA7ANTb1i7fCq4It0saMgia29DEiw4UMTH0WBdaVxOWwPJ0J
	SfDn9YJBQAelHhxwjTBydZB1iLILjRMAiT1hxf0BhbKVCS2l9qa+FFH81gM4GT6+HtpZ
	E5E4zGLrP1VxTLOTdecsL9FFQpTSsK5nZxPnm+lDchWQCm2+3Jjs8NZ8dM2JpWiL3Wzw
	v8KijhwMIpEe4OSnsasTgty+c1vjsxMw6KbJKGQ0c2Iq0NNX3A4qNyOCNwEKxMGMztAX
	/2peMa2Nqi4XFrNNvm9Df3VjzwOnzY0H9IPXcInxCHIbAsxABz3oDZ6M0Zot5RLdUoMt
	nMSQ==
X-Received: by 10.15.60.199 with SMTP id g47mr7754721eex.37.1394047180441;
	Wed, 05 Mar 2014 11:19:40 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m42sm12794465eex.21.2014.03.05.11.19.38 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Mar 2014 11:19:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Mar 2014 20:19:45 +0100
Message-Id: <1394047185-6381-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] libsdl: bump PR
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
X-List-Received-Date: Wed, 05 Mar 2014 19:19:41 -0000

* another PRINC removed

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index 84d3ad6..7f0e17b 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -19,7 +19,7 @@ DEPENDS = "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
 DEPENDS_class-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
 DEPENDS_class-native = "${@base_contains('DISTRO_FEATURES', 'x11', 'libx11-native libxrandr-native libxrender-native libxext-native', '', d)}"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
            file://configure_tweak.patch \
-- 
1.9.0


