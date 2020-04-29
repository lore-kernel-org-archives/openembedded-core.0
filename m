Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.4522.1588176704058966806
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 09:11:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=noz/HxQl;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id fu13so933900pjb.5
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 09:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=VlaiKTqWZarQPlOmRHm3HOtgUMpsOGoEg2E8xSWT1ck=;
        b=noz/HxQlksJoquhphiBAC3fGpC5brcplurQUFVt7ZM6bjIhyLWuIuJ14xGn9Re7oIf
         OJcYsBIRef8n58zrbZhpg5Xd8GltYben633A2Z1tLmJWvzpb6g9aktx+JRJe47cBS/Hh
         cN3Aps5n6lNWV7Scpt+C4IbraGg8s0kZy7yPkQ33q9HC8baV9qym63ThYTnWEREP8K1a
         z98kqx9NV0uP+Anv7ky+E4niJQMdhFTOlcudreLbaooW1XKFY6RIIO+wEjR3TggYYnmg
         V/uceWfKGC2r5BsWHBH/h5MM+mZhOOMBNBm7kJHxZdjzJYzmfi/zFCOGMZQuPYJXjk2l
         dLdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=VlaiKTqWZarQPlOmRHm3HOtgUMpsOGoEg2E8xSWT1ck=;
        b=ijZngjhqQHJtF/sgp1sL8uEbjwddpWKJybM1z4VYZOPMfeBn6wa0MZXs/ADWt8yQJI
         mDhGV5eAmTjE756qfUUJGRDFYnbbq00mZ0GSZSo6z02uKX/38nQIn+6YcyEeqKrwJPhj
         hMEIxuNd9yZ3Bzab6eoQPZOwK7g2M4dz+l4oCfDN3oZGDPKQ/XIeqdP1KxlGoOf0WqIm
         bsxKWekNeXBOxDkZP6pg+XtLCq7iDxevG4CDUc5D1RJCR8hcAKlW/5RFzeUGgFK5LeCe
         qM5WJGmC95QGem1xfvwhgN4T9ThBlcpS1vVHrFFcpGLLyVHaQJh+QsGnwA5rBfwwQoAs
         HX5w==
X-Gm-Message-State: AGi0PuYU0adpF4D7KYCMUbh4WPSKEKrf2rfKvHYV3JnGSAL7G1Qm9PDH
	QouJRbFG6xjoI3I/IvXG6LeDUZaevigo5g==
X-Google-Smtp-Source: APiQypJD9bp18NmW5gAUj5NHNi9TjSuZcSTMTd1Q0fZQqBy/qtrsRC0MmXsKFUoNjm9w7YHT5XkSpw==
X-Received: by 2002:a17:90a:23cd:: with SMTP id g71mr3915755pje.174.1588176703082;
        Wed, 29 Apr 2020 09:11:43 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o1sm4833062pjs.39.2020.04.29.09.11.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 09:11:42 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/16] qemu-system-native: Fix commented out PACKAGECONFIG
Date: Wed, 29 Apr 2020 06:10:49 -1000
Message-Id: <10a9211adf7d26f72d76c0e598674a0debee0e97.1588175775.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588175775.git.steve@sakoman.com>
References: <cover.1588175775.git.steve@sakoman.com>

From: Jeremy Puhlman <jpuhlman@mvista.com>

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index f17a046fca..7a1ccf2115 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -180,7 +180,7 @@ PACKAGECONFIG[snappy] = "--enable-snappy,--disable-snappy,snappy"
 PACKAGECONFIG[glusterfs] = "--enable-glusterfs,--disable-glusterfs"
 PACKAGECONFIG[xkbcommon] = "--enable-xkbcommon,--disable-xkbcommon,libxkbcommon"
 PACKAGECONFIG[libudev] = "--enable-libudev,--disable-libudev,eudev"
-#PACKAGECONFIG[libxml2] = "--enable-libxml2,--disable-libxml2,libxml2"
+PACKAGECONFIG[libxml2] = "--enable-libxml2,--disable-libxml2,libxml2"
 
 INSANE_SKIP_${PN} = "arch"
 
-- 
2.17.1

