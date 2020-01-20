Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 765E67FD64
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 22:02:05 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c14so1090361wrn.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 14:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8HuI0RB5cMkN6gYUhMtDBFWu31w+9N+gmxKhgxA254o=;
	b=QASnFm2HYlKYgm5sj6ex1mBK/+wQZpiSJ7XBj8Jx/tX+ciaw6UQ6kTKO1eEN3t6cGM
	2f9PCkxAPwryCT1sdgldJbIwCgOe7uQA+e+n77yV8z0aykafLAx1GJ46nzce636Yj09R
	G3wyiTjeuPtocuukoetvbP63uxNC583Vn0f+Iedgsj2X8H9TGufI5idzH9/uaTMZ2UAd
	F5dLq3hnpvymL2BpIFJec2kTMfoXH6ZU6KXIqZdtyO/Erm92G9Ru/KINwjreadFPq4tE
	8EOzZ35MKYSr6L+BYDJGQ1d8KTj5P2xnH3Yv8+OkBu+QiLta+3UAsMo2MqNdO35SopCQ
	rOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8HuI0RB5cMkN6gYUhMtDBFWu31w+9N+gmxKhgxA254o=;
	b=IzF4thMhc3I3tQ7fVC+b5aJ55DrWO977e43pRmPNXcjzV9D7AtqgIgvlwIk4lgx8r3
	aKteAzLwfZUNAaOTcfMWBfNhaeKo426cMmMyT4mjCDcn4rsjIE6mcEdns8BPhCFWjCgG
	ajmQv+zQXJiXA0xv0i+BzF3XoczNVfYPD1Rty/snrqr+BwwlbeIVHWLOb0tsXxmaTXxq
	ZN0gvecjWbn/VDrIgd4VWLT9nG7JjgBLbNFNoDbdZNcya2Z23uYt1Uc+cuSDkRaBW3Pd
	Rn0txBE6v6p/hL77jsSNYX9BAee4ZJSYbFD9yU2XsPuQPi2knd49A1JfEdzndKB+O+1v
	XkCw==
X-Gm-Message-State: APjAAAUJEDJfuOqkuTXxxO7aSaVdhRP6WOK5gySQxuXmfy7Gfz2Oi9E/
	5mXgeuUcJKrQRpHHe2icXRFoXe1t
X-Google-Smtp-Source: APXvYqwo8nj567vIm8k+TxCVJaamEQgyVIVsCFlFs41g195cX/SaBp8m+V69PwXqEYVu7oDqGt/ccA==
X-Received: by 2002:a5d:4f90:: with SMTP id d16mr1457482wru.395.1579557726090; 
	Mon, 20 Jan 2020 14:02:06 -0800 (PST)
Received: from localhost ([109.238.218.228])
	by smtp.gmail.com with ESMTPSA id 4sm927225wmg.22.2020.01.20.14.02.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 14:02:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 23:02:00 +0100
Message-Id: <20200120220200.31859-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200120220200.31859-1-Martin.Jansa@gmail.com>
References: <20200120220200.31859-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] gstreamer1.0-plugins-base: add PACKAGECONFIG for dispmanx and set OPENGL_WINSYS based on enabled PACKAGECONFIGs
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
X-List-Received-Date: Mon, 20 Jan 2020 22:02:05 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-base_1.16.1.bb          | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb
index 7ce9238c4a..cf12ceba61 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.1.bb
@@ -38,7 +38,6 @@ PACKAGECONFIG ??= " \
 
 OPENGL_APIS = 'opengl gles2'
 OPENGL_PLATFORMS = 'egl'
-OPENGL_WINSYS = 'x11 wayland gbm'
 
 X11DEPENDS = "virtual/libx11 libsm libxrender libxv"
 X11ENABLEOPTS = "-Dx11=enabled -Dxvideo=enabled -Dxshm=enabled"
@@ -67,6 +66,12 @@ PACKAGECONFIG[egl]          = ",,virtual/egl"
 # OpenGL window systems (except for X11)
 PACKAGECONFIG[gbm]          = ",,virtual/libgbm libgudev libdrm"
 PACKAGECONFIG[wayland]      = ",,wayland-native wayland wayland-protocols libdrm"
+PACKAGECONFIG[dispmanx]     = ",,virtual/libomxil"
+
+OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', ' x11', '', d)}"
+OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'gbm', ' gbm', '', d)}"
+OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'wayland', ' wayland', '', d)}"
+OPENGL_WINSYS_append = "${@bb.utils.contains('PACKAGECONFIG', 'dispmanx', ' dispmanx', '', d)}"
 
 EXTRA_OEMESON += " \
     -Dgl-graphene=disabled \
-- 
2.20.1


