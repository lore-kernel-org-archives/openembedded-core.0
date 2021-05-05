Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web08.9836.1620227989430194279
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pvtRWw8D;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id y26so2507748eds.4
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KsVBnOj+io3/sUoKmVMZkvylgiZ58aGI3lE2MKnYUkA=;
        b=pvtRWw8Dxq25yXT+b1kjzQcmgd9kEuY3r6EhPp/I9woq0rdhpzR9/mKFDMuOnoU7Sh
         7i8x6tJe14ACcIhdvJP2CPsffReAQX/r2l3QoUkgqu7EioneaZ5cMkSNFVrNDV3EDnGs
         qgFt84eugIKlOtcX9dDJrslnjcFdt8wsg81eihQhEJeYv0v5E3qReKbBcEcWT9M+0BYW
         FD5afVTEXCHs90Npm4SdDFM3nv8/ltuy5wDhbdqu3KoAX/hwd8xHa76itYd8mYSz4tPG
         qjC2y+bxyFOVVYgVsjGM7DOvCB4vFGSJfeCZt9FjKSDALq2mHRznEllVsu9ojwXqznDh
         +fbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KsVBnOj+io3/sUoKmVMZkvylgiZ58aGI3lE2MKnYUkA=;
        b=bvwdUn7UkW8bw/OQz7ytBl3yyj1EPemcwxlcAq99GD+Sp1K3th6jO+34J0PTsyRflE
         QmaVMas92bllSlgtwrBlzQExn2jwxX7OMVoItxN4YU5ZG8el2mH6r3bi/yhvYzzGLPRL
         p/9fvv0JEKoO43r7v3lsVcc5HjhHoH5rg3ztsjRZW3luUi9lAg5WsDWX1j0l8ye7zPW9
         RWZjpuekJR5kz73iRLEeYYikgVQBJiaxxh12D+5emh9HRminCvGM9VkIlqEcIMg6za3X
         SPHd6GlnSEQYOVS9SzEkdvheYd59DR24snPXntDtIUtXOJztesHXiHli0gkQOyEslifw
         FM2A==
X-Gm-Message-State: AOAM530PICJaIArcj/5FzdGr9OtGhaFInToekYuAz/dPxXJp4s/tzn6M
	4LEZAeEoRiQkZ8flQugRLJmFHZYOOtyzqQ==
X-Google-Smtp-Source: ABdhPJz3s9fvaO3OShkThQkPuZLQdWtKEFXvYYEvmmtHsChuz2XTtO3gbnO7bZieiJetIQudwUOPAw==
X-Received: by 2002:a05:6402:652:: with SMTP id u18mr32725636edx.388.1620227988096;
        Wed, 05 May 2021 08:19:48 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:47 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 59/61] gdk-pixbuf/pango: replace gtk-doc with gi-docgen
Date: Wed,  5 May 2021 17:18:48 +0200
Message-Id: <20210505151850.660512-59-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb | 2 +-
 meta/recipes-graphics/pango/pango_1.48.4.bb        | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
index 2734a11f96..e28423efd9 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
@@ -28,7 +28,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
 
 SRC_URI[sha256sum] = "c4a6b75b7ed8f58ca48da830b9fa00ed96d668d3ab4b1f723dcf902f78bde77f"
 
-inherit meson pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gtk-doc lib_package
+inherit meson pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gi-docgen lib_package
 
 GIR_MESON_OPTION = 'introspection'
 GIR_MESON_ENABLE_FLAG = "enabled"
diff --git a/meta/recipes-graphics/pango/pango_1.48.4.bb b/meta/recipes-graphics/pango/pango_1.48.4.bb
index 8f11bee3c3..9efde6577c 100644
--- a/meta/recipes-graphics/pango/pango_1.48.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.48.4.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspection
+inherit gnomebase gi-docgen ptest-gnome upstream-version-is-even gobject-introspection
 
 GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
@@ -31,7 +31,6 @@ PACKAGECONFIG[x11] = ",,virtual/libx11 libxft"
 PACKAGECONFIG[tests] = "-Dinstall-tests=true, -Dinstall-tests=false"
 PACKAGECONFIG[thai] = ",,libthai"
 
-GTKDOC_MESON_OPTION = "gtk_doc"
 GIR_MESON_OPTION = 'introspection'
 
 do_configure_prepend() {
-- 
2.31.1

