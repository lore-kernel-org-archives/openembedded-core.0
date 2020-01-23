Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8214A7FDD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 15:38:01 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id q10so3550786wrm.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 07:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=J31uqM9eKkTa/oyDhyHtPcIYfsOPKWx+HC45+b89qEM=;
	b=X+QqriZbPilu6oWcJQNHH5kuJg7KbTx8IWsxMNBFWVxVcTw2LK1OkBMfBAu/BfMoMC
	DGku+dIuIU6K0pRfm/5HXmR5L+ts2mB/mexyMuWAOc1vf9cMhyrLE5o0Ucd64NOqkJYL
	Iav2B9TT0PASpaoErHk5Afybcom8W9JZrFFzubn0HzkRUvv3fFeFf5pi4MHvDfGEAVVf
	DcXUGcsB2nOymFE/l2iRlwQa3dlOl7zwHW/47isfUKV8wSfutghY9I1UyDFTdUUKAGXK
	088PIHkNg7/RqUl8+iN1nQR2CwN1VN5M48wtgwN2Q2EWUfkcGy8sFB8ZtZP8nFagGZg+
	BB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=J31uqM9eKkTa/oyDhyHtPcIYfsOPKWx+HC45+b89qEM=;
	b=rDGWelsNR2tkMqk83Lfv30mYWLlUT5vKyE2EisZh+XJSCvnbHSroBHkMo8MmpQG9+p
	QHHVWNH1v5RiDl2pJHH4d59HGsZSvLU9hKp2JOKWu7TJrPJLv+z/gel5xKxRoCLN/WVV
	jn8Xk/Al5UDrFtX5Jo62bwhmMh3jjzlvuePhXvMk7zvxC5NHp6M1EGri2l3qQ5rF3V44
	UMyNgLluXrzcFeJeO9w9g7dc4HlyE32e5VV1v2qTG55ZoGUQRUX2C0TXna6Ruj6ULHFD
	kDltU6B6uIRlx8+0TT0qgmpgESBcMLf+glrNXT5lQbsdqqqV6eLWtbXevMJpJrGT5Xlw
	MvIQ==
X-Gm-Message-State: APjAAAXlCSqtYzeILs8k5k2ajZpsHOVB9VND64jcYaAfn/MRZu0dYglQ
	Xl48AF2YJqY2Jglxxvrle6uyzvSL
X-Google-Smtp-Source: APXvYqyswobkdRYogrSO6BXrRQXtACeJcbxD/a8NXl7t90krf9eLOZO6s48VEQS7IScmm5p+UZMvnQ==
X-Received: by 2002:adf:e3d0:: with SMTP id k16mr18398993wrm.241.1579793882221;
	Thu, 23 Jan 2020 07:38:02 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	t25sm3152466wmj.19.2020.01.23.07.38.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 07:38:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2020 16:37:54 +0100
Message-Id: <8e86ee8a9a0093158ceeb9979650d06a6c95d2ff.1579793597.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579793597.git.alex.kanavin@gmail.com>
References: <cover.1579793597.git.alex.kanavin@gmail.com>
Subject: [PATCH 2/3] libsdl2: enable opengl option for native/nativesdk, subject to 'opengl' in DISTRO_FEATURES
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
X-List-Received-Date: Thu, 23 Jan 2020 15:38:02 -0000

This allows virgl support in qemu with the SDL frontend

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
index 413f53476ae..06f9d6ede34 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
@@ -44,8 +44,8 @@ EXTRA_OECONF = "--disable-oss --disable-esd --disable-arts \
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


