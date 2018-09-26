Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7FE3979616
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 13:52:42 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id z8-v6so17261391qto.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 06:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=IDVVYhUwbp2O7VDayHJcNfuNTv8ORrnxezXw0u9yHCU=;
	b=N/Ekwxeqjo1OoEr+0wF3eU0vUjckgE5IAxWaDgYzB/adfwdP+RpjVLLKQAStJ525TW
	ip1iW8lK+X8PMDrqIQ1SzmX1INL0iJ/DSJIGkkUEST4cWQHVEdT0OkS6J4fyqeR/5FO4
	5Shej/Wdnrbf1WkYwYz/xT4Kq4prarHn7k+cvlrbL+gWW7o9qO1ZUxGxYslxN+QKxvSZ
	qzRlpBjAIoj8z7oUL8odbMvFRXBEtg+4FVYVXhkEoxH9nZIlryeUeyhuXp/8qMnKGpqV
	hi1CRNONcxdWMFtQ/POHeOgcrHT9KJfHX1fgcb+nJ1QVrfwS6Ci4U/R4RZWqaa2WIzlY
	f+WA==
X-Gm-Message-State: ABuFfoi7BPMIgKAyyCHdkK+putsttTiKu/rn/8OtyHTVGDfWqe1+sRr0
	eLh1q6Exmq2gLA0TRf9K8zOcB4ckXGc=
X-Google-Smtp-Source: ACcGV61zcS83NcE++UinTcG/f7qUMK96TMvuat/B8mCQmLGTqI/QXNHq412J5Kw/+fSrhmnjgOeIbg==
X-Received: by 2002:aed:2e82:: with SMTP id k2-v6mr4300906qtd.47.1537969963044;
	Wed, 26 Sep 2018 06:52:43 -0700 (PDT)
Received: from localhost.localdomain ([181.220.65.41])
	by smtp.gmail.com with ESMTPSA id
	a8-v6sm3110005qth.43.2018.09.26.06.52.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 26 Sep 2018 06:52:42 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 26 Sep 2018 10:52:38 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Sep 2018 10:52:37 -0300
Message-Id: <20180926135237.29067-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] mesa: Upgrade 18.1.7 -> 18.1.9
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
X-List-Received-Date: Wed, 26 Sep 2018 13:52:42 -0000
Content-Transfer-Encoding: 8bit

This upgrades mesa to the 18.1.9 stable release.

The changes can be found at:

 https://www.mesa3d.org/relnotes/18.1.8.html
 https://www.mesa3d.org/relnotes/18.1.9.html

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../mesa/{mesa-gl_18.1.7.bb => mesa-gl_18.1.9.bb}             | 0
 meta/recipes-graphics/mesa/{mesa_18.1.7.bb => mesa_18.1.9.bb} | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_18.1.7.bb => mesa-gl_18.1.9.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_18.1.7.bb => mesa_18.1.9.bb} (87%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_18.1.7.bb b/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_18.1.7.bb
rename to meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb
diff --git a/meta/recipes-graphics/mesa/mesa_18.1.7.bb b/meta/recipes-graphics/mesa/mesa_18.1.9.bb
similarity index 87%
rename from meta/recipes-graphics/mesa/mesa_18.1.7.bb
rename to meta/recipes-graphics/mesa/mesa_18.1.9.bb
index ca6e6685b5..86d6a6bf3a 100644
--- a/meta/recipes-graphics/mesa/mesa_18.1.7.bb
+++ b/meta/recipes-graphics/mesa/mesa_18.1.9.bb
@@ -9,8 +9,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0006-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch \
 "
 
-SRC_URI[md5sum] = "17d8a7e7ecbe146a7dc439e8b6eb02e9"
-SRC_URI[sha256sum] = "655e3b32ce3bdddd5e6e8768596e5d4bdef82d0dd37067c324cc4b2daa207306"
+SRC_URI[md5sum] = "2f8d2098ab478bc3907e42130577b54a"
+SRC_URI[sha256sum] = "55f5778d58a710a63d6635f000535768faf7db9e8144dc0f4fd1989f936c1a83"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.19.0


