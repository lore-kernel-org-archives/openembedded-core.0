Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2D7C86B356
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:02:40 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id q10so194957eaj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ZECUC6twrk4UbkJFxwRONFUp6xryr15Q1HB0s1CdBHU=;
	b=d6fY8xHskwQDXw/0hhgntQNUA1Jtlj6Kodwc/Hv4LBIrI6v6nc3K6lUIbUWCKpyd48
	7XhvCK9zZGLwGmBJf+cls79ma6XZ+dv4pR5XwjC8nvk8adIzI4yl8w8cXhf8k4Cm9GCE
	sV/Cz+OCSM3HvzFq3bktPA3TRpCNvP38tRk1ZKdB9QScOfln4cXOvsRRiDr1uv1aVPq2
	AB99K72VOSQ6oBM/cq4N7qx7qtLHw+xE63hL/Z3T7B9WuqQ6rcQ8RlCkOrA8ODJTKn6D
	bnhtz1C+HsXOLbpfZTiBqEPQJKznF5GuAdJmX7Pu33sxqhza0nRk9q+IRZ8TB7wmN3zZ
	7iIQ==
X-Received: by 10.14.173.130 with SMTP id v2mr37569312eel.29.1374667360549;
	Wed, 24 Jul 2013 05:02:40 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	w43sm65644096eez.6.2013.07.24.05.02.39 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:02:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:02:38 +0200
Message-Id: <be7478710c2a0431391229124cbfc75097727a5a.1374667312.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
References: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374667312.git.Martin.Jansa@gmail.com>
References: <cover.1374667312.git.Martin.Jansa@gmail.com>
Subject: [PATCH 16/18] gstreamer1.0-plugins-good: add PACKAGECONFIG for v4l
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
X-List-Received-Date: Wed, 24 Jul 2013 12:02:40 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
index 3d0f970..68bc9f1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
@@ -32,7 +32,7 @@ PACKAGECONFIG[speex]      = "--enable-speex,--disable-speex,speex"
 PACKAGECONFIG[taglib]     = "--enable-taglib,--disable-taglib,taglib"
 PACKAGECONFIG[vpx]        = "--enable-vpx,--disable-vpx,libvpx"
 PACKAGECONFIG[wavpack]    = "--enable-wavpack,--disable-wavpack,wavpack"
-
+PACKAGECONFIG[v4l]        = "--with-libv4l2,--without-libv4l2,libv4l"
 
 EXTRA_OECONF += " \
     --disable-directsound \
-- 
1.8.3.2


