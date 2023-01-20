Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC44C38159
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:11:29 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.82043.1674238266670787536
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:11:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=je5aHgSP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id i65so4615422pfc.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tghfiAKJcmtzLTqC4FGGmF3p0tLgw61VGSkJgL7J0jA=;
        b=je5aHgSPD9cmdsdShdv4sr6c2Vqfy/xBnn15q+jRoe8W7TGQKxFF37syoep6C/k4tf
         HH5BTk2T6Auti+/voARPHi6X610LI+vXVv2T5VaRdpRM3EXGWEVprJRdY1+4hfYIkJv4
         Z6214ozVhmjDNByK7h2/jKzJ25QLY2jFuhlS08uTvN0P7D5ciQNtfUC5/7amat//DDvZ
         +fYNHf3Y3YqcHw4ExQk3yBFf3ditxlAa44mZNUYOQHU23kEIJkUiA2wBAdsbzNlOzT2S
         wCu71ig6ivpLBNvLqKyoxp1BcpHdumT1S5y/A5ly6CQoAiht30XjX7S9mH0fR3L7l+h+
         zRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tghfiAKJcmtzLTqC4FGGmF3p0tLgw61VGSkJgL7J0jA=;
        b=YFujQcYn8hMm/jmY3Vw3OmSdq1wY7HNVstqo+xJ3r5cc2n/DkP39K5aWwODLBIJ47g
         /qhZ6NjiJ+PNtESS1iogzRW2QMt9udAc9TYxua3q7bglPoJ1QLsuj/lhaZG8/u77aXHG
         cS7AeZV9S97EhZ5rVnjS4TTIbcFFjwSP3QsxmSrnJjrehNxVOGc3VAvTIKPK58Tg9WBS
         7KZfc0/8u1O7iut0pRphJ8Dl/PsNVkcCMkjkisdNTcK67gHozwmAZuv90UUESt1sMERu
         XXBaG2zxED5NHrirW6EGBZ0s7q0KFUzSH7Z/Q63mE/zW/8OEX5W8ylET5gSByflYDA65
         gerA==
X-Gm-Message-State: AFqh2koJN0k3/10LvNm0jj47/nzZQngu7koQzXplyHSD3FhUJSiLgO9Y
	di2hhzMVpudzjnAbCudkO/efjf8kZMY6JBeuoEk=
X-Google-Smtp-Source: AMrXdXu+XvuC3ozkQaY16VvjT1zD2GWdZrGz4x95KEP0eNyiDPAZimKzzR1UJowx/pmcRnJa1Sf3tw==
X-Received: by 2002:a62:1c4e:0:b0:587:e40c:59e with SMTP id c75-20020a621c4e000000b00587e40c059emr38272437pfc.18.1674238280208;
        Fri, 20 Jan 2023 10:11:20 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.11.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:11:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 09/41] xwayland: upgrade 22.1.5 -> 22.1.7
Date: Fri, 20 Jan 2023 08:10:26 -1000
Message-Id: <1d9aa525d5f239db27486b4b5fe85417d4d729ee.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:11:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176215

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c37ec8b2d91605d6eb5228f0a447fb83f111edc3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/{xwayland_22.1.5.bb => xwayland_22.1.7.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.5.bb => xwayland_22.1.7.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.7.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_22.1.5.bb
rename to meta/recipes-graphics/xwayland/xwayland_22.1.7.bb
index 51d847a093..dd32bd0111 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.7.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "e317ac1f119f8321654921761420901e4abd95585a8c763ce26af3b045ac1672"
+SRC_URI[sha256sum] = "d53afac6c71953f5cf66d03d289dacd8961da5bd309c1dff125d5955d9db5f76"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.25.1


