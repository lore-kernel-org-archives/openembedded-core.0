Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0DEAC7F3F6
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 20:36:44 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id g207so8453423wmg.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 13:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=QjRzCAEyKQNjQqgmpD0p9+Z0hGmJdhTYNJ5uzjWJJtU=;
	b=RJObAydx/UO7iLAZPJglrlYoOcTm4kBB5WzhgmCy/ZdQ5e+MCZvrStCzo0pSDrqud4
	8mwoxA5g82MFGxUlSNkBGPf/d1jtqmiDewMQi0GRgmS1LotXElXVXeh2bmSCu3VV9Pm3
	CpRwzYlFJPiiobk64K7ZPkqHGrq//akqB24XrW2WH9lDz3pif4mmVTPkOntdRmKF+23u
	fc3cooPic1r0quK4+4t3ntlcJi8sk1IYkiogUrEmLeXRZolNp3n2DpHNRW9YsQP8NQru
	+/lirAE3+V92+5VIIHK5rtvnQvTPSszxWWD9bFjTjY0U7mBAGJNqMrgNnvBamP66sjQi
	vUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=QjRzCAEyKQNjQqgmpD0p9+Z0hGmJdhTYNJ5uzjWJJtU=;
	b=dJo5p5FLTvNy3BFTMi4wGbMgpH7hKQjAnwsvgTFUce1G093pv7f0djg4ku7ir+MJAl
	DryjTSg0BYucIXa4wofbuHXp9+VMWx6VJ2OjWErWvm7dDBzsqTKCsSR8XXClaUYjST4+
	aMjV6KQIbLzyzmLNWvcp40ed8JzIZhztQvXaUe+BB2UR0ckc4VPVb6aHvng7nbKvTLoJ
	n2hPhI3wcmUOsza7AnYIuYRWbSCNKIkHkzdsozc9VPKLjJpaCxvf+9W5jezLDvbV8DZg
	F8H3O/IUZ2Ru8j+OV47RC9POkakZjQiEjIO3911A5UaR9HOAWAAYbzif6NNSMfDAk43E
	mzpQ==
X-Gm-Message-State: APjAAAVQWQQoOLnpx9xHxpnLMSdPN7gBt0Il1WwohHaog/qth7mDqjIs
	FLjyoZHCdCEtCeMadOIylK+R9Ob2
X-Google-Smtp-Source: APXvYqxZfmU3l2VjaHTn8JC72I17gBO9yR7kMNyP5ii+SKBbsAolzZQFneSgK9PAzarMMaAn0MB9bg==
X-Received: by 2002:a7b:cd99:: with SMTP id y25mr5195610wmj.15.1567370205486; 
	Sun, 01 Sep 2019 13:36:45 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f6sm25876192wrh.30.2019.09.01.13.36.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Sep 2019 13:36:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 22:36:32 +0200
Message-Id: <7af002b34676f3f85aaa830513d492f81f0f7341.1567369258.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1567369258.git.alex.kanavin@gmail.com>
References: <cover.1567369258.git.alex.kanavin@gmail.com>
Subject: [PATCH 2/5] libsdl2: enable opengl option for native/nativesdk, subject to 'opengl' in DISTRO_FEATURES
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
X-List-Received-Date: Sun, 01 Sep 2019 20:36:45 -0000

This allows virgl support in qemu with the SDL frontend

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
index 3a0654b866b..0d8d724374e 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
@@ -40,8 +40,8 @@ EXTRA_OECONF = "--disable-oss --disable-esd --disable-arts \
 # and BSP layers to pick either (desktop) opengl, gles2, or no GL
 PACKAGECONFIG_GL ?= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
 
-PACKAGECONFIG_class-native = "x11"
-PACKAGECONFIG_class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+PACKAGECONFIG_class-native = "x11 ${PACKAGECONFIG_GL}"
+PACKAGECONFIG_class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} ${PACKAGECONFIG_GL}"
 PACKAGECONFIG ??= " \
     ${PACKAGECONFIG_GL} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x11', d)} \
-- 
2.17.1


