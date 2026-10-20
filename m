Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4740.1792538582994444686
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 16:23:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20251104.gappssmtp.com header.s=20251104 header.b=KynkHlqD;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso65625f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 16:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20251104.gappssmtp.com; s=20251104; t=1792538581; x=1793143381; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uFmmA6h+J205ImWZoXQcGmU9Q0Fr0asVSi0VqiAJBfQ=;
        b=KynkHlqDxf24Ld4UI4mvxat+qktX7FmCsc5P3iC5p1UlrAPQApjbVcYShDBs/7bzXp
         oOpKZNUjRhvCcgi0gSqN1U8c4LsQ8+Jt1DSK15ejWNYxKPqdlZrElw9gpPJ5uGreBmlC
         q0FoyNjlsie1IgqUErUaoW/WOBMtWDh131ELdrfVcqnsxd095dF2PMsT4m5ZQ8vhJArh
         KQU9OVT4CfkHcLRQS6mT3uy1DGe12MOGsEhiXj4satbr84Ybq9z6pZ+eWTrNOrA4i6rW
         9oT+hbue3AbPvfpcrvlFxg8DbVkXjMpr7dT6GDthyPgMfP5MtE0ml/v3/Z3Dy/RFUjjF
         8CSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538581; x=1793143381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uFmmA6h+J205ImWZoXQcGmU9Q0Fr0asVSi0VqiAJBfQ=;
        b=Jvy6hR1g2kdNgOSQWYP+yunGmGMcdmYs1f0Qsi1CWyw9nW7e90svK/O9xGsKzbZF0f
         jevdLUZm8qgKyNSrLlpKSt0WW06mwN2qCq6H0GDKuqvzIp2JoLko0ir2tY7yHQxyzcp2
         U9MgWw2SHauww/UZzwlzX0TC1eqlUgMgHJS+OvoJ3ErNQZdieMO8agfBa5YHUKQZZb7E
         dW/emJM001OkxiOH4YOsAmpB5KFe2hGgnhNauLm5Ma4DybUnMwlv/YhrB2+8Z3N2tVOf
         R0+H2u4JRnyWZUuyChW5YLhbOjlf2zIh04BLe1px0SnNq+DOS+dwLoqQL+bnlvAy7hov
         V0Qw==
X-Gm-Message-State: AFq9FYIlupkwCfRvQrnyolgxSwrGcu9fQGdelAKm6hwax6GOpbxsWrMj
	ENdzFqJJee6RLlkPpm/P6snOsYcFjOGlcAxB7UwqkO7Hkp3yqTo/tybovZjNynX5ZvdEOB1dwkI
	Goa2cQu0=
X-Gm-Gg: AYBFou15hSpcM/PAOZal3DOSOq7IBNuo/c+Zc12AueuqLhG0j2kkSwyfbQcC6mKQeLa
	WjgVPCxXmZzk/hU1dwoj8tGuh+nJTQKyft7BNYk2UUCJ6bTUGxjCbCNmNDZ6RDGD7wojx6I5HR+
	2DLTeps07TyP+7wnD2FOt5r5dWtc2Vx56JtLJGvKQ9vmrwJJZ3YIDP0K1iO8LjBaDtP/HIdVls5
	REmQ00EVE5xAouyEeoGsHuV+SR0wU3TFq5de8xSx0sxzmHHVb84JBIwP3e+q2hxMH6IJYTieX2F
	yCNoe/v/CJn4aq7bWR55kf/X2eouNEbMrO+qHD7TynSi5ZUONIKh0iLn8jJIqwVNFLQIMgaQhqK
	Qdo880CTEVjdwvY6Y92JyLpuffMO/WcU6JlZZNlSrpjMRnPcmb3PN/rjMKrTP0DyD0Agzg5lch0
	ppkYc6sq9jCM2BB1wVYk+hyVlRD8sIWntvJSAIv6FQeghwVSL7IkhxCPSnMUTUFBs+YRSr1c1k5
	v68SWlCgDnCeCUzQ6Bt9vnTsWKHaXoK3sKLZAgnc6xgxAhDdnlMHaJygedJDDeY3oA5K3loyQ==
X-Received: by 2002:a05:6000:2c05:b0:48e:2406:57d0 with SMTP id ffacd0b85a97d-48e2649d9d0mr310877f8f.19.1792538581222;
        Tue, 20 Oct 2026 16:23:01 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583523asm1436615f8f.37.2026.10.20.16.23.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:23:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 17/25] barebox: inherit upstream-stable-release-point
Date: Wed, 21 Oct 2026 01:22:27 +0200
Message-ID: <1620b73c239757b638bb34a18ec240bccc1ac721.1792537664.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792537664.git.yoann.congal@smile.fr>
References: <cover.1792537664.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 23:23:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248336
Content-Type: text/plain; charset="utf-8"

From: Lucas Stach <l.stach@pengutronix.de>

Barebox uses a vYYYY.MM.stable versioning scheme, with the stable
releases only carrying bug and security fixes. Thus we can use
the upstream-stable-release-point class to mark those releases as
suitable for inclusion in the oe-core stable series.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dd7a67075c67ccd827242f098c41a12023e1a9ba)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-bsp/barebox/barebox.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/barebox/barebox.bb b/meta/recipes-bsp/barebox/barebox.bb
index a48d97941cc..583fde5d187 100644
--- a/meta/recipes-bsp/barebox/barebox.bb
+++ b/meta/recipes-bsp/barebox/barebox.bb
@@ -6,5 +6,5 @@ Linux kernel driver API for making driver porting easier, \
 and a subset of the POSIX C library for writing more command-line utilities."
 
 require barebox-common.inc
-inherit barebox
+inherit barebox upstream-stable-release-point
 
