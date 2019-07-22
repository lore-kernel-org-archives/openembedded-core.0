Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id B80EB7EF45
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2019 00:29:21 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id k18so35760671ljc.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 17:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=zh3DxUOW/qdU/vSqklVaNqxMBg4bpFa3fQEycKbxrzQ=;
	b=A4TfuMFn9xWZzWRBO3C9HXAMbFLo1ukkgrN1yW1cZ2PjY5o+0u8NTYvZGNcQCSXEor
	8Ks6JbJzjI7ThckwHql5TfEpAO1ENA0NNRtv+OCCyW2adwvxEMXEFHICUJMD760euLxm
	eaw13Ij3TMmxDYJ5CfrELCvzqT9t03c49jfIx9eMBZuhg16YAgpGl4OEVVKSHde4uXXk
	ANJKqMqSTERWuRg6dfekXPxyLgOZ3VIEyEcP+U1Jc1uXIQi3fexyL8H+5VTKKDrzy5DY
	CPxWjoZ75qfmlsQl0q1UQCjavAWvY0iTEFeC68PFaBRPJoDiZciv2oS64/K969q7b33U
	MEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zh3DxUOW/qdU/vSqklVaNqxMBg4bpFa3fQEycKbxrzQ=;
	b=um/EwikVtgHWB7xc50X3k05SGYEG+1dIp53R5W+FCjzbBL+glzfbF8TXy/sL8JvA5V
	JiSVI2/9bmIZ1O5U1wSwsX8I4ZSQ6P43rieOtiAMoaLJx/bRBPaxLeQ16WWYJH9jZaFe
	g/1wyshK8XGqw3lEzPZpe98PZKaJce0P+ig+Z1hmm6Xgw+ZuRSGRYQc9WQ9rmJ8l0dij
	AXWpWwlDJuHxM1KoSUK8lJSTUXDyhA1nHsbnw6mtIAo8TkEqKwKr1uS3NMl0Nc8mwrh+
	os9wVarPUqvnzafMPmfNwpbcA/b0JHwLVmCEyAbrIY2kiyOZDAmvGh9ctNtFucccdfT0
	Kidg==
X-Gm-Message-State: APjAAAVnK7YYh98MT37HqwUPKeUYP3vOpAdI6PoeXg0PoTnmDdwAyOqH
	I5Mke1Ftu8fk99pbi5IU4w6XvIB7
X-Google-Smtp-Source: APXvYqx+S3lgQ1G8N4u1FJwAxJCXu0txrQeY5epYng16ye09eZCFpfTiMhQX3mZLIe74ed8AObXxsA==
X-Received: by 2002:a2e:9c19:: with SMTP id s25mr12394476lji.188.1563755362080;
	Sun, 21 Jul 2019 17:29:22 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	z22sm7309114ljz.20.2019.07.21.17.29.21
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 21 Jul 2019 17:29:21 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jul 2019 02:29:18 +0200
Message-Id: <20190722002918.7178-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] xinput: update to 1.6.3
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
X-List-Received-Date: Mon, 22 Jul 2019 00:29:22 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../xorg-app/{xinput_1.6.2.bb => xinput_1.6.3.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xinput_1.6.2.bb => xinput_1.6.3.bb} (67%)

diff --git a/meta/recipes-graphics/xorg-app/xinput_1.6.2.bb b/meta/recipes-graphics/xorg-app/xinput_1.6.3.bb
similarity index 67%
rename from meta/recipes-graphics/xorg-app/xinput_1.6.2.bb
rename to meta/recipes-graphics/xorg-app/xinput_1.6.3.bb
index 25cd047bc9..ff1f1c9148 100644
--- a/meta/recipes-graphics/xorg-app/xinput_1.6.2.bb
+++ b/meta/recipes-graphics/xorg-app/xinput_1.6.3.bb
@@ -8,5 +8,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=881525f89f99cad39c9832bcb72e6fa5"
 
 DEPENDS += " libxi libxrandr libxinerama"
 
-SRC_URI[md5sum] = "6a889412eff2e3c1c6bb19146f6fe84c"
-SRC_URI[sha256sum] = "3694d29b4180952fbf13c6d4e59541310cbb11eef5bf888ff3d8b7f4e3aee5c4"
+SRC_URI[md5sum] = "ac6b7432726008b2f50eba82b0e2dbe4"
+SRC_URI[sha256sum] = "35a281dd3b9b22ea85e39869bb7670ba78955d5fec17c6ef7165d61e5aeb66ed"
-- 
2.17.1


