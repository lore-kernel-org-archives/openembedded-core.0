Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f173.google.com (unknown [209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 44CE36608B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 11:35:27 +0000 (UTC)
Received: by mail-lb0-f173.google.com with SMTP id 10so7278573lbg.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 04:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=sA6DZon7GHNaKM60b684aCdsFtLobDfODsbR7m9Ag9Q=;
	b=i0XqJAXqBueLqb8NGMAjcfOlHjZC2OFzbJPRBJfQPrcUcgqnRJ/yQRL7DTW8il0d0b
	oKsuSlacCcjEDhcryLi84JtKT5CLlb2zUj5WGDaTH+qL6RUg0Zhqj62B0IQwyDjuOR8s
	lXsrnyZHAKQ2ys2orO9CvDmMh0Yh3X4TTxomRi5OQtsxOcs8wXwX84j5KwPeL04pYDbP
	I0jB9JT03sNnqh85OgWCV7bT2q2BoVUNvUYzf8vxJIB3wZFLl8ZOl8mRqTVrYRMHRejg
	mBG+E7UXQvQk+Ri5dj+sGvDbntww5XMdQui3rzIqzmo5LJzt8kZasJ/ELQmY2Z4Rom5X
	ivjw==
X-Received: by 10.113.5.40 with SMTP id cj8mr826543lbd.69.1399894528480;
	Mon, 12 May 2014 04:35:28 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m2sm7152841lbp.31.2014.05.12.04.35.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 May 2014 04:35:27 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 May 2014 13:34:59 +0200
Message-Id: <bd9432cf17ff99d012c70f3765a195adaf548e7f.1399894447.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <cover.1399894447.git.Martin.Jansa@gmail.com>
References: <cover.1399894447.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1399894447.git.Martin.Jansa@gmail.com>
References: <cover.1399894447.git.Martin.Jansa@gmail.com>
Subject: [daisy][PATCH 10/10] gstreamer1.0-plugins-good: add libxfixes and libxdamange to x11 depends
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
X-List-Received-Date: Mon, 12 May 2014 11:35:28 -0000

* fixes following issue in test-dependencies report:
  gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc/latest lost dependency on  libxdamage

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
index 06de4da..febff3a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
@@ -14,7 +14,7 @@ PACKAGECONFIG ??= " \
     orc cairo flac gdk-pixbuf jpeg libpng soup speex taglib \
     "
 
-X11DEPENDS = "virtual/libx11 libsm libxrender"
+X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes libxdamage"
 X11ENABLEOPTS = "--enable-x --enable-xvideo --enable-xshm"
 X11DISABLEOPTS = "--disable-x --disable-xvideo --disable-xshm"
 PACKAGECONFIG[x11]        = "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
-- 
1.9.2


