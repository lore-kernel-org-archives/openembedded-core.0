Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6324973289
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 13:49:15 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id f65so279268988wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 06:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=HvVJI4fS7Mj63StdjU5a2oDTOL7MnRLkthbbUReqcYk=;
	b=jhzCwRNe3bN/4gLCBvMHgek4EXy6rHp5KKsmg5cqdF8c93rw8nQP+339LpTqfKhQF2
	JX7j8O/XYO3C5tCNiENM/PbBf1fJbKoFgeb3zrFELDpobhw+Quu24dhJl8RUslHFYQTH
	nXKHEk5+s8hxEsIw0+tB3X93KIoEMdUVEufi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HvVJI4fS7Mj63StdjU5a2oDTOL7MnRLkthbbUReqcYk=;
	b=CabzigMLoOPOHy4K4Fw78osvQASkMzJw02Qk3fa9e6BbLaE+OIQ1kXpQjU1ZZhNrid
	ZPqeJvaq7YO2Z4TkzEZLJx/KUQIi2k84rC3uX/niq0V1beuQvLdi8+C17EbHX8DIeAty
	HTtOgpilkAu7eCjpwUfKGCao8LfpU0ylzvv9Y73E1nZ7Ph3NMSJp5HuMaQeOl2+I8Y4r
	ItjkBYT0VFAyk1DNCeh+kKH4TxCyEJuN6M2ljcHFwEOt7zrCKIGhDWlKBOLnX8plbUOn
	AljMudEjUXNTc6TQWEy6X0WTDRU89anKTAhZv0hcYjff7UDWU35q6IK+W4tcQ9CEOr8R
	Y7nQ==
X-Gm-Message-State: AE9vXwO7dY3u/uVCGZcNQ2cWGFaSWgKH4ynHTM1w9sJ6OC7ZUSxL45nhDVNWAug2jjrmfB8J
X-Received: by 10.194.47.100 with SMTP id c4mr4146792wjn.34.1472219355344;
	Fri, 26 Aug 2016 06:49:15 -0700 (PDT)
Received: from hackbox.linaro.org ([81.128.185.36])
	by smtp.gmail.com with ESMTPSA id
	e65sm20753327wmg.3.2016.08.26.06.49.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Aug 2016 06:49:14 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 14:49:01 +0100
Message-Id: <1472219341-21220-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.7.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] gstreamer1.0-plugins-bad: add packageconfig for egl
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
X-List-Received-Date: Fri, 26 Aug 2016 13:49:17 -0000

In commit 9c3a94aea1d (gstreamer1.0-plugins-bad: Move EGL requirement for
Wayland), --enable-egl was explicitely added to the wayland packageconfig. While
this is correct that enabling wayland requires egl, it should be possible to
enable egl without wayland, even when using X11. For example, glimagesink can be
used for GPU based color conversion using EGL/GLES.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index d8c8179..1a94d1a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -32,6 +32,7 @@ PACKAGECONFIG[curl]            = "--enable-curl,--disable-curl,curl"
 PACKAGECONFIG[dash]            = "--enable-dash,--disable-dash,libxml2"
 PACKAGECONFIG[directfb]        = "--enable-directfb,--disable-directfb,directfb"
 PACKAGECONFIG[dtls]            = "--enable-dtls,--disable-dtls,openssl"
+PACKAGECONFIG[egl]             = "--enable-egl,--disable-egl,virtual/egl"
 PACKAGECONFIG[faac]            = "--enable-faac,--disable-faac,faac"
 PACKAGECONFIG[faad]            = "--enable-faad,--disable-faad,faad2"
 PACKAGECONFIG[flite]           = "--enable-flite,--disable-flite,flite-alsa"
-- 
2.7.0


