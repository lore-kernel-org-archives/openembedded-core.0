Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 228AB7C7A3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2019 18:19:04 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id v18so6914185ljh.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2019 11:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=MXc9bFkL47NH9OSf8xnh2OBY43UngO81ud/dAKOJwGM=;
	b=QB5iyIzJCDcuVLoLmGsqqkQQzQJEuDXwWg3BISkH56AJG3rPZ54WUkVuBZKP3jheEz
	yGm8/MQrK3A5Ft/3LPiFpeQc2V9QyKPMkyIofBRjEWNypbRc4TH2T2eAEw/1cAE03YqG
	bRV14kB/HQKArUP8TSQO5+SSG8OP+a+zcRZ1/sm4y/2y7XqDBHKO4Y5ZvWQr7ik5jSKq
	F1ud56tjB2eumSdc2RrWm0MzhybpdnYw06adDzJqCgOahoYvuycgvokvZuKGB8PztrD0
	EP7kNyswcW59oGjTbUnNyJkGtukXu4D2tOVzxjiei2hwvcPvPAq/Nid/BAvk9mOm32qt
	yWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MXc9bFkL47NH9OSf8xnh2OBY43UngO81ud/dAKOJwGM=;
	b=fstxvYtu5B+IoOPgCIBrXSaeIKzrz5E1Nj7uAd8LNner+SyDYPiTTISSUqFv8wgZVs
	kz7RygoYGjgJRho33ufKOHP+f0aR0aJDoyPnVjBS81bwQy58wMJ07zJeTnV54LW6xoxI
	kvaS194AifdGfou/QUtvy7sAVKOvNLoEFbxK8TszirxBgVjuVLBZ6Sbdj7F+KjaKmDcr
	Cj9bZv10bw2qdCTtFOejnz4tR4xjY+1hhmbTDc8Rnlkx8llT3rXN39fvfpHnjjVLaxuG
	avUrOWHDqWv6SzA4aKIZY/ci7LSFjq5IMYjtXSGeOezja/rqtq4jQAJXB3z6WociMrnJ
	kzDw==
X-Gm-Message-State: APjAAAVBD0Xn0g344G+CgWq9XtQBjRdu0uRzpMuqrUk5ePIwOOZptSCS
	oAYfC3mL5B4Z7i6yhQ1uUPGUhxWfdFE=
X-Google-Smtp-Source: APXvYqwCjifQ5LKaPsCm9PstD9FQImgO7aI8ycEhDSXzYPOnVIMDrsOd9XeOWLXyY6FInWNuc2oWnw==
X-Received: by 2002:a2e:6e0c:: with SMTP id j12mr25282824ljc.123.1562264344913;
	Thu, 04 Jul 2019 11:19:04 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id 189sm1121151lfa.0.2019.07.04.11.19.03
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 04 Jul 2019 11:19:04 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jul 2019 20:18:58 +0200
Message-Id: <20190704181858.10667-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libdrm: update to 2.4.99
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Jul 2019 18:19:05 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../drm/{libdrm_2.4.98.bb => libdrm_2.4.99.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.98.bb => libdrm_2.4.99.bb} (95%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.98.bb b/meta/recipes-graphics/drm/libdrm_2.4.99.bb
similarity index 95%
rename from meta/recipes-graphics/drm/libdrm_2.4.98.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.99.bb
index bed542ba05..3cb30a4173 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.98.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.99.bb
@@ -12,8 +12,8 @@ DEPENDS = "libpthread-stubs"
 
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://musl-ioctl.patch"
-SRC_URI[md5sum] = "1320b43c4bdb8846c308ec2610b62b64"
-SRC_URI[sha256sum] = "8be0edccaca3abde8b6bb1431b46354c7fab46e9b91cc6946ba65b51f56f1894"
+SRC_URI[md5sum] = "72539626815b35159a63d45bc4c14ee6"
+SRC_URI[sha256sum] = "4dbf539c7ed25dbb2055090b77ab87508fc46be39a9379d15fed4b5517e1da5e"
 
 inherit meson pkgconfig manpages
 
-- 
2.17.1


