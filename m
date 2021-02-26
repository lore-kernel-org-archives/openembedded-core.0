Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.10055.1614349621026424034
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:27:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=CXNnCfZq;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.49, mailfrom: steve@sakoman.com)
Received: by mail-io1-f49.google.com with SMTP id s24so9787513iob.6
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ESWTYAz6bk88AuEp9B84d14SrruBl/iW0h9cHGp/bRI=;
        b=CXNnCfZqAzmIPrP/K2koPs0Pap3LK/Mlqbl0v7cZr/D3vvZZTVaD50qCswofPka1iz
         U75tpAl9lz3WBsJekhRuxEAP5z3r4Mhjb3zV7IVj0Kk16aF2sttNV9dZ+k0LStpFx+BD
         It0RyAFUkD8PbVB0T3ACKGjeKVPnpSItrlaGd/10Oj7ijyVC00EwDXbyuHW4+cH/75jz
         Re5Ex0QqE1UxcJmdsfv8F6bZUQD2DqugHVZ1E+4bkkeey/ZA2K7IWZqprN5wyM0BGfRD
         qu2cK/nsCPenQDAvBj3fDHLsx/BzEt/XGkoYflUllhxTdu3SYdH9uU9MqqFxg/zMkTjZ
         24aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ESWTYAz6bk88AuEp9B84d14SrruBl/iW0h9cHGp/bRI=;
        b=I538h+iVYqSsx9sWCxWEUUqvE2hsT1okrsaQFj3VIg5LLi1WTQmU4DptsA6pdKexIH
         fu3JU7q3q9/Be093J2CJN84tecIQkrBk195QrsbLzs687BUKyIiOwm35G1aTPy1+yAt+
         cy7KG0bhvz6a3gt4T7eyLewwUOSmRw85NAUUJpny5FGkzu2AY7WqlkSGr2szDnPdYPGx
         Ffz7IWLpNDbCU1K8d4fk0Sc5zXS3rKeGu8PUhF78Cg4japVATq8Bk/AGOk7oUoACPQY7
         IdYzOQvN0BC/tED7x5/xEktDrlZskVbrhS6+g1ud11iiuHN1rfGYKF5Au70u9GR7QHDP
         sUWQ==
X-Gm-Message-State: AOAM531hyfvdVWr1xHdrG7xL/mSsjEqvqbn6SC5yBS0lp7O685rgLF1p
	f+UFPySzTjr7cXLF2fDUV5R6JLen5UG7KgiB
X-Google-Smtp-Source: ABdhPJzFNkWSKIyzo6zErPqXf0rmfR1Dl6Md/6q86boz3f9b6Pthyppw7kbEz8lrPZiTPl93A/HZqQ==
X-Received: by 2002:a05:6638:248e:: with SMTP id x14mr3149704jat.93.1614349619973;
        Fri, 26 Feb 2021 06:26:59 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.26.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:26:59 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 24/40] xorg-fonts-minimal: Fix reproducibility
Date: Fri, 26 Feb 2021 04:24:07 -1000
Message-Id: <c5ea91159a6a287f63fe90b28d4cdccee38a2081.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When installing the font files, preserve their timestamp rather than using
the current time which fixes reproducibility issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a0c4f4b0182a995f0eb2709cc9b3c852527ab936)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
index 1ea08a6c99..e1e470bf34 100644
--- a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
+++ b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
@@ -26,7 +26,7 @@ RDEPENDS_${PN} += "font-alias"
 
 do_install() {
 	install -d ${D}/${datadir}/fonts/X11/misc
-	install -m 0644 ${S}/* ${D}/${datadir}/fonts/X11/misc/
+	install -m 0644 -p ${S}/* ${D}/${datadir}/fonts/X11/misc/
 	install -d ${D}/${libdir}/X11
 	ln -sf ${datadir}/fonts/X11/ ${D}/${libdir}/X11/fonts -s
 }
-- 
2.25.1

