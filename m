Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.27404.1603635845007807504
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2020 07:24:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J/zjmvCP;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id n18so9593661wrs.5
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2020 07:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i9hxCs1i3ziLaPacISrn4do7mvvXrINbtK9NLvpNmXs=;
        b=J/zjmvCPyBtGeJaCBo4pOihHz+hJUz3COZO+brLt+syYmi11Y5LWGljotfhbtV8rmp
         ledm8opcApFVgOC33eaP0TOXOl9N+mpngE0aGZ+YIc3lAzuC08XX+viUxygpbrb1MCgJ
         KwbxoKtilBKqob+/71uv1gsbh/GE3+9yqJc2DwUtl5nyajukEECHDIqRcBSnHC4NE4pq
         5eAHxOMUbyFmZetOTTXrjMXBRMHz998sLMiRcGClvRYs35B5kBd0og8S/6P9SVbQZdS1
         8kcYbhMTZwTpI1/OVuwTXr5D8Nzc8EpzdUEYms1nRtn14TpdEnCXGUxS5RXSIBtqZNfW
         6n6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i9hxCs1i3ziLaPacISrn4do7mvvXrINbtK9NLvpNmXs=;
        b=NV8azLYdr0ry0U9zJY5E1HTeHXSdFxuTtEtzqTncmZt1dQwBgQBrmC/cMONJtvUt6l
         LiD4fNCtUrbIySyrhQmTRDKCDmQXWivLH0wvZOxlcr6esqzbSF+6u1UmCR8mz32f165R
         IYVK1grhYEyvxeOP9Sj2Sm6GGemWRNRC+5z9HpOM4+YH1S20OSEie0ELnUAuTrVLHG+W
         TkJf3+wiWxCCIf0kWWRcJEIT4mHDj9XRvJ0S8M1rYao5Xvmyh3jRsZfzdqLvfZVHk470
         O8Ea4HGocdk9HaxWk2TgWLitFqFSlfUyfHt030we9ZeODMiwCxAyfAaBfYDzHcZlQXCf
         bO8g==
X-Gm-Message-State: AOAM532DqQSx9RkXzupGJvp0yeO9+qhGZbKAqCf9zUD2ORLnUAGtP+yR
	HcqdF0TgkM+wA/HGIBkNxSeeAYhRlRTb+Q==
X-Google-Smtp-Source: ABdhPJxH76ubLXxWVHQTBdvWelgcTgTXXO7x3EbAk82UEmY9V0w0jgN5RsMDVGPJRE4EMcmIpoOG2A==
X-Received: by 2002:a5d:6341:: with SMTP id b1mr12785139wrw.373.1603635843299;
        Sun, 25 Oct 2020 07:24:03 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id f14sm18041731wrr.80.2020.10.25.07.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 07:24:02 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH][dunfell 08/12] gstreamer1.0-vaapi: Update 1.16.2 -> Update 1.16.3
Date: Sun, 25 Oct 2020 14:23:49 +0000
Message-Id: <20201025142353.1929717-8-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201025142353.1929717-1-quaresma.jose@gmail.com>
References: <20201025142353.1929717-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...reamer1.0-vaapi_1.16.2.bb => gstreamer1.0-vaapi_1.16.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.16.2.bb => gstreamer1.0-vaapi_1.16.3.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.3.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.3.bb
index 1bedf25128..9d9b1b8757 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.3.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.x
            file://0001-vaapsink-downgrade-to-marginal.patch \
            "
 
-SRC_URI[md5sum] = "13f7cb6a64bde24e67f563377487dcce"
-SRC_URI[sha256sum] = "191de7b0ab64a85dd0875c990721e7be95518f60e2a9106beca162004ed7c601"
+SRC_URI[md5sum] = "8c9b5a4d20afc04bc5e1536e81511f27"
+SRC_URI[sha256sum] = "77200b3c183fe97cd987deb5544e615873cff5e98ec87573583771e5f1fb9ebe"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.29.0

