Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0F2277DE74
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2019 17:28:21 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id m23so8952057lje.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2019 10:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=JN01wEugO0W5j9x+ezSiTPvIdTvc9UTlCpu0ZL7cKEY=;
	b=BI4L7OboO7BEjHdoWG0Rh7m9aSf6449azNuN3mIkSZl/WEXApHhy0rz7wkCCJJIZoN
	2I4Jk11T8GDyAeS4iB0C58hikmkLXTNpF5ajxZOlKCthMcnQijEbV/BZk+JycDKxBs+3
	I9hQQ4x9kDr8tau/iHlIUOGmOLb7nd5gkr0LmF6H4weJ+Mev9zVAOK2oeQi8a7suv0Q6
	+YL+AIfaz3DDdEUyEHzBpomXnsx8Wv/nkzQFdwWJM1LK4hz1UrlgvtRNhkcF3+6jp1DM
	0Pnl5T7knilpIx4nza+MLu1X15pOelKVANFjZf+xzKF6+eQrWt+GyvM7EwXAh4pJndqE
	IJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JN01wEugO0W5j9x+ezSiTPvIdTvc9UTlCpu0ZL7cKEY=;
	b=aw0f2B/S7X9dJVgaA9hZWabINpKHBMPNnAYxmocqWTwSrWOzL1b0l45ilfT8g1OKrn
	zKeLb18Bgk4w5fxnBaDTyLLcrQlf6buXjqEFDfzoyWZCz/lymJ41mOGoC6xgCmDcwAZd
	rw0U/DO3fpDKaqgSia4Xzlw46MRn1hKXKpX+Z9ZppzWaiTahTVXbYvgHdzrqfLLS9Zwn
	MJl1YhNB3Bfb1x2XRQfEgOuUpZXJotd8E7dSzSEERi24AeH0yxM8oM6knypBIBk6RqTm
	CuQg+4+EYiYGK182utqQFxn1YddHPIXHX3kR1uKd4JoNPTD6XXQmFeaguVsvSAxsBOqA
	q5pA==
X-Gm-Message-State: APjAAAUIrz1DvAAlsXoS8jhIqaSQENo7h9+RjMYEyoYL3fVfQH7J/Tdd
	N1/JY2e1draQQ191wXuqQurVw54hack=
X-Google-Smtp-Source: APXvYqwIiAF57X013nIwK9iCgGpsQ0T0PuyvANpuoBnPhC2/LcHnYLEqhoEuZ+LLNyiUxoylWzG7HQ==
X-Received: by 2002:a2e:9010:: with SMTP id h16mr9764906ljg.49.1561829302226; 
	Sat, 29 Jun 2019 10:28:22 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id f1sm1865992ljk.86.2019.06.29.10.28.21
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 29 Jun 2019 10:28:21 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Jun 2019 19:28:08 +0200
Message-Id: <20190629172808.13158-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libinput: update to 1.13.4
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
X-List-Received-Date: Sat, 29 Jun 2019 17:28:22 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../wayland/{libinput_1.13.3.bb => libinput_1.13.4.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.13.3.bb => libinput_1.13.4.bb} (86%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.13.3.bb b/meta/recipes-graphics/wayland/libinput_1.13.4.bb
similarity index 86%
rename from meta/recipes-graphics/wayland/libinput_1.13.3.bb
rename to meta/recipes-graphics/wayland/libinput_1.13.4.bb
index 87e25ab70b..73d692573d 100644
--- a/meta/recipes-graphics/wayland/libinput_1.13.3.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.13.4.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1f2ea9ebff3a2c6d458faf58492efb63"
 DEPENDS = "libevdev udev mtdev"
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "0205d720ae0b1caef1faeb4bba7f8c0f"
-SRC_URI[sha256sum] = "f3ff113023a28631d83971c059c1f3057d51a90aa3746428776f3b3462131092"
+SRC_URI[md5sum] = "9ef817774bb5b4006cba95e34103e82c"
+SRC_URI[sha256sum] = "d3eb57c714683b117aae29f6c0be76dd46de259f0a48f20cb43b9fa9f2e1401d"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.17.1


