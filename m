Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41BD2CD98D6
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:04:11 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105054.1781424250686206179
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:04:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BMKc4D0t;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490be03d47bso23102135e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424249; x=1782029049; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dRU639LbDz5Vo47zFhMjPSa6xIHrgJ3u7mXUiaTNfeA=;
        b=BMKc4D0tuR1EhT/RJKfD1bq3oUO6RuNMXJVIF2mB1tBjPZWOLq7FtswgYoPb9+s8Wm
         cP7/neJmJAwFCgj8Ch1ZtqUI9kRBiYYdy9127tpbtr4ofe9h4suMUcGz6gt06igF4RsI
         oCbOUPV4MgFSF4gK7LyMj24tHLab8RUOimQoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424249; x=1782029049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dRU639LbDz5Vo47zFhMjPSa6xIHrgJ3u7mXUiaTNfeA=;
        b=M9Jhrfr8Nozkkob2Gsld1qbU5YCf6M1UFMI4hD+vc1G6pgDa0okTIj+HZecMgz0qQP
         72KvC6F3GW/sNwgWhJRcd6WYqjVl6cYB3QTVLAU17rGv3ubNeUCNo+kpZ0rktLMt31Wc
         DlbuasrkDZUv28M2zChuUxe+G7MhBCqMQI2sD426OKWlvh/fh+HpJVIyV74tsLhnP74D
         UjccWXZ3qsF/HTa2Ofm+D8PF/vNIOw3YCIN0Hz25dwoNltP8N35yOuph5dhC9SjXsZAO
         abqcC2eAK+f3P4Vqg2IEYHSa0GSmZy+sxpUcv4lF+Ga5aaxNLvmFUdB+c4Bq9Qb5S6+I
         u6aQ==
X-Gm-Message-State: AOJu0YzfJ0OVCL0jhn3LAtRHfpX6BbmfVE3Eh8yVl2dq2NwB0vkO30i7
	eE5FdyhX6t6DduaKox6R3kWcIydti523PxjvR34nkwGaLV5/Z13B7kcIOFN2NbHGjqK4P/i1Pc0
	pUrX9
X-Gm-Gg: Acq92OFpvCB4RO1bJ9eOCqvCU46HOJAdldcsZ85mJ/OYh3CNslX0VVZmPCS/QyW76vW
	BiZpU4ZTds+T/cV3lKnIHlQ9XK90/HcNVXhaio5al9wiZcMbbop7xL5qanXtMHs72PJ5tOtZBla
	Z0H7N5lMvXOJaxvUr2ikuwo8NhtcXcE4hTkkV/RSE+pewAjJhXmW7u3tI9vQAtg0i2SqAjqSJYA
	xAgA6iaKIcDyCu9AqttkrH3VPEGxOPt+CM+9CXpleDFPIVLeivWUrv8c1eBFLsS4/VF+XelCacq
	98pE3VbXLXpX/vQfF+d1mXmAx47IJL2MnnVbhWMm+z8Cu0Dg9fxZN9qx+dpxswCti+ussLEXMQA
	ZD3uk/bLxW5r77mv9wDsmQ2k6Al9N/k9eBk4z6Y6tASKAMu7dHy/cHEcYOTbXObRs8w7EqygjFU
	O9foasO0CF9fOpPd2R4iqVWx6BTMw2Yx/F/Vy57uWD3YAgNuqsgnOW
X-Received: by 2002:a05:600c:3512:b0:490:bb45:79da with SMTP id 5b1f17b1804b1-490ec4d650amr120322795e9.13.1781424248893;
        Sun, 14 Jun 2026 01:04:08 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.04.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:04:07 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 38/56] python3-pygobject: upgrade 3.56.2 -> 3.56.3
Date: Sun, 14 Jun 2026 09:02:49 +0100
Message-ID: <20260614080307.4017177-38-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238722

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...{python3-pygobject_3.56.2.bb => python3-pygobject_3.56.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.56.2.bb => python3-pygobject_3.56.3.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.56.2.bb b/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pygobject_3.56.2.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.56.3.bb
index 24a58adee6c..e246a2d451b 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.56.2.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.56.3.bb
@@ -19,7 +19,7 @@ DEPENDS += "python3 glib-2.0"
 GNOME_COMPRESS_TYPE = "gz"
 GNOMEBN = "pygobject"
 
-SRC_URI[archive.sha256sum] = "b816098969544081de9eecedb94ad6ac59c77e4d571fe7051f18bebcec074313"
+SRC_URI[archive.sha256sum] = "12760e4a0e3d04b6eb95e06f7a27e362c826d567ea613373a92c003b6c70d2d6"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 

