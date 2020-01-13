Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 53C567FCA4
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 15:30:39 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id g6so3950226plp.6
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 07:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ihb2qAySksjavllcldgEzYH/OXog0fr4LTqKcMfp8EI=;
	b=ubpRfxneZ96J0zI+M3J1fxU0Mibknib2cxZltgBV0yKyauLYZ+L6WIPYPKby2OirwX
	z9IewRPzi9h5D36WCW1SRIuOuXoT/+iQBci/xd62fv4vFLfDH+sJAUg6AL2MZ2NWac2Z
	op7smQcSBMIPlYtViSztHiJDsn+Ghbbc416qurFjBgBSKVrWSy6BR+nbF7+Mp2IOrf3e
	oQ6TFXHLjSfKAAv5e4Dut5AmXpHYbrM9/TUDPHRaYuK4+89B5fKXRBqwBqpow8YkeVUS
	aqkux9B76RakG3yVOuoVlRCLICKWZxS/hg8nK1B8m0dBAOSUfNplIVp0hjKYse6lxZK/
	eXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ihb2qAySksjavllcldgEzYH/OXog0fr4LTqKcMfp8EI=;
	b=V/Ro2glxB1WjesLIKnmeY+XRAtEnuHLPZpvtbECcHXxIFX37+ccjHqO2K46LjKGmrV
	CHa2HzQPc0onQZui6qj+Rsksu1nAR6dk9lF01TzSNMKLx7n0ZuKIFpC/zADWMD9j3YtR
	Krd6DJFNeMExa4C1RUqOVk5xupr9grbH+jCmaSs30IYkUSBkts5l1WL1LKCpGtvQGXZV
	fgaaeUEnGGU0+u3mW0Xrm9clmKn34+ldHKnOAna5qA/cVCjH0QJhQvdakIHH6WJRasn7
	bLA2cevjY9W8s6fvubUuTyBpyrknI3P+XSeN/ZkE0aJzW4/B0ZeusYimw19e69PZSy1c
	Shuw==
X-Gm-Message-State: APjAAAXq0WkVvIKctzN5ZET+h0dutcVOEg/7MiBX10VTDT0v5ib5MrBn
	4Xz4WiRHjDlIjWN7VGdErMzsm43d
X-Google-Smtp-Source: APXvYqx2tzJIc2T68TSx1uTouVML3KHwZIa/V9zJy3bR800X7bS8docaCIVkj0+Gq2zwzFk43nhz4Q==
X-Received: by 2002:a17:902:8a8d:: with SMTP id
	p13mr13833329plo.296.1578929440322; 
	Mon, 13 Jan 2020 07:30:40 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:2dcb:8dcc:2050:e41d])
	by smtp.gmail.com with ESMTPSA id
	q8sm14167646pgg.92.2020.01.13.07.30.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 07:30:39 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 13 Jan 2020 07:30:07 -0800
Message-Id: <ab5cc4a6119527e48299d7d6b7fac440c4b9bb6c.1578929268.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578929268.git.akuster808@gmail.com>
References: <cover.1578929268.git.akuster808@gmail.com>
Cc: akuster808@gnail.com
Subject: [warrior 08/28] libxfont2: set CVE_PRODUCT
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
X-List-Received-Date: Mon, 13 Jan 2020 15:30:39 -0000

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libxfont2_2.0.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.3.bb b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.3.bb
index 2b72d6750c..6994d79e89 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.3.bb
@@ -20,3 +20,5 @@ SRC_URI[sha256sum] = "0e8ab7fd737ccdfe87e1f02b55f221f0bd4503a1c5f28be4ed6a54586b
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+
+CVE_PRODUCT = "libxfont libxfont2"
-- 
2.17.1


