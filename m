Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1CC737CC0C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 05:16:32 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id q206so3126668pgq.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 22:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=WG3o6Xq1sBbEGo6R9slFRQ6syU5P05rRRcid2GADzZo=;
	b=E3WBm60f47DVUUx+qXYvfVgv52ahC3lgXhyy8/rQDQnTyD5bxW1ujiB7cOMFY7yOKJ
	8bGwV+eMngtJ2MyzZiuKmuQVHAYg6RWM+UNUZGjFdfAKaA768hMWg05zvosng75PnIuf
	XdnsvVCaJBntq8SRT+9DRP4u6mnI+ZDU1c4iRqDQfCwskQzYhuLnufYEZeLQzBz7dfVl
	5t06/dy9G4huPFjA5+aCvQpx0kmlxJgta/lH1/HE9nkbT8wKbAQREMj6GVqW4z5RCKot
	10s9iVSpHUgdJyyQJPK4xBE44lVNe1Sw++7o+UzlFzLcDMAulisTYZR0i86+USibiS5M
	TN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=WG3o6Xq1sBbEGo6R9slFRQ6syU5P05rRRcid2GADzZo=;
	b=dkGLTmXik4+5r/jjUNxflI8IvAEh22D4BHdEzEQG5zF7H5dfYDVrH1oagZIdQL65HZ
	nGGfAb1+ko9UvC180cJ8XrU3seFPNtZoTR+01B0sSIhF3S3PjAlE0ArmvCdfSII3T9o1
	dOfx/EIktYlk9QFJH/J8z3/a6Usq0iFLRQPO58ygER6FxOeaBMJ3mIPhjp0R4zdrVSU1
	ac2TxXDU7xSYC2nVOTiitLDANnAi7kFATSHw5SxT82evDYZYJRt2CerPWUKm2TnBQM5/
	MDnfCEQI17kSRcDzlCGPq+lhxMpSIO5s5AJZhVpIxiWkxcHzb/wTA2/nhFsZ9MB3h5qV
	w/SQ==
X-Gm-Message-State: APjAAAXTTFjT3IU4I2+6+Ir8+gT365u7K5wQHvQxbdupMAZ5wGkDUKYe
	npLMQf2IN1Q32ea1CPYFcWqIkEOz
X-Google-Smtp-Source: APXvYqx6LpHsoCL16LJ4SCzZGVnizzRpELsvlnqBQslGNd6vpQikVgXtOjyNyTalwUoc1DGRoQQk6Q==
X-Received: by 2002:a62:5e46:: with SMTP id s67mr31278572pfb.126.1552281394006;
	Sun, 10 Mar 2019 22:16:34 -0700 (PDT)
Received: from localhost.localdomain
	(50-196-139-177-static.hfc.comcastbusiness.net. [50.196.139.177])
	by smtp.gmail.com with ESMTPSA id k9sm7512565pfc.57.2019.03.10.22.16.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Mar 2019 22:16:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Mar 2019 22:16:21 -0700
Message-Id: <1552281391-31620-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552281391-31620-1-git-send-email-akuster808@gmail.com>
References: <1552281391-31620-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 02/12] xmodmap: update to 1.0.10
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
X-List-Received-Date: Mon, 11 Mar 2019 05:16:33 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../xorg-app/{xmodmap_1.0.9.bb => xmodmap_1.0.10.bb}                 | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xmodmap_1.0.9.bb => xmodmap_1.0.10.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-app/xmodmap_1.0.9.bb b/meta/recipes-graphics/xorg-app/xmodmap_1.0.10.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-app/xmodmap_1.0.9.bb
rename to meta/recipes-graphics/xorg-app/xmodmap_1.0.10.bb
index 2deac6a..7dedb03 100644
--- a/meta/recipes-graphics/xorg-app/xmodmap_1.0.9.bb
+++ b/meta/recipes-graphics/xorg-app/xmodmap_1.0.10.bb
@@ -12,6 +12,5 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=272c17e96370e1e74773fa22d9989621"
 
 PE = "1"
-
-SRC_URI[md5sum] = "723f02d3a5f98450554556205f0a9497"
-SRC_URI[sha256sum] = "b7b0e5cc5f10d0fb6d2d6ea4f00c77e8ac0e847cc5a73be94cd86139ac4ac478"
+SRC_URI[md5sum] = "51f1d30a525e9903280ffeea2744b1f6"
+SRC_URI[sha256sum] = "473f0941d7439d501bb895ff358832b936ec34c749b9704c37a15e11c318487c"
-- 
2.7.4


