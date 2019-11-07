Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id EC1947F30E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 09:09:12 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id h27so1712727pgn.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2019 01:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/kymuUpq9O3v1SgAX8bHyi2F/Lmm9bmDAuZstKrOh2E=;
	b=OLy2Nm//Z7c2WngtnW50f4lCR/QOTT6+gfXtCkhur04Q3OkTP/RVViyjx5LOTH0GMQ
	436NP2xmO9uAlGpdM8/ZllmLX+ebwbYmvDfxPV7DVkRdMPwrlFAnjqSLPBiY/+/JpiDH
	wT0Mvqp/nmGdBUI8pvnYFSGLJ8Qu9MxnVbN53WUiMxG8qolZ2CYarFeChXScWz/3niCd
	erhzVCc/D2KUiyxDQBSYB59accWxw37UQdj0jRNNZPGDX9d4Alwst5D2yVHvWkOpz/xl
	yFsduIaVn3cuqX+tXggQByZrnv/uGLG+e94nodnBD9Ul5wdoitLCYTOZ4jy/G9lrvj68
	cLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/kymuUpq9O3v1SgAX8bHyi2F/Lmm9bmDAuZstKrOh2E=;
	b=EkGLu7SxwsZsaCoe9pXHU+u8ttdKMhErXbrgrXGkij6AZtG7Gnjm0GYIjZrsbzul83
	vgTM1Q2m+/0GRuMF9RsDXsJKu8QWDzvDURybFkqZTKeOZ2s1h/M8tCJ7ABZytSzH8l9a
	eHgE2K8I+dGFjuv8VWkKQEcYGH2xg7j9AnF6LM0XDoKJ1uhOXoOkvJxda9jK1PDq0gsj
	SE5NoF4zoWzSGZ9p+Lz3Xk0I3JP6WtCjawUAcy0uGqFHcszRKtQyY1fmGOwpgXk6ZJSc
	WMAY1nIOyMyLyS5ci5gRF9/fI2UF56uwQ6BkXszGIbe4knHqEwpq/EckzEHvxqtMNveo
	rYBw==
X-Gm-Message-State: APjAAAXxfQHU/wfnE5HYbzWLr3+2vRIaccs4zLvlCHUNekJQftV4tzEK
	Db4FPLzd1qst5uW7ndMD1rg8U7Ct
X-Google-Smtp-Source: APXvYqzehZEp4KZt4Gyk36CI7WntLMI3QtxngPZ21tqj9PrRn3Ihh4wC6K4HDAqblQ3BbgStgkm+hQ==
X-Received: by 2002:aa7:8d88:: with SMTP id i8mr2629458pfr.88.1573117753720;
	Thu, 07 Nov 2019 01:09:13 -0800 (PST)
Received: from cmtcleu60844809.rd.corpintra.net
	(ip5f5bf1cc.dynamic.kabel-deutschland.de. [95.91.241.204])
	by smtp.gmail.com with ESMTPSA id
	s11sm1525112pgo.85.2019.11.07.01.09.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 01:09:13 -0800 (PST)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2019 10:09:07 +0100
Message-Id: <20191107090907.26286-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] iproute2: update 5.2.0 -> 5.3.0
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
X-List-Received-Date: Thu, 07 Nov 2019 09:09:13 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../iproute2/{iproute2_5.2.0.bb => iproute2_5.3.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_5.2.0.bb => iproute2_5.3.0.bb} (65%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.2.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.3.0.bb
similarity index 65%
rename from meta/recipes-connectivity/iproute2/iproute2_5.2.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_5.3.0.bb
index 1728cd69a1..8a86cbf78c 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.2.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.3.0.bb
@@ -4,8 +4,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
           "
 
-SRC_URI[md5sum] = "0cb2736e7bc2f56254a363d3d23703b7"
-SRC_URI[sha256sum] = "a5b95dec26353fc71dba9bb403e9343fad2a06bd69fb154a22a2aa2914f74da8"
+SRC_URI[md5sum] = "227404413c8d6db649d6188ead1e5a6e"
+SRC_URI[sha256sum] = "cb1c1e45993a3bd2438543fd4332d70f1726a6e6ff97dc613a8258c993117b3f"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.23.0


