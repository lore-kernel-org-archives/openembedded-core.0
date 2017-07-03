Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9A73173068
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 20:02:24 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id g40so13857196uaa.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jul 2017 13:02:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=sfEpe5IIihPkdx5h7OJH+7ZhIe6yW8fiVdZ0GjTldnQ=;
	b=nWtVOt3dlPtrU9oGR3a1REMUg9i2QIqQRO9Jdq7fuSL1rVVmfVTzKKK6sVhASDHCqa
	jdopUGx4uRD+MsCRNzZJvPUdZAqNG75FTUwarAAfrZnbwVTBL4TqWsL/159CGK8IH9iz
	odYIK49gB5HlmUQl+Nhwm3soAtTQC5kE5gYl4+rrieknCp7XFeNchuEEMqxTxzS5oljb
	YDsa/RbuRFjGbmFbM5W0dx4RkeKTkTD3Z2xdBKaUGpr4wtCcInGx8/67lvXYOvze/lQp
	6CCscM1gl8YddPi1vwNBhA+GNnDf2jdOg5t2uAjy1Z3mkTJJ4VZ9+B6a2JApsruw6v3s
	r15A==
X-Gm-Message-State: AKS2vOwErpMQZZzTHUtB1mKWnF1tLEY++J7+UUqLASPnCM3Cjjgi49jP
	XIuj6L1Pk0W3a2ID
X-Received: by 10.176.85.91 with SMTP id u27mr18503898uaa.114.1499112145066;
	Mon, 03 Jul 2017 13:02:25 -0700 (PDT)
Received: from localhost.localdomain ([179.105.243.125])
	by smtp.gmail.com with ESMTPSA id f36sm326396uaf.10.2017.07.03.13.02.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 03 Jul 2017 13:02:23 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 03 Jul 2017 17:02:20 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  3 Jul 2017 17:02:10 -0300
Message-Id: <20170703200210.32229-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170703200210.32229-1-otavio@ossystems.com.br>
References: <20170703200210.32229-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 2/2] mesa: Upgrade to 17.1.4 release
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
X-List-Received-Date: Mon, 03 Jul 2017 20:02:24 -0000

This includes following upstream bug fixes:

Bug 77240 - khrplatform.h not installed if EGL is disabled
Bug 95530 - Stellaris - colored overlay of sectors doesn't render on i965
Bug 96958 - [SKL] Improper rendering in Europa Universalis IV
Bug 99467 - [radv] DOOM 2016 + wine. Green screen everywhere (but can be started)
Bug 101071 - compiling glsl fails with undefined reference to `pthread_create'
Bug 101252 - eglGetDisplay() is not thread safe
Bug 101294 - radeonsi minecraft forge splash freeze since 17.1
Bug 101451 - [G33] ES2-CTS.functional.clipping.polygon regression

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2: None

 meta/recipes-graphics/mesa/{mesa-gl_17.1.3.bb => mesa-gl_17.1.4.bb} | 0
 meta/recipes-graphics/mesa/{mesa_17.1.3.bb => mesa_17.1.4.bb}       | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_17.1.3.bb => mesa-gl_17.1.4.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.1.3.bb => mesa_17.1.4.bb} (84%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.1.3.bb b/meta/recipes-graphics/mesa/mesa-gl_17.1.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_17.1.3.bb
rename to meta/recipes-graphics/mesa/mesa-gl_17.1.4.bb
diff --git a/meta/recipes-graphics/mesa/mesa_17.1.3.bb b/meta/recipes-graphics/mesa/mesa_17.1.4.bb
similarity index 84%
rename from meta/recipes-graphics/mesa/mesa_17.1.3.bb
rename to meta/recipes-graphics/mesa/mesa_17.1.4.bb
index d9860213f2..2a1ecd3124 100644
--- a/meta/recipes-graphics/mesa/mesa_17.1.3.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.1.4.bb
@@ -7,8 +7,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0002-hardware-gloat.patch \
 "
 
-SRC_URI[md5sum] = "1946a93d543bc219427e2bebe2ac4752"
-SRC_URI[sha256sum] = "5f1ee9a8aea2880f887884df2dea0c16dd1b13eb42fd2e52265db0dc1b380e8c"
+SRC_URI[md5sum] = "be2ef7c9edec23b07f74f6512a6a6fa5"
+SRC_URI[sha256sum] = "06f3b0e6a28f0d20b7f3391cf67fe89ae98ecd0a686cd545da76557b6cec9cad"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.13.2


