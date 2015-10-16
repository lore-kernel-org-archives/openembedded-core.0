Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5821B7713D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 17:43:37 +0000 (UTC)
Received: by qgbb65 with SMTP id b65so1401859qgb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 10:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:organization;
	bh=+P8dF4Iy6zISzTdx/S1dHxTYeu0gTfMIP01M+jcmfDw=;
	b=G6oFmqEprJ0Jym8JIZzVZy2FKLdtQBh/CRvrAm3HB7DYV7lSDHEH3g7p1faCbJsCnG
	ZYzB1GpRK8N+aT91ilCLLJrVS7PmtWzXbU1Zp5akCRr9G8QoaxA76Asf9h/RtrvRvtKh
	Dibww+s4BHnK5Wyp/ToNHWvMOS+9hGSXgZ6ZXWF28qNZcpsWuOB6Bw455vbND7rpbcL5
	wxSSFAkXSrdtXjtPaJkl0JhbsU2wczUT9zTirCLOLox7NuRRP+77pln/1KncN8LrvBV+
	TjHZTuhG/JRS5xSH1CwzuIH+06nqg1+iYo23CLz09UeHkEypxUupRZm9+b8cC2NaqPtf
	k0Fg==
X-Received: by 10.140.98.54 with SMTP id n51mr20366043qge.75.1445017417954;
	Fri, 16 Oct 2015 10:43:37 -0700 (PDT)
Received: from localhost ([177.194.195.186]) by smtp.gmail.com with ESMTPSA id
	q67sm8139101qha.30.2015.10.16.10.43.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Oct 2015 10:43:37 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 16 Oct 2015 14:43:26 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Oct 2015 14:43:22 -0300
Message-Id: <1445017402-20082-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.6.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] weston: Add PACKAGECONFIG options for XWayland and colord CMS
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
X-List-Received-Date: Fri, 16 Oct 2015 17:43:40 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-graphics/wayland/weston_1.8.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.8.0.bb b/meta/recipes-graphics/wayland/weston_1.8.0.bb
index 342c604..a265b34 100644
--- a/meta/recipes-graphics/wayland/weston_1.8.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.8.0.bb
@@ -22,7 +22,6 @@ DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
 DEPENDS += "wayland libinput virtual/egl pango"
 
 EXTRA_OECONF = "--enable-setuid-install \
-                --disable-xwayland \
                 --enable-simple-clients \
                 --enable-clients \
                 --enable-demo-clients-install \
@@ -67,6 +66,10 @@ PACKAGECONFIG[lcms] = "--enable-lcms,--disable-lcms,lcms"
 PACKAGECONFIG[webp] = "--enable-webp,--disable-webp,libwebp"
 # Weston with unwinding support
 PACKAGECONFIG[libunwind] = "--enable-libunwind,--disable-libunwind,libunwind"
+# Weston with XWayland support
+PACKAGECONFIG[xwayland] = "--enable-xwayland --disable-xwayland-test,--disable-xwayland,virtual/libx11 libxcb libxcb libxcursor cairo"
+# colord CMS support
+PACKAGECONFIG[colord] = "--enable-colord,--disable-colord,colord"
 
 do_install_append() {
 	# Weston doesn't need the .la files to load modules, so wipe them
-- 
2.6.1


