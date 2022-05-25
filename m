Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97317C433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 14:30:36 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web09.7400.1653489028039175994
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=HeyxkCz+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id y189so4301651pfy.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8ysRKjAe+GWYq0wLs6n5fNUT3cIZLEhP8GOZ0JJj7ec=;
        b=HeyxkCz+ex2DCWhIKQbB4E6EZqJp7nvObAXs4zBgJSVXDQSTN/x+ARO7WOyv85qW+E
         ZOxhJdxAVnznEQM953SIOYRsp1sGguhJ7hhVRNwBTZllGAlImqlIQiUhgsj9ErgxGg7z
         +hEgqnrC+9ZakUj9wA069lxzOafuqn6+mPGdvDy2FiFfTvg3e34ffY4+mX9H5Iaq+J/C
         zFQ8nhOSWzaIkps2RXe6YTJAsExh4l6tCA5/pL3lpj0ucDLSTlugx6KwygwfLIlnnhjp
         ziAn2NiNflJRFFBf0GxeFdmnzAL1jkcz7qOgdNk3TriHUMoEBp+JYeylKL84sGHbtnye
         SrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8ysRKjAe+GWYq0wLs6n5fNUT3cIZLEhP8GOZ0JJj7ec=;
        b=FBDtFrm1oqATJqPQrXWKWmczGSf/3sJg9yfxzC3+QcoysQxD8lxJ77FIcVL14nW39H
         GTrIaN0SiYL0YHffnBRRN5hcGh3XnLbK6NaTreMsAxeqyOeLOg/qNzAw0sSGtc6Bmzoc
         szDW3XWRCSHef7WxZe270lAnZ0IZZ5v00/sIQg49383PtyeCJpjJufgfBXRinElKhEzU
         mRQN8nocjtI3OmpLA4Tlh0n+qRe8WDHNBVkeNI+/yNzJL3GmhFla1LFjUhYsO4PI1uyW
         5dVTYTTylsLYcbHvPqrRupMVSFGxNR6Tvr2lOiHsAel2/3uULA0Cp3HJNtJN25/nxW7Q
         7FmQ==
X-Gm-Message-State: AOAM530jzPpNtRfhmVs+47LRges1xMyc+cl2Qp95TaAj/ctwxXQVUwi4
	wlN/VVB9eawfseA6q+Fnn52Dba0ffTuajLfJ
X-Google-Smtp-Source: 
 ABdhPJyIAVR6hx75J67lp9cMhXyjhQKrDG8i3LuFfIa/VUjvp0cR1nfU1GwPjmV4ELI3x2ET14jfAA==
X-Received: by 2002:a63:ec56:0:b0:3fa:f7f8:c644 with SMTP id
 r22-20020a63ec56000000b003faf7f8c644mr999434pgj.52.1653489026870;
        Wed, 25 May 2022 07:30:26 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a8-20020a656408000000b003db141a5f26sm8553837pgv.1.2022.05.25.07.30.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 07:30:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/19] gstreamer1.0-plugins-ugly: upgrade 1.20.1
 -> 1.20.2
Date: Wed, 25 May 2022 04:29:38 -1000
Message-Id: 
 <038cbfa1ae1ae79d09991235c23188f9477e185f.1653488418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1653488418.git.steve@sakoman.com>
References: <cover.1653488418.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 14:30:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166136

From: Alexander Kanavin <alex.kanavin@gmail.com>

Bug fix release:

x264enc: Don't try to fixate ANY allowed caps

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 49c5fdf15c70862c867bf7f17ed1f4ca57de2307)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ugins-ugly_1.20.1.bb => gstreamer1.0-plugins-ugly_1.20.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.20.1.bb => gstreamer1.0-plugins-ugly_1.20.2.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.2.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.2.bb
index b0746c087a..edc2ece979 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.2.bb
@@ -14,7 +14,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "42035145e29983308d2828207bb4ef933ed0407bb587fb3a569738c6a57fdb19"
+SRC_URI[sha256sum] = "b43fb4df94459afbf67ec22003ca58ffadcd19e763f276dca25b64c848adb7bf"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.25.1


