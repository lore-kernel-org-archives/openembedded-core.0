Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 930CB78916
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 08:08:08 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id i14so5263458pgv.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 00:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Su4X4TKVF83UnpMJuoVfOrTt1tSGPWPVodbPb1Tp5+c=;
	b=VdHzSZ2szmbCo2nu77xl3AsDIrroDnjAqcSRFvYVHYBD9JRogdWQHqy0m0Oa6ic+Rn
	ZXjyKl00I0Mr8mM+DgQFbWOpHPPYv9ul1O9S5acMcIw+lFsdqG8qGGtbwmhV82IB/DFu
	8tGK5kT77lTI+HChGiT1e5+a6UhivEF8223xBcCEaCmZHRYmvMpirgKQHAeCn7vg/oib
	S/t/qlj7OF2BIGKcUe7aq+QMKq5cXTCsHvS0ZJ+lsz3XU1yepFeqeUTv6e4xV9V/TRjr
	sPryf/wIuL9kseRZsguzRtz6WyknnE5+MTxHAQBkzffI0Vj1xvl3B4Tjr0IIoF6Dp3OR
	nLJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Su4X4TKVF83UnpMJuoVfOrTt1tSGPWPVodbPb1Tp5+c=;
	b=sJrEdXMbHcGj/rwEUB9KfzqpMT8KhFu20HyAWMgnJDAA38i6inM64MhqJuwjzTIR3s
	sk7NT4HhpUCmQsGz/Ub0VsHXblABjtIkJhSEqWG1Ro/ymeKtDcHdGUDWX6KuJnRh1+Hs
	e+P5GoCVy3I1/U8iSXiRW7P6KjAWB1DbS4OTkDNcULwgVH/Et7GSbhStDPJRGywgvO0x
	v8tenYmGBGRUy30geVkuEwgBSnGFZIH6J0UrGBu1pExF9yEi/gkmz0fsNiuRacFF/HxY
	tGOp1ZRvW/8y2ZBCXIf3/TfQUEWSNP/w1Mg0YBb0Zj++/EjOwcHXKK3OIy4gRrKcE/a9
	Znag==
X-Gm-Message-State: AElRT7F+ncdkNvQQa2MjQ3wA3kiM6yQMralBNC04Qmgb938mTBlOjY3l
	OjCjPSonW0luy/Zfh3dMowp7uw==
X-Google-Smtp-Source: AG47ELul/PpYVmyDQ/fF+zpIm7GJPbuxineaqGL6MOZLaPKyUBtmRzfJrBAdNPrRSKtZPXJPL2XqRQ==
X-Received: by 10.98.20.22 with SMTP id 22mr4095122pfu.141.1520755689950;
	Sun, 11 Mar 2018 00:08:09 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	q6sm8968184pga.37.2018.03.11.00.08.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 11 Mar 2018 00:08:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Mar 2018 00:07:56 -0800
Message-Id: <8d2e22b1fef608f61e96d0a3ef0aece7fad90f5b.1520755515.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <cover.1520755515.git.raj.khem@gmail.com>
References: <cover.1520755515.git.raj.khem@gmail.com>
Subject: [PATCH 2/4] pcmanfm: Drop COMPATIBLE_HOST setting
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
X-List-Received-Date: Sun, 11 Mar 2018 08:08:08 -0000

We have all core architectures in there its almost redundant

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-sato/pcmanfm/pcmanfm_1.2.5.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.2.5.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.2.5.bb
index 75ff7731be..4127a07046 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_1.2.5.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.2.5.bb
@@ -9,9 +9,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 SECTION = "x11"
 DEPENDS = "gtk+3 startup-notification libfm intltool-native gettext-native glib-2.0-native"
 
-
-COMPATIBLE_HOST = '(x86_64.*|i.86.*|aarch64.*|arm.*|mips.*|powerpc.*|sh.*)-(linux|freebsd.*)'
-
 SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/pcmanfm-${PV}.tar.xz \
 	   file://gnome-fs-directory.png \
 	   file://gnome-fs-regular.png \
-- 
2.16.2


