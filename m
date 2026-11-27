Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1529.1795801776917061748
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Z8XfZ1f9;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so67413775e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801775; x=1796406575; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+yFtZ7f/8nUbxETlaiRZgIzl5UgTriJG572+eceFqcc=;
        b=Z8XfZ1f99X6nuIyVinUWDy7W5itca0IuHU1GoSytGxxv+OXGfHci0yOY+5YLsyk5zZ
         MkuDLGm8GMh2mZkKU7uKkY0W8VHpod9Qr9T316ANHyjTx8AOEvwylQ0BeSVDN+P2uNto
         pMh0r1xKUILQi9USAt9P7/wYA7pELFlgn/ZlGDgQdvFXf0/TLLkRvaCjGrLHB+OE08iA
         bleDBur5phX+SCYgfDD/gthhU7tTL+V47Rz95JMXfXQskOvlsNU18qAraTumcUQfcn30
         xTx+Jsz+cl2zr4ixMoTETYY2qXrGABkANYTPGbNwDuo04fZEavur+yX8Yqg4W3RI8E7h
         c1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801775; x=1796406575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+yFtZ7f/8nUbxETlaiRZgIzl5UgTriJG572+eceFqcc=;
        b=IxYEc9IEnOEzTzXBNY/3KTzt+jbblyofrBylB4zuH/8A3ayJAz5x0jMPIjuv8V+SkT
         3txfThM9CUXZqsKaLdTN60VPFTUj/N8B+wJ91Zprs3mfikz4hCD2wGPINoeA6+kcvp38
         EBCz1kS6qwYGHOE/trhHZg/nQgF8cE77FJOWgr9Ybjx3oQgoC8y6vKCDa8dSR73k0ynK
         P+Wh9igmFmZ97es5PD3U8JoaxRXq7lJk6ibCQHYfhQTx7xRiaO58AbIxeALceVT12GpN
         9V1NQGC0OW0GNG8MIit88Av8Ji+1EvDZEZx0qxEfCq7ahlUH0LFS9DrCF8z06i70uyml
         qdfw==
X-Gm-Message-State: APuU4Z/kn+9WoI5eIm7QQltRWI27JINmfpng53sV/KRLFm6oweNVlEM0
	5O8ABDDyG95joHwetISYPk23OCIIMKeg5kTgfxczq0meQQ3tiL5OdMy4qlAbo32a+5M/rXL2d9I
	OXKj6/CY=
X-Gm-Gg: AZFdTZdkN9eaXhq+xIgq7/M5c2GF5CTy+C1LhTILVWAVmpxh9vWVyKFuh3DbmPW6zkI
	mW0llke9V6wLSuQEZJZo1+OF1HsqERbdu6VY9IQ0y0fzknWizFzTGHPZLzrXAwSXP0lw7GsQndv
	l4IzEscLyGezS7EwfroCghrAUj6FWkEGLrr/LNaTUiGoqg7IpACp4EqWy5PoMMLhZtozl0M3Cem
	2aoOZPRcyzDEru4U4b8MbiWhfZST4r/+N+WPxg5gPh3DwW7CUC7lBGStJnoueaeLx6LulpD3GGQ
	KWXqWyl4Z9N8L7uVHQm+i7/llr2CbngmlFwVstD98DZOZ1JL2RXXebqK3uhrlgSioTfBEzzdODA
	DatGmEdmcSL4Q0MCHSQi0Z4WhJQp7FUverf2DJtsn/hUkyJCosGWU4vOtWwzyPiMiMQ8cjoKCT/
	w2tCtkrtaouTPAuKV6PI1Rpv4oBi7OUiApWWYQMuKJOkhWpctCPC57mVeVACLehJMWfWgRuliP9
	/3aG+iULTf5Apy7iXLzOemO1llxcjQ9J9S4pctVzGISctb8ksGzOeBizwwILfs0Ub474I7UUt8x
	sxsN7fRI7aWWD733/JFo2uDmYfsbxySXpppMxxaKP9foFnbvyg3V62cW7wFeL+de6dH4hQoUcp0
	CnQCWCLCgQUn5Cwev5DmD0Q3JHmiLKQ==
X-Received: by 2002:a7b:cbc8:0:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4bb860f6ae9mr423649445e9.2.1795801774996;
        Fri, 27 Nov 2026 09:49:34 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:34 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/37] boost: patch CVE-2023-34399
Date: Fri, 27 Nov 2026 18:48:45 +0100
Message-ID: <f4e4d2136a547e020c11c96250f13834e2ac21cc.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251408
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ba56fd3e9258e2351c31a402d63ac470d43c8d54)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../boost/boost/CVE-2023-34399.patch          | 35 +++++++++++++++++++
 meta/recipes-support/boost/boost_1.84.0.bb    |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/CVE-2023-34399.patch

diff --git a/meta/recipes-support/boost/boost/CVE-2023-34399.patch b/meta/recipes-support/boost/boost/CVE-2023-34399.patch
new file mode 100644
index 00000000000..f2dbccd67e9
--- /dev/null
+++ b/meta/recipes-support/boost/boost/CVE-2023-34399.patch
@@ -0,0 +1,35 @@
+From d772add4873bb2501d67554190c4272294d659f9 Mon Sep 17 00:00:00 2001
+From: Johnathan <39648915+TrebledJ@users.noreply.github.com>
+Date: Wed, 19 Aug 2026 16:50:08 +0200
+Subject: [PATCH] Reject a negative class id when loading a pointer (#332)
+
+A pointer carries the class id of what it points at, and a null pointer
+carries -1.  On the way back in, only -1 was recognised as the null tag,
+and the id then indexed the class table with an upper bound check but no
+lower bound one, so an archive carrying any other negative id read that
+table at an offset of its own choosing.  This is CVE-2023-34399.
+
+Treat every negative id as the null tag.  No archive a released version
+ever wrote carries one other than -1, so nothing that used to load stops
+loading.
+
+CVE: CVE-2023-34399
+Upstream-Status: Backport [https://github.com/boostorg/serialization/commit/d772add4873bb2501d67554190c4272294d659f9]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libs/serialization/src/basic_iarchive.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libs/serialization/src/basic_iarchive.cpp b/libs/serialization/src/basic_iarchive.cpp
+index 1c6eb2047..b5c63c9ad 100644
+--- a/libs/serialization/src/basic_iarchive.cpp
++++ b/libs/serialization/src/basic_iarchive.cpp
+@@ -427,7 +427,7 @@ basic_iarchive_impl::load_pointer(
+     class_id_type cid;
+     load(ar, cid);
+ 
+-    if(BOOST_SERIALIZATION_NULL_POINTER_TAG == cid){
++    if(/* BOOST_SERIALIZATION_NULL_POINTER_TAG */ cid < 0){
+         t = NULL;
+         return bpis_ptr;
+     }
diff --git a/meta/recipes-support/boost/boost_1.84.0.bb b/meta/recipes-support/boost/boost_1.84.0.bb
index 4b580d078be..c66f182384d 100644
--- a/meta/recipes-support/boost/boost_1.84.0.bb
+++ b/meta/recipes-support/boost/boost_1.84.0.bb
@@ -4,4 +4,5 @@ require boost.inc
 SRC_URI += "file://boost-math-disable-pch-for-gcc.patch \
            file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
            file://0001-dont-setup-compiler-flags-m32-m64.patch \
+           file://CVE-2023-34399.patch \
            "
