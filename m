Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30987.1795560753322669229
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=FPiPO+0c;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48dee593f18so4795443f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560751; x=1796165551; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=V4qhzU+pWMKCBuaQUbLuGT0oU0qHdQeGVm2dZmP33Ck=;
        b=FPiPO+0c4tz2oX+ZxESObXpWrYIfTRUqXK7v6C9u8I7XPBGh8RMXIEGglb/Igtc3bw
         9DphLFVPVlIzcYHeSp8932/FLNxmguRJyuZl/TcoSe3EKzg/Hwi1Mfmwzxh+F+FnIaKt
         ZwhOgrLRbpknQY7w983y/4RvCgw2Qk+41TmgxpFLwNY8ykBUthIkSOb8QbdiPKUIHX2x
         IFskLl3gm4w6+DB0d5T0L7kI+7hnhDrHQfZs4hQ2Kx3XSDH0bUPfS5dSzhgV5cc8iiRM
         DMGCrHYhzN5c5BiUj9FxS+RikY20xi08/zfrHCCtwx8MEqKw/pcwFgXvEOxA9VD6B67Z
         FICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560751; x=1796165551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=V4qhzU+pWMKCBuaQUbLuGT0oU0qHdQeGVm2dZmP33Ck=;
        b=szMdt/9mi7/RBFwYLPP0ExWm18/82XDvjUHSU11aC2ktIV7pdnt+Se/xOfcHNaQokd
         ymnJq2RfbrZK0AfoWe64kJBnW8vUoGBl5KnrtcJGdGDfe60+SK/ioAaZ0adoX0qltOy5
         9VD5MoigbYTaERs9j37M2vxrBcVfcmuPLmSYbxFlhGQg+3XJrFeayodI2vvCnNTM0bO+
         LdiKmuSNuoGAgxF2ZDU4ZnDoSzw6cMjkWuPOTHUYO+weChDrKcONDixPZGWXFqH+mT2t
         tNW183pluNOoSTlNw04OTm+TTsj0wN18GzHfC2bw3YESiGZWL7b12VcqO0S+qe0kSA7M
         1QDg==
X-Gm-Message-State: APuU4Z9RPJ3pWsri/wZit5cbUjrboaJZwG0LK1GMGlNx0ZkJSZ/nBR/5
	H4eEOl3Q4jjuTaRfmuWUCuv9bKPhfeAEwAZ0/ZclzEBnStDsqgOV2JUSNJ14yU7KWL0lDzNPOIY
	bOMA2e2o=
X-Gm-Gg: AZFdTZcWLYeVuZrsKivCvFT+cFqd4Zp+fPkcTn8TF7NAyuRwiTzXwErbkoJpSpKgxaQ
	tiuohJOlc+Vdj93c6U7bqFv27Gn0KDE4GyguiZ1AvVdjhThgx9EdtnzNfeyuQ5CQBYKiZuPtH0l
	DtWyh6eEdDPYdb4c+2Ue9NAI3h9AKf+BbZmoEoRDo17XVQHMWB8brnqKpj5/+PVGgJZ0MKeCvLb
	Xn227aI183cfi+r4pMfrbYSD4hhLYL34B47YRiU50Nm0vVEEYjsFTjm//HIOM9HsKrRvgQ5ay5q
	XH016HC8X/B1ay6xfiVqsq5MuhMf60ajuLq/K9pgrNDxY3nvIQ3Cj42lzv1AEJfxObw/wXmMpib
	A2IqcTrBb+vhbbjzdikGeLJOPeISQ6STf6j3bT6UlW5CME0MewLNFp9GWm+4nqgjB1vvKqNtuU/
	Nu+PjehiawmP45F6WmOBnxbefrC2OWucJT2uaF3aZd4G8UOLONrQksiyPu2hNBArtg5v8yakNuv
	a9xFw12PjgnMW19e5FSbBdWIQ/B3pcMg5PyjNKqF8ySax3FOISqFgsrYUFpHBFjnQqilih9QqS5
	luIU/EnYGWnQwwu7UcFmLIv1/2y4dx5sNn3RdEK67Ey14IRjMJ/X6dLYJE0gNwQvNzwxtCM4dWD
	GACAuRx16RqJx0E3rVTVofESZ1XdL
X-Received: by 2002:a05:6000:4617:b0:48b:9d2:1a6a with SMTP id ffacd0b85a97d-4abab5ea335mr32184708f8f.1.1795560751590;
        Tue, 24 Nov 2026 14:52:31 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm30462488f8f.52.2026.11.24.14.52.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:31 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 21/21] python3-certifi: correct license to MPL-2.0
Date: Tue, 24 Nov 2026 23:51:28 +0100
Message-ID: <28fa337f9075c8f991441e713cbf5a56d66737af.1795560335.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560335.git.yoann.congal@smile.fr>
References: <cover.1795560335.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251101
Content-Type: text/plain; charset="utf-8"

From: Anders Heimer <anders.heimer@est.tech>

Correct the LICENSE variable to match upstreams MPL 2.0.
The LICENSE file and checksum remain the same.

License-Update: Change declared license from ISC to MPL 2.0

Reviewed-by: Henrik Nilsson <henrik.b.nilsson@est.tech>
Signed-off-by: Anders Heimer <anders.heimer@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6b270958cab94f1fa117b5eee36157cf5b14d3cf)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-certifi_2026.10.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb b/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb
index 02cdbe9a08b..e65e5ede605 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb
@@ -4,7 +4,7 @@ Python code. This is useful for verifying HTTP requests, for example.  This is t
 which ships with the Requests codebase, and is derived from Mozilla Firefox's canonical set."
 HOMEPAGE = "http://certifi.io/"
 
-LICENSE = "ISC"
+LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
 SRC_URI[sha256sum] = "035c1e85572b141bf1c3a3eff0e33a8eb74917522f2559075ff8d2fea780a1ae"
