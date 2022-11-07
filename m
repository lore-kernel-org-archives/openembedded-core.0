Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23783C4167B
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 15:38:09 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web12.91.1667835449411591469
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 07:37:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=gQQqSkKB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id u6so11370382plq.12
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 07:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FI4ousira/hdE6bdX7eytGkUYwT2L44aq+EjZy2cC7c=;
        b=gQQqSkKBVU+elvLWSfKrtgp6zbk0uB8W5a7p0WbMbBYPShKXZVrJa/jEreQ5plEJNm
         TI06ISy/kRQk4CjBZkd9pl4CNUYKObcRXMm+xGQjQSLAsajd9D9VoAL7QPbjujq2nGKZ
         /wKrGHsKv4Pf3OUbnRfuGk3cOa3vDUJs/Rd/cZ0o82HbZ8MpNkkhUH7JgeLPjjDRm1na
         VjNvHp+j1Z3veSbfXL4F40TqYyNR0aWVmOHCEWtl8uAxZRLEKv/Bz3TK4etRyo7jaqQS
         KfV+8EAtBkagaHsJRYJSNbiQQThqgckgcuZMi1wclCVoyFYVRBZqjkceVqesdOP674ji
         yq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FI4ousira/hdE6bdX7eytGkUYwT2L44aq+EjZy2cC7c=;
        b=Nbs6b14hy38A4frJA8jlSSCjWFxjuJWkPXerNh6+ldarzmmMDT2msewTaJ647OnQtw
         aR8X0h1O8LMHKug9DNxg69wceZ2huipWCo1Vgkwf3p0WnYS6RXkEHDeyZhFpNhc7WmNe
         7PIIuIo0sqhXCEwUch13pfKI+vECcVzx5zDq/dV/rrb3g3C3iPtomJM4vs7LHRNEldT/
         u4LMGfIZbHZIqHMQbXI6FQmlUSDX1KMwW11wDU268Ep04T1h0giq1r3/q9iZBIezcFz8
         dO9qlQteL4Uc6EoN66n/NJRVGyINKhDDEPEExX59HEh5dmgozs/j3NRTO6KoBzr0gfje
         hCpQ==
X-Gm-Message-State: ACrzQf3KoNJS9Ek31c3+Aeo36d22+cN2m9Pn1/7ZZIBGl7LIaDtzY+Ud
	K6rZ2Xt35GE5xkZ0Tsqt9MqB7fxwwXwFW0cv
X-Google-Smtp-Source: AMsMyM61fKA3QLzh056l1ugGypDEWmfr2KyMMVwziQpkFRQinWx2R9pAHN/gR8h3XuiLzkUmU3x9gQ==
X-Received: by 2002:a17:902:9a41:b0:188:50c2:89cf with SMTP id x1-20020a1709029a4100b0018850c289cfmr26054645plv.34.1667835448417;
        Mon, 07 Nov 2022 07:37:28 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id v2-20020aa799c2000000b00561dcfa700asm4628627pfi.107.2022.11.07.07.37.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 07:37:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/25] xserver-xorg: move some recommended dependencies in required
Date: Mon,  7 Nov 2022 05:36:36 -1000
Message-Id: <a3607a035b4c9ab89232ccb1d0361791e5892b34.1667834972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667834972.git.steve@sakoman.com>
References: <cover.1667834972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 15:38:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172916

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
index 057a1ba6ad..6b11c79be6 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -80,9 +80,9 @@ PACKAGES =+ "${PN}-sdl \
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


