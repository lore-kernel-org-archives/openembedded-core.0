Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.20446.1594649861156195057
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2020 07:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=FCs+l4Le;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id b92so6316266pjc.4
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2020 07:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=hJ0HUTqEercMOIEPZe2A277BhpYVjc963lqj7wF8S2A=;
        b=FCs+l4LeiN95RnsTApWeiCaonVldpAsFCTTXerAVzWkh6nmd47K82VcAKVezea6zHM
         CK35vhXyGNEnsBtzSfF0H46OfDEv9+J2UQLjYhm3D1m0MNGhZXgLzvsMgfCg6rzidsbO
         8JpJyVHET1PHzpQgbI6d8VmyXK+julMnRIJ0wguh7LJDA6rJaXFjZyolaKasNtj79iyo
         IcrCwNMgQ7FH3QH/Cl3t/dCXHin2p+KP8V7DbFskKf+VqC0n3oO3dlD6vQ+TayUH+M5F
         8e91EwcQbZqIkJqgwn+ts+hiINSJ+U0QMSEPvhHHfF7Wg37nePeENUqpJyqOhNMT9TiM
         p0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=hJ0HUTqEercMOIEPZe2A277BhpYVjc963lqj7wF8S2A=;
        b=iiGOjHSvrI0bFJoth3p+qJm8AKap1uHf/xFl8VudNse0H+I7kDZ2QjvEs8ye5roY4Z
         A43V7VrEAa1Cj6wHMLia0d1nnY46ZI19P66FKVt9tOV1N2++vj2WQ0LfSFByRQqbmvBr
         1A9KsNPuyUEo2uKRD+tSL6s8+3GzGolvQSTz6hKUGftwCIrw2GU0B9XL+L32VKV5TavN
         pSAqMxaTz8qNMSP01EKZwi/+ZH8ksF5CujgE81adVUmgFRIMNT8XJHSO2uqxhTlC8Tv9
         CtZS0Rn+QYboStTUmP8rhePt2K38KgJbEeOrUcPncE+xFOXds8aCtZz7yYjkLWNAi65Q
         ufBg==
X-Gm-Message-State: AOAM532tiouM/4APIxY+9STrkX/18E6mV0C1qD7qeGCAPHC2jstfeKhR
	7uoFgUNfCUvhogjtSLYQW/vk0o+6tZNLqQ==
X-Google-Smtp-Source: ABdhPJyMmV/gutcPSxmZv1E25tYcbDUtZox0wFL3jC3LW51B9cctAZPIuUIJhC2hdhHQM/0RoVf3tA==
X-Received: by 2002:a17:902:d90e:: with SMTP id c14mr11990703plz.335.1594649860302;
        Mon, 13 Jul 2020 07:17:40 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k7sm13723738pgh.46.2020.07.13.07.17.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:17:39 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/15] systemd: remove kernel-install from base pkg
Date: Mon, 13 Jul 2020 04:16:57 -1000
Message-Id: <536f9d976586297e05a8ad7621b5f7af62f8de5c.1594649587.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594649587.git.steve@sakoman.com>
References: <cover.1594649587.git.steve@sakoman.com>

From: Konrad Weihmann <kweihmann@outlook.com>

as this is already packaged in kernel-install package,
it shouldn't be part of the base package

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ed04241f30e12e7c0479026a9e354e49dfa4119c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd_244.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index 341ac6bbc5..c52a01b2dd 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -536,7 +536,6 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${bindir}/resolvectl \
                 ${bindir}/timedatectl \
                 ${bindir}/bootctl \
-                ${bindir}/kernel-install \
                 ${exec_prefix}/lib/tmpfiles.d/*.conf \
                 ${exec_prefix}/lib/systemd \
                 ${exec_prefix}/lib/modules-load.d \
-- 
2.17.1

