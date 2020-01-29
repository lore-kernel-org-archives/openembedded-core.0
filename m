Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id BFDE9608D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 15:07:23 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id f129so4634994wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 07:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=grm2I6CCOiwtrhdyS6PUKvYFmHZFqRhgNAI1adQ6nvI=;
	b=IdcITVVYuc8JFu7bsyBk0TYWr/eGl8jsRLP4hgEjNeDYE5FuieVeDTneOUDqnPPE0t
	Co4EqccDRCK2PB+uGuuayRBsiXm1z9g+QGyWKuBshGhgioKDwFiAU1MQRHV8zKbCa6mO
	hPc+kNHrbwVvrnsWehi+GAgKXmIjbNI2lsAmclTDSe5hJG2yDRHHS+uRZa0olWOaT2mO
	+47gIZSVjn5ZvZ6y26Xz95vFSv61YjghVTWFSRWn0EOeGh+Xe3kwt5WLfgE1Q2tftoxl
	ZUHi8vhdcSTOZtUHeerwnlBHwiWNBSBMj/lzXP3Zz/IRrJ16GS1rRzeQVt3m9LZahGC8
	NHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=grm2I6CCOiwtrhdyS6PUKvYFmHZFqRhgNAI1adQ6nvI=;
	b=nYLou+K4MgFgD3BlaUXBzVIcVq6r7MnwOcsaY85R1R/vqInaeI3LaNpGVMf1tY5ctS
	lJd2BwX8oqDwhicjbrzuCHkzxn5DL0xPyXiB16krgU+iORFAqfNHE+KtsGwDvvzKeHvI
	JvCyE2JkuIn7kMwo7rQIctVSdNH10Z1K8gMXoNhWY6D1DL8lynORlUjlbzic7vG2CTs/
	DrbxaZ9gCBdLNZK0Z8XNvwoq8SQXe1hAHxoECWvreYcDsqkU64ikRKG0ld+rjy24hcwt
	z7uxx3XuC4ZK4OAf7qpkKvUVFV7UVtfx+/RxmgUH2YcIqYPEGmEj1GD+gsLYfdeJURwU
	qGFA==
X-Gm-Message-State: APjAAAWuA7QM/euHUN/lTOtQV1sryUys9iwZ4ec7vHnWSr6gz8mbdTuy
	NaVlucqVyGzW64Uq0mDDrHjiCg+K
X-Google-Smtp-Source: APXvYqypXtQ4QM26hP7m44elwxyd/mju6QZTGkoWD5COM4iYpbRf5+55bTu9RnRg0OllSY+rDqomGg==
X-Received: by 2002:a7b:c30b:: with SMTP id k11mr9959454wmj.36.1580288894088; 
	Wed, 29 Jan 2020 01:08:14 -0800 (PST)
Received: from linux-f9zs.box (cable-95-168-152-69.cust.telecolumbus.net.
	[95.168.152.69]) by smtp.gmail.com with ESMTPSA id
	a62sm1550224wmh.33.2020.01.29.01.08.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 01:08:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2020 10:07:24 +0100
Message-Id: <20200129090738.1398-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129090738.1398-1-alex.kanavin@gmail.com>
References: <20200129090738.1398-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 10/24] libxpm: upgrade 3.5.12 -> 3.5.13
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
X-List-Received-Date: Thu, 30 Jan 2020 15:07:24 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../xorg-lib/{libxpm_3.5.12.bb => libxpm_3.5.13.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.12.bb => libxpm_3.5.13.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.12.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.13.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libxpm_3.5.12.bb
rename to meta/recipes-graphics/xorg-lib/libxpm_3.5.13.bb
index 64d829b31eb..fda8e32d2c5 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.12.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.13.bb
@@ -21,7 +21,7 @@ PACKAGES =+ "sxpm cxpm"
 FILES_cxpm = "${bindir}/cxpm"
 FILES_sxpm = "${bindir}/sxpm"
 
-SRC_URI[md5sum] = "20f4627672edb2bd06a749f11aa97302"
-SRC_URI[sha256sum] = "fd6a6de3da48de8d1bb738ab6be4ad67f7cb0986c39bd3f7d51dd24f7854bdec"
+SRC_URI[md5sum] = "6f0ecf8d103d528cfc803aa475137afa"
+SRC_URI[sha256sum] = "9cd1da57588b6cb71450eff2273ef6b657537a9ac4d02d0014228845b935ac25"
 
 BBCLASSEXTEND = "native"
-- 
2.25.0


