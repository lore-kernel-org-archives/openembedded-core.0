Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0274C43217
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:18:11 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.16540.1667744289670879544
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:18:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Pq6oxcdy;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so7403061pjs.4
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vvObUq0QM+K0D5X0GV09/pIUA5xYtcWtj/jProEBPkw=;
        b=Pq6oxcdyV1duhK8aBqwrXAzibpLKBUJNGAjKmvhhp3cr7HdjMbrXuWLTaRQsRfttKu
         z/dmYGzSlmdqGFvlXlDlW+YrZss9hLnI6blsiMAUdhb54DDiO29ip/ttvOnieAnhgYTG
         h2AtjZTk5xtpcDJiffS5DMKnEh97TpR/1T1jMBmkUyitaZWLoycaIHqgAxTKDvlPicca
         LYfIzlPJqUlxqwJ2VrOUrM4eQ4VIuZt54gKvSYhBXjN5Tg7Lpfiwz2rouL9cy8deJ9yj
         M6XVE3jiNTKHm7RQ3Jxf+OMHP7Z5jJbnraSyQFRZhf7UgwH+mk6/A0lX67gcemYgjBBT
         hLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vvObUq0QM+K0D5X0GV09/pIUA5xYtcWtj/jProEBPkw=;
        b=ytd2CaraF0F9HBfLvSGeXDhTyCZYKPsppGI1HY+35Roqmdeh+Pb2lDvdlTZXksH60r
         fjO/sID/8OOeTpHmwT52CH/lS7nq8NXGtj8by0b8P4QuZ8F2nvVeXBbUZrlYHoV5OG99
         KDUzFvKBLpROzUyc6MUNLcwHJElMiais7a/hwImWBuwoauKmTWQF04fM37H8BVkH65mb
         /NpNyv9IsaXop4B4x4dmTQ7d0ikBu33ouq3vpuTr+7o1wRD7ecMJp+FhEBUK0rc/BJbT
         jCqYd2uG1MCMn1bqdAa1nVvWiepxnaBnET4HlFKthBYsc9KwlpSh2nKLi5eULvcKcxV1
         FNtw==
X-Gm-Message-State: ACrzQf3y8va6QdPoTNvKQnc6WyXlD3nM+zAeZdn3veYPju4wYSBigZJc
	T3YJ8+AX/+JSY+SPbvZn6CTtQhqwv/RKSKxZ
X-Google-Smtp-Source: AMsMyM48buF764A3JJcs/+75COOZlP+A+4agLJt7UJBqPD2ZmPI15B2ag948qibZo2iOVL//g9KXog==
X-Received: by 2002:a17:90b:268d:b0:214:220:ecfd with SMTP id pl13-20020a17090b268d00b002140220ecfdmr31740917pjb.63.1667744288832;
        Sun, 06 Nov 2022 06:18:08 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.18.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:18:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 19/34] xserver-xorg: move some recommended dependencies in required
Date: Sun,  6 Nov 2022 04:17:02 -1000
Message-Id: <c017175deed298f7fb3fff9181eb4379fcc436d7.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:18:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172787

From: Thomas Perrot <thomas.perrot@bootlin.com>

Otherwise, xserver will no longer start when NO_RECOMMENDATIONS = “1”,
because dependencies in XSERVER_RRECOMMENDS are missing.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit bc7bd3953f3896af0db036250cda34bc9ecbb3ac)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index dd741270a7..ecb164ddf7 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -82,9 +82,9 @@ PACKAGES =+ "${PN}-sdl \
 SUMMARY:xf86-video-modesetting = "X.Org X server -- modesetting display driver"
 INSANE_SKIP:${MLPREFIX}xf86-video-modesetting = "xorg-driver-abi"
 
-XSERVER_RRECOMMENDS = "xkeyboard-config rgb xserver-xf86-config xkbcomp xf86-input-libinput"
-RRECOMMENDS:${PN} += "${XSERVER_RRECOMMENDS}"
-RRECOMMENDS:${PN}-xwayland += "${XSERVER_RRECOMMENDS}"
+XSERVER_RDEPENDS = "xkeyboard-config rgb xserver-xf86-config xkbcomp xf86-input-libinput"
+RDEPENDS:${PN} += "${XSERVER_RDEPENDS}"
+RDEPENDS:${PN}-xwayland += "${XSERVER_RDEPENDS}"
 RDEPENDS:${PN}-xvfb += "xkeyboard-config"
 RDEPENDS:${PN}-module-exa = "${PN} (= ${EXTENDPKGV})"
 
-- 
2.25.1


