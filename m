Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.3260.1594933705805185740
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 14:08:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ki/KkRLO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id f18so8635214wrs.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 14:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=SqOCy4HgR5kv6HfnCc1jGkINS79SQqBiD5OGsg7Witw=;
        b=Ki/KkRLOB8USiOiodX2ciuRM8ADYYq3wao7JKINtBK3CPot8SNgwM8kgS+giQtNisq
         iZX7ZY5DrZqIWwNQg4xtmijUvV5fggIsYubCCof+6NTW0jc+h7ONWMysRIoKR28MabM1
         7vSBxJ+WXaGt8LH3yzA6lamnRVl4earnZwcoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SqOCy4HgR5kv6HfnCc1jGkINS79SQqBiD5OGsg7Witw=;
        b=fNaoEv2CWLi5/CGIG7lhpy28vBkCK1CuyUrzELj3R6/9DOTyQrHhzf5T9euCU9N/LO
         XrzDC6SyrUSXtPI0zCg9ziBmg3to596KJ64ah8wE3OubI16Sw1zx3lvCt703zjH/2L5U
         sQZTgwv+2V6PKPFit55/DnRjqMUMDn4tRDYtAAu6k1JswMaJvBtlxkY4Cgcn1dfQfToj
         msxlD+eoGLI9EMfWRFyFtgwPqHjiZ56SHnoB07xItKJW7t+uTjIbMWUa9KLSnbaCTixm
         Ozf1C4z0qilWNveA/UbYdZvtMagtDn9cMnp49LBm5/k7eHfBptwhFfNdGBOv5gQPAlmr
         IfCg==
X-Gm-Message-State: AOAM5331KO7pXLnKsuF3iHT/CKc8iWa6om3xD38FJ/TtGDPiA2X2SjiM
	uklv0V+9yN+A+vCIi8F/B7eewdfpNP5TQw==
X-Google-Smtp-Source: ABdhPJzEeJMjfsk0yf2UVw93ltcmFVUpLwWphCCXR3tLkczR2NZzivvLfYGgJi5e6vb1Nv74DV1l8g==
X-Received: by 2002:adf:e546:: with SMTP id z6mr6294430wrm.99.1594933704086;
        Thu, 16 Jul 2020 14:08:24 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.2.4.2.d.8.4.b.f.c.c.1.d.5.4.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b45d:1ccf:b48d:242f])
        by smtp.gmail.com with ESMTPSA id r10sm10952034wrm.17.2020.07.16.14.08.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 14:08:23 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/20] epiphany: upgrade 3.36.2 -> 3.36.3
Date: Thu, 16 Jul 2020 22:08:01 +0100
Message-Id: <20200716210808.7438-13-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
References: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../epiphany/{epiphany_3.36.2.bb => epiphany_3.36.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.36.2.bb => epiphany_3.36.3.bb} (90%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.36.2.bb b/meta/recipes-gnome/epiphany/epiphany_3.36.3.bb
similarity index 90%
rename from meta/recipes-gnome/epiphany/epiphany_3.36.2.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.36.3.bb
index 8ac318b0d7e..8eb4ac4fcce 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.36.2.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.36.3.bb
@@ -14,7 +14,7 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
            "
-SRC_URI[archive.sha256sum] = "c2e676aa0fe211809a5e7e8a7e461d182890f253c53f4610f2610094b6fbfb5e"
+SRC_URI[archive.sha256sum] = "621b5626374891769afec9c35946ab6c3910ea9cf9a2498bab166c99bd91e16f"
 
 FILES_${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
 RDEPENDS_${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
-- 
2.25.1

