Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f44.google.com (mail-pl0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id 56C9878ABA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 22:57:41 +0000 (UTC)
Received: by mail-pl0-f44.google.com with SMTP id w19-v6so4587421ply.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 15:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PS1g9GPa4HSLie6iMM5FcZuQF9ox0d0sLaCJltM4uq4=;
	b=U0uAZ4L3af0nzRnozLpZKvPzEglqDO0P0h8g2wTXlzxx5UhKrF/q8ynCge3390DOYq
	2q0lydciGWbY+K6Hz8cQ4LSYMmI3wtHj7mv03rASflW+3D5qWKwM09WR9Fm2+NLIBFjD
	4NWlBG+Ej4GGBFi/JMJvt+TgcrjrUx+FPmahNHZW4wFRmkxfHGzTId0OhAt4HNUTxDtE
	HGqyJot1Q0/o3jmylNRoLsPfPA56QY/N0os3qoy1SoST/s360MYhVQDPC0JjsGd6+QOR
	FUJGrxvvplIqyONb4K2vI4GsW892hDfiftfqj9ZGaCarcKBeJ9PdpjwhBBI1t6edfcHI
	NfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PS1g9GPa4HSLie6iMM5FcZuQF9ox0d0sLaCJltM4uq4=;
	b=W/K8A+lJLArNvWsdLgaj5HBRGqW1QGOOl+EqUGbq4Z14Lvq2KPv2YLq0BlXBWqVKr5
	uBiMXIbiT4KyneRAWEhiADrN8Sd9qW7aXCAcNGh7WIT08gk94AW1Uma2th7Qr2UuZIH3
	70rJn8wK3nz1mDbawB0S95EdxMJ/Ib0nemCH7NXLuJbb/sKyM2sgsOhoOyf5ZCyYwF/l
	Jg0aKKQNtoa8S4HR5o4GqhUPgrshvG7THMJqn1Ne3h4Ps4/u98ndHhtihlBLEyHGVP0K
	JAJXiMeNWsxob1blyj2NFZjxoxGgkGntL+zE7yDmypy+jIQ4KtqvT63h5rWUha/FZxAA
	KDxQ==
X-Gm-Message-State: AOUpUlEIQMbPzFRPlZYdaEndHVXB16TJqS15oSz2W/Nh5UoSTm01ZbFI
	o96Qr59kRpvrnK2Sz1f0YbdGLK9V
X-Google-Smtp-Source: AAOMgpctOR6HS7r6rcqxoJtrFZpsWdTDIU9r0pk98TSz6HOREEx/GuNh7juP0Ej0HrKI1aX2EhZzNw==
X-Received: by 2002:a17:902:290a:: with SMTP id
	g10-v6mr15527055plb.110.1533596262124; 
	Mon, 06 Aug 2018 15:57:42 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1d00])
	by smtp.gmail.com with ESMTPSA id
	x1-v6sm11993137pgr.59.2018.08.06.15.57.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Aug 2018 15:57:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 15:57:11 -0700
Message-Id: <0872912754137df00107c4736b6bf7bea80fdd34.1533595822.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1533595822.git.raj.khem@gmail.com>
References: <cover.1533595822.git.raj.khem@gmail.com>
Subject: [PATCH 14/18] libxcrypt: Provide virtual/crypt for target and native as well
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
X-List-Received-Date: Mon, 06 Aug 2018 22:57:41 -0000

virtual/crypt for musl will come from libc itself

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tclibc-musl.inc       | 1 +
 meta/recipes-core/libxcrypt/libxcrypt_4.0.1.bb | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/tclibc-musl.inc b/meta/conf/distro/include/tclibc-musl.inc
index 052ae0e23b..8badbbb40a 100644
--- a/meta/conf/distro/include/tclibc-musl.inc
+++ b/meta/conf/distro/include/tclibc-musl.inc
@@ -9,6 +9,7 @@ LIBCOVERRIDE = ":libc-musl"
 PREFERRED_PROVIDER_virtual/libc ?= "musl"
 PREFERRED_PROVIDER_virtual/libiconv ?= "musl"
 PREFERRED_PROVIDER_virtual/libintl ?= "musl"
+PREFERRED_PROVIDER_virtual/crypt ?= "musl"
 PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-glibc"
 PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
 
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.0.1.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.0.1.bb
index 6ed67a6761..f21029cdad 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt_4.0.1.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt_4.0.1.bb
@@ -24,9 +24,4 @@ S = "${WORKDIR}/git"
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE} -std=gnu99"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir}"
 
-python () {
-    if not bb.data.inherits_class('nativesdk', d):
-        raise bb.parse.SkipRecipe("Recipe only applies in nativesdk case for now")
-}
-
 BBCLASSEXTEND = "nativesdk"
-- 
2.18.0


