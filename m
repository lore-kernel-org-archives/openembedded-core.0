Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web12.109.1603837802448565929
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 15:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=PNjIZ77W;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id w65so1759396pfd.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 15:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=4v8ScoVZfJLVbA1Q3NHBp4i0nYx/vnsCBvymKYkOkoU=;
        b=PNjIZ77W6KpxhkL6pkZdT2tlxZU3TWRf0XqztW2QKk0Oj8tW41MqZVbvFqW+W2kk3P
         hAJGFe+BxhXgbyEAEezfLILp5T2NUGvwdrUcI5Mm2y+ioyYE1RGIqykI/3iIS46fGC/Z
         AIUgftxWxK2CpcVoKvO2+wEdwvqM4fEfXKzaS5v8NTvtP6cr1WMzjeOcdMXTYw4TOoT0
         TXWSwG8ekBgB7v6hJCrypa5aczdlceHYGS3o4TvslgBoEd4PuoCGzSOV8dsDl3jnNFAA
         yd0v7cM34PxFxCspQm1xfvmpc6OedREIGN4wnRY9TzfMHA/M+iYZm9DjMd0igbTiansw
         tI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=4v8ScoVZfJLVbA1Q3NHBp4i0nYx/vnsCBvymKYkOkoU=;
        b=oz1nx3ALMPmxvSl5D0CTRjwMhhLlxvJ6ukjJhB8X9qAVPeB17kv/OVQp2cHxErGA5y
         XnK/xxPPL2JQOiRZnKhJIMoCH33GM8psGQxA1TrKFzVpNorNhUCHlbtRDnG/Jw0Y2Ex3
         s7yCerBaGSJSPnZdQxMe5ztFhYSRrqKGCfsvtRNy4otypR/XW0JXLu5VntS+eXsxrWhQ
         I/N6MY/BvxF8jBpzMl8RIR917vrJ0lnjYKmN/3tiAi7L7lsuiv/0Nn0AkeQMW9c0ZUL+
         sY1jPs5Kkkw8e0ZU1o5MuSIlzqldX9yZ7QoAZgPFRZvGcA/fvT3WYdil+n69H2ngHw29
         K3RQ==
X-Gm-Message-State: AOAM532phyzrYHQWZzvhLlyN2Zh9FerjsuEebT8wZjpgorA9otZc9TE3
	xKjOX1ZRvDllDQ93WjWDoi51d1ZJ8yxNKXhs
X-Google-Smtp-Source: ABdhPJyV2yEbKH0fFtUBwsz8hlwtRHDLjr7bPk+4tthtjPphyVOSavA1RY+nMvUhNILFjbPQrN0a6g==
X-Received: by 2002:a63:4204:: with SMTP id p4mr3787149pga.219.1603837801501;
        Tue, 27 Oct 2020 15:30:01 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b7sm3699000pfr.171.2020.10.27.15.30.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 15:30:00 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/16] gstreamer1.0-omx: Update 1.16.2 -> Update 1.16.3
Date: Tue, 27 Oct 2020 12:29:17 -1000
Message-Id: <559751de088c4632a37950b220b33dc207ce4900.1603837524.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1603837524.git.steve@sakoman.com>
References: <cover.1603837524.git.steve@sakoman.com>

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...{gstreamer1.0-omx_1.16.2.bb => gstreamer1.0-omx_1.16.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.16.2.bb => gstreamer1.0-omx_1.16.3.bb} (92%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.3.bb
similarity index 92%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.3.bb
index f1bdbd235d..1aa13cf73c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.3.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "6362786d2b6cce34de08c86b7847f782"
-SRC_URI[sha256sum] = "11ed411a2eba75610d72331eeb14ff05e2df28f4fd05cb69225a88bec6d27439"
+SRC_URI[md5sum] = "d4d89dd44362c1d262186c60437cdbee"
+SRC_URI[sha256sum] = "60603b7889528ef8539d36cb3284b648c46aa0cf980a28cba4d3fe3a44988ff9"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.17.1

