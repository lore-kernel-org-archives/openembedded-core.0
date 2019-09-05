Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id AFFEF7F2B6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 15:25:16 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id y4so2369528lfe.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2019 08:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=sCGzpPP1bhscxIvypC0SEkTisXepOBA5jqq3vH8GP90=;
	b=pxR/suhM+bHJtdQ4eGh7l6NS0iFIn7IKaW1Pe3G5JtBn2WoO9iXOEBl8VhyRvkNHmh
	GtVpi2mKqIIEq4f3ghXP7FZwxyC0oeYZ+7EGHn7UK/c+r0l+z1BeF9GR8a8rnn1OhkkI
	Xf8Y3d6jypf9vv5hgAZB2MIhOxafty5OvIAIdNDrBatCJPnM3tAOaS3kMYl++605begZ
	NCADomna0dBf4fLgP/9Kh+gbHnOzH9LAwdMVxMuxdkWwAojEXGB7EhDZ5IboItKRf4tW
	7ArTv50PGtuZF3Mm2osdG828NwsctBuMpkWhrStiqqO/IMc1WPOH650hbIVyiC6HgMU+
	n3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sCGzpPP1bhscxIvypC0SEkTisXepOBA5jqq3vH8GP90=;
	b=qLXsmJH7dQllpFYBD4lKLRjHkMdCGNkvX2ZBC/zqNOFMksFf31i6XJAHcP2bD3DmAK
	G/F5ZU99n2k0vZMw/RrgFEx2jZzV1Kw+CzTQzLy6LqV9SPGrc3bVbbNrlNInXFZ0TntF
	xyXN3rqpBLoF1YAnyfRSqZsU15sSBwTT2k67pT0KtA3+63SBu8PMTfaM0ixGr/e9iIkx
	hfAfHfhHZCsRx8TLx9olOv4NF0t1bUuDFL7opdrIxR5K8AwujY3W2x4+wSA0KfThetoo
	Gxby3zDB5LbOKc5CO9HuIXptKOjaOoCZNAGlNjvQQHdY98Fp2A3Cz3PkIZtTl/fbqYU2
	Hf5Q==
X-Gm-Message-State: APjAAAUWh9kfIGQelcmTDX1fY6CXhsmJFvFowbkFzXBWIPPGWZiyZGdb
	KeW8FCiVwWakFNKYHqdqFxKiTBm1Bos=
X-Google-Smtp-Source: APXvYqx7axVkHoW/JGO+X/c0JVm8LOW+kxXWwz6WfZOMYToo4WtkKnGP+rKyYp42we6W+O9zeHy3RA==
X-Received: by 2002:ac2:54a9:: with SMTP id w9mr2969843lfk.49.1567697116854;
	Thu, 05 Sep 2019 08:25:16 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id f28sm496521lfp.28.2019.09.05.08.25.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Sep 2019 08:25:16 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Sep 2019 17:25:14 +0200
Message-Id: <20190905152514.32577-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libogg: udpate to 1.3.4
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
X-List-Received-Date: Thu, 05 Sep 2019 15:25:17 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libogg/{libogg_1.3.3.bb => libogg_1.3.4.bb}              | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/libogg/{libogg_1.3.3.bb => libogg_1.3.4.bb} (80%)

diff --git a/meta/recipes-multimedia/libogg/libogg_1.3.3.bb b/meta/recipes-multimedia/libogg/libogg_1.3.4.bb
similarity index 80%
rename from meta/recipes-multimedia/libogg/libogg_1.3.3.bb
rename to meta/recipes-multimedia/libogg/libogg_1.3.4.bb
index 8d88f1f9f4..67521d8215 100644
--- a/meta/recipes-multimedia/libogg/libogg_1.3.3.bb
+++ b/meta/recipes-multimedia/libogg/libogg_1.3.4.bb
@@ -10,8 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=db1b7a668b2a6f47b2af88fb008ad555 \
                     file://include/ogg/ogg.h;beginline=1;endline=11;md5=eda812856f13a3b1326eb8f020cc3b0b"
 
 SRC_URI = "http://downloads.xiph.org/releases/ogg/${BP}.tar.xz"
-
-SRC_URI[md5sum] = "87ed742047f065046eb6c36745d871b8"
-SRC_URI[sha256sum] = "4f3fc6178a533d392064f14776b23c397ed4b9f48f5de297aba73b643f955c08"
+SRC_URI[md5sum] = "eadef24aad6e3e8379ba0d14971fd64a"
+SRC_URI[sha256sum] = "c163bc12bc300c401b6aa35907ac682671ea376f13ae0969a220f7ddf71893fe"
 
 inherit autotools pkgconfig
-- 
2.17.1


