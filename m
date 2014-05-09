Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f44.google.com (unknown [209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1E51C60897
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 14:31:03 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id ld10so4428936pab.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 May 2014 07:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=b65M9cyH3jXTPa1IWiG9SGHoYp2A/jgdWipw6uMriAs=;
	b=wdGxfUkD9qiw6WHld9BH5UxPfc4+dc+TfM1xPYFC89Zz5BSxYMsoPijDlkFrvZi3eT
	dMZVvUWdcljEr7UDESDifPUOmSp19dttfU9wYGD8tfUhiGo27GxEGbCgEsiYSB9KTNh1
	LMqlCvPaVllsh+dhxvY3h7TA842dcNvnk/nLwYUENwiLo64cAX8Np3vGIkMq/GlCVA8N
	czDxJZ6A6FKy48kTw1JooZ/BnMGQW4kAAT4L1aeK35e7dIlj8noETAKSKlcnOO2/K7sr
	X78/hvZwXXR4E8KmGaPtlHdPgLssrBgCxaHYqtaMKszWbRCK89xu2wKPlIIeclfLA7Jf
	/pyg==
X-Received: by 10.66.249.165 with SMTP id yv5mr20914098pac.79.1399645864755;
	Fri, 09 May 2014 07:31:04 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id vm3sm7919174pbc.45.2014.05.09.07.31.02
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Fri, 09 May 2014 07:31:03 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 May 2014 07:31:48 -0700
Message-Id: <1399645908-14499-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] weston: add lcms, libpoppler-glib dependenies
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
X-List-Received-Date: Fri, 09 May 2014 14:31:07 -0000

From: Tim Orling <TicoTimo@gmail.com>

fixes for JaMa test-dependencies build (oe-core-contrib/jansa/daisy-backports)

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta/recipes-graphics/wayland/weston_1.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.4.0.bb b/meta/recipes-graphics/wayland/weston_1.4.0.bb
index 5213166..abacb58 100644
--- a/meta/recipes-graphics/wayland/weston_1.4.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.4.0.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "74a2319d98e9cdb1acf24659699719aa89ac268cf549759271e326edc5
 inherit autotools pkgconfig useradd
 
 DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
-DEPENDS += "wayland virtual/egl pango"
+DEPENDS += "wayland virtual/egl pango lcms libpoppler-glib"
 
 EXTRA_OECONF = "--enable-setuid-install \
                 --disable-xwayland \
-- 
1.8.3.2


