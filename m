Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id D38927D17E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 17:30:22 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id y7so15438823wrn.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 10:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=aWRYOmlOIgf92jGtd4Wj6pSi5VZhnMEaYEwn0lULKjs=;
	b=Jjf8UEkcPIrgsw7PHab03zJpCRZ01t5J/mDLe/qHq9Knn8B/QHVPZJrQGUZk+Cf7WJ
	5M2X+zrtMhjNO0lQYAPk7MQ7uU2w3SP03i/fkr2hhP4UdamqGbni2pk7jaHwF9s+X5ba
	SIMhQiImKoY+ehpHJQJWNEDsEqgHgUSzMltY1kBtXX5TM2AAXOTB4eDn5QGm0CITGYfA
	pBKWcY+NtOyCIP+BmcrvpObtHlaS+R/u8abW+LvSGh21dnB3kMDVtFBHQgpKnTx8H6Ov
	ydq4QV2zaA6KvyPOCOWU6ClPYqPScl4Ku1lnR6xhrj3Qu4Vzcqaspo/BzeLqls6ozoe1
	BojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aWRYOmlOIgf92jGtd4Wj6pSi5VZhnMEaYEwn0lULKjs=;
	b=klsRQeLI9wDIjzm40u7mw9ZikfAqBEF1Hjp6jcAsHXgPdxA3a0qoo+H3Pe/VqutojZ
	EAvInQ73wB13hviJ06FBqXnYDH1700HSB1sAVfxIhFL9VIw6OTfu6FsMvh+uECah6d9o
	LQd6FP893ZgQZv0hA44K34ARxkL5Acf1QEevKLL6JAHswHciVd6sqFv1CSacoV6Oav2V
	V7LUxvyf18XJyqZRWzAbwZrR/wq37rYEJ9BWtIF3IfKLO6/+RCBibyCmMD/a4msNq5SL
	j/Y1JBVrHW6sCfBFUm7tmHaRW92udh/jPPhpVYIzzTSYsYjHJ8Sx9XFeN4+UDotamVYX
	sdQg==
X-Gm-Message-State: APjAAAVP9Y3eKxU6Zkv95g1tL9NWLkKigrfIpeWihhZIf7kfVosBuy/3
	2E9clV98vNziJwt7CQNL3z30+Xy9Klk=
X-Google-Smtp-Source: APXvYqxkQ8nX5YreWzEhyCgPGnig2pVj/Ve3KDS74kSLURi2T3pLSE4ZDjAYCGpxbaKLfFW/hej39A==
X-Received: by 2002:adf:82f0:: with SMTP id 103mr24221571wrc.260.1553707823441;
	Wed, 27 Mar 2019 10:30:23 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	r16sm11726790wrx.37.2019.03.27.10.30.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Mar 2019 10:30:22 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2019 18:30:18 +0100
Message-Id: <20190327173018.75407-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] mesa: update 19.0.0 -> 19.0.1
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
X-List-Received-Date: Wed, 27 Mar 2019 17:30:23 -0000

x.0.0 releases are actually considered 'development' by the upstream,
and true releases are x.0.1:

https://www.mesa3d.org/relnotes/19.0.0.html

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../mesa/{mesa-gl_19.0.0.bb => mesa-gl_19.0.1.bb}             | 0
 meta/recipes-graphics/mesa/{mesa_19.0.0.bb => mesa_19.0.1.bb} | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_19.0.0.bb => mesa-gl_19.0.1.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_19.0.0.bb => mesa_19.0.1.bb} (85%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.0.0.bb b/meta/recipes-graphics/mesa/mesa-gl_19.0.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_19.0.0.bb
rename to meta/recipes-graphics/mesa/mesa-gl_19.0.1.bb
diff --git a/meta/recipes-graphics/mesa/mesa_19.0.0.bb b/meta/recipes-graphics/mesa/mesa_19.0.1.bb
similarity index 85%
rename from meta/recipes-graphics/mesa/mesa_19.0.0.bb
rename to meta/recipes-graphics/mesa/mesa_19.0.1.bb
index 024acdad0b1..d90be8a0745 100644
--- a/meta/recipes-graphics/mesa/mesa_19.0.0.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.0.1.bb
@@ -7,8 +7,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch \
 "
 
-SRC_URI[md5sum] = "d0d76cd8b00bc1308e37985d4a45d3c5"
-SRC_URI[sha256sum] = "5a549dfb40ec31e5c36c47aadac04554cb2e2a8d144a046a378fc16da57e38f8"
+SRC_URI[md5sum] = "19636bb3da35c21f43040d31e575d5ce"
+SRC_URI[sha256sum] = "6884163c0ea9e4c98378ab8fecd72fe7b5f437713a14471beda378df247999d4"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.17.1


