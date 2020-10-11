Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web11.29209.1602460182190015883
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2020 16:49:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@alistair23.me header.s=fm2 header.b=lWd6l4e6;
 spf=none, err=permanent DNS error (domain: alistair23.me, ip: 64.147.123.24, mailfrom: alistair@alistair23.me)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 2790B3AC;
	Sun, 11 Oct 2020 19:49:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sun, 11 Oct 2020 19:49:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm2; bh=jx615iPsCCXLjRahDaLheukYLe
	a9T9hTg2YH0OuNTVw=; b=lWd6l4e6LY2SZ3fFXz8h+iuDeSRl+W5Zhw8jvoQbDi
	v3JTPGiOcZIOgO4YZfyqWrCgIpwVTvn5pJ8leCWrfLkSY6m/qN4DMq8YKaK27hUD
	fiaKyN70C+iOgWVnoD1ypwzHNbMTf0yniWskP5vIFaXKLz0gHrv3QmbwvNBoH8MU
	cFV1w6Zb/c2r+8MgjLE0Fou6W5jyKmSAXN9dsFTqswCqi8h5JT2Shblc/kBev6dV
	l6iN7BTf+cplvzJclWpFoLvJp9cPUi1ZE+mqLFQWdmpZ1UTLYqjC05RnRfm4miJ5
	RF8vsGoScT8kU2KBNDaX0MzqI/VisSmUM7xPIESu+Kpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=jx615iPsCCXLjRahD
	aLheukYLea9T9hTg2YH0OuNTVw=; b=FKMMQo7UG7Ko9YolXlzDWusg/ZoWKGx9R
	d90uQNrAPNBQvlfjbybc6Wpa3dawzvu92M98Pd3UXJQxCKroNN6CIAfrymhi60vH
	6wx8vhe3FUulZdWT45ehilkl18CfnbNK/CeGVA8K+h+vljcb4dodrShvUqv30KZr
	RGEd2DPFq/tYXPsuPnYndIEuZGap/fUqHDfq8J3T/gbVlP9Kg/o94RebMyN2fp6q
	DYoq6aud+7xkhO0FQX/O0FfyAo9d9HHUrfQ1eC2jVD0c1zfkPMeWDdkO/BjZPUNH
	PxqB0CJ4g6HrkSeHp0xBXuIheyn9l9vGZFa2NDmgDvgEOEm7XQP7g==
X-ME-Sender: <xms:FJqDX7mGdMex8QzXdQioga6ehdRVjWmDkw1x0ek3kSTb7LdR54PgaA>
    <xme:FJqDX-2uKYZQy6LbQo1P6tzMe1p6q_XSydvlbj_7gAU13f6yJVAGTQaBD6Oq2hReA
    Lb8kaQqQpZNeeLBsUY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrheeigddvjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghirhes
    rghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepjeeliefhvdetgfdtte
    fhtdegffdtiefffeejiefffeevueeljeehjeevhfffueeknecukfhppeejfedrleefrdek
    gedrvddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:FJqDXxrBxFJ8ycYhiN6JjRAdg01pnEDkG05qm9icUH58HyUH8y6d_w>
    <xmx:FJqDXzkAH9iXDspTwGoBJd1z-LzD9d5QtM_3CgURnm8sVw5ggBLjrg>
    <xmx:FJqDX50SNr5-cf3Hkqu3nS0udFs-oY2K5mSHbE2U1AOU3LbNzugrxg>
    <xmx:FJqDX2jyCRrS6ZYWCQiz8T2PZm3oVZKPrPztqVj5m-GnCr_9lYT0IA>
Received: from alistair-xps-14z.alistair23.me (c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
	by mail.messagingengine.com (Postfix) with ESMTPA id 0508A306467D;
	Sun, 11 Oct 2020 19:49:39 -0400 (EDT)
From: "Alistair" <alistair@alistair23.me>
To: openembedded-core@lists.openembedded.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair@alistair23.me>
Subject: [PATCH] wayland: Set idle-time to zero
Date: Sun, 11 Oct 2020 16:49:37 -0700
Message-Id: <20201011234937.1041597-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 meta/recipes-graphics/wayland/weston-init/weston.ini | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston.ini b/meta/recipes-graphics/wayland/weston-init/weston.ini
index b48726d59c..d1532236af 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston.ini
+++ b/meta/recipes-graphics/wayland/weston-init/weston.ini
@@ -5,6 +5,7 @@
 #shell=desktop-shell.so
 #gbm-format=xrgb2101010
 require-input=false
+idle-time=0
 
 #[shell]
 #background-image=/usr/share/backgrounds/gnome/Aqua.jpg
-- 
2.28.0

