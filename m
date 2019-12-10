Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id E2F987FC06
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 23:45:26 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id a33so9522930pgm.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 15:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uFXbohNzhKVR66z6AIAA0icoM4HHZSf3ABfbXUOxK5c=;
	b=V+59wBjXFkbHz9ydxkgDPwHTFgHS+PwrHQjXdhaUhYkx5PD8A4QKVzmYjLRCMMdfT7
	Qf4OslYPyFn6ez/c9z8fBm5j64p7SDase8xIZNzc4xrpWTKLBAH0KKbsEtwCn212jui7
	qjIvOV7vr8ghgVvwfz1ueLcEoYCOHOb0Dao46zASE+nWir9fAC8LBx5pEnh3Q6uWb/um
	yDE5dI5Oi/x/im3iDJb62+zstCWAHG0CwvXUrh1SoiiOn9VGesbk/K0iLpCZdamcWLT4
	HHardwj91FPc9NWWZPFCqsFKpmcK+xg/vHJQou93qjeMN6LD4xSBB/D74ToBfwV9eX8m
	np4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uFXbohNzhKVR66z6AIAA0icoM4HHZSf3ABfbXUOxK5c=;
	b=eJyLc66zKlu6TREMSLCengRIplrJfMwK67cLGgRLZVzKIrKkCxPbhVBGfAQ93mod1T
	e+cY8Pb/J2jzKFZs/Kohn97GuKDYKx8Dt4mXKDWSVcDyynI3WsAtviIVe+7BNAef0YTN
	uCMGi/WxXJdHjjaMDk2p7+mtkZhGzfJu5qKH5SrS7P2gK8RdqaB/7D3axmDI5WFa5Bu2
	6ueMHHHH2Ytvn2dPG9o3PoAsuJSeMvmU80aVCkZOn77u021d+44KDjAoyFuh3Bs61p3B
	RE260TQ6vjZ3oUAF5yskzB9avYDC2N0+2lArc1FRn6kfw9OrJrH+hr9AnjwzhddeF9tp
	CHKQ==
X-Gm-Message-State: APjAAAWMEyZ/dadrHCqgsa1XTvUTTTUDijtCyXx+cnelGCsNDOZf6RaF
	wsCB2dUYoZ47PDYT/pEXcsaS2JEJ390=
X-Google-Smtp-Source: APXvYqz/2wTyImkutMdA1oZdN8jRj+QuxX3CJqlu3AGtDQu8uyC54Nw8rk/Xn4Glf9yosHF6c687YA==
X-Received: by 2002:aa7:972a:: with SMTP id k10mr579489pfg.140.1576021526674; 
	Tue, 10 Dec 2019 15:45:26 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::afb7])
	by smtp.gmail.com with ESMTPSA id z1sm149472pfk.61.2019.12.10.15.45.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Dec 2019 15:45:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Dec 2019 15:45:17 -0800
Message-Id: <20191210234517.3749201-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH] libpng: Correct SRC_URI path
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
X-List-Received-Date: Tue, 10 Dec 2019 23:45:27 -0000
Content-Transfer-Encoding: 8bit

Fixes fetcher warning
WARNING: libpng-1.6.37-r0 do_fetch: Failed to fetch URL https://downloads.sourceforge.net/project/libpng/libpng16/1.6.37/libpng-1.6.37.tar.xz, attempting MIRRORS if available

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/libpng/libpng_1.6.37.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
index 78f3248d73..47287a0d55 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
@@ -7,11 +7,11 @@ DEPENDS = "zlib"
 
 LIBV = "16"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/$${BPN}{LIBV}/${BP}.tar.xz"
 SRC_URI[md5sum] = "015e8e15db1eecde5f2eb9eb5b6e59e9"
 SRC_URI[sha256sum] = "505e70834d35383537b6491e7ae8641f1a4bed1876dbfe361201fc80868d88ca"
 
-MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/${PV}/"
+MIRRORS += "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/older-releases/"
 
 UPSTREAM_CHECK_URI = "http://libpng.org/pub/png/libpng.html"
 
-- 
2.24.0


