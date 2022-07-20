Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D6BCCA486
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:04 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web12.51534.1658306688169368332
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZlkF14Hu;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id k30so22838862edk.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l565ZpaP266Z0g/sj65ipXYn0dOpZk/FbdCaATaEjQ4=;
        b=ZlkF14HulT5NhRZZXbKA5O8N4KM35cuE+h6x5xNz4Swt0orrK/scXZdBYceVvpeiNk
         eK0kMwPmRTwoFYZe5+0npQkmGtnX0oD4Rhp8g8eIXBlbdNdBUZ+pZsSkQdYtJDj7hbFx
         Kz1Uj16eAHbXEdFGtKbDK/M4UWxTlJAQB7ahuDMlZPnqG0PJqiP5mFTxQhfcozhEV1vX
         FFGjoJw6llyt6fbuZMcwVJ5ez79QsmoM7KZCo/U0jl+oe8jtC0HNeJ7ZA9TxUHJHPDZV
         VZW9py05NKTdmvlpP/7R3Nb9kmbo/nFOiUuBLzuBLg7zFhlK/5STgd0zHMFnGN/lfTBu
         I3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l565ZpaP266Z0g/sj65ipXYn0dOpZk/FbdCaATaEjQ4=;
        b=KSuRW4rEYINiRYvGqdonXR6pyQkoreeVDrUEWWWlniFF1FGE0wcbEu1QBzWBhsvsRf
         E+099Vadmo05lb+oWap17NkzDqlqQMiGXiaQFZGx9A3G4jkZ5dI0dgGxYFuHyl+k4oIJ
         Vk3eacWM9oBYEjhTlXaV9mHnEV5Sr3DcDShsajiKc3qRxEJoznqgtQQMmmj9gqFIp/GC
         vusCNMswseF37EY9WqqJRTm/+vI1dB30BwUv22SUJ7hVmCBREMD3ybOdh41v6MpjXecR
         +G/8ZxdIE/Q3+r58LBKJNwoJSdrj3AIq5IAWwjsFDhgPRe8PiVfbwI2hpM+iraDyQ2Va
         UdzQ==
X-Gm-Message-State: AJIora9hVye00yM5zob2arGUO9hpaCvjnH/U3o2mLx5q+QqBn+swm9Bh
	AYmfprznHlubtzu/6v+YnaDbpgi3I7c=
X-Google-Smtp-Source: 
 AGRyM1tUNQqt2fES9W0jwIpnPdgiLUD24brM94tacQGQMCHo6k5m9+u5lO8Gn1Lf6LgbLqDk66B8lg==
X-Received: by 2002:a05:6402:26d5:b0:43a:bf2a:c27b with SMTP id
 x21-20020a05640226d500b0043abf2ac27bmr49805125edd.61.1658306703681;
        Wed, 20 Jul 2022 01:45:03 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:03 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/51] font-util: update 1.3.2 -> 1.3.3
Date: Wed, 20 Jul 2022 10:44:05 +0200
Message-Id: <20220720084442.2940187-14-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168307

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-font/{font-util_1.3.2.bb => font-util_1.3.3.bb}     | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-font/{font-util_1.3.2.bb => font-util_1.3.3.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb b/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-font/font-util_1.3.2.bb
rename to meta/recipes-graphics/xorg-font/font-util_1.3.3.bb
index b3e832756b..64c705770d 100644
--- a/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb
+++ b/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb
@@ -16,7 +16,8 @@ RDEPENDS:${PN}:class-native = ""
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "3d6adb76fdd072db8c8fae41b40855e8"
-SRC_URI[sha256sum] = "3ad880444123ac06a7238546fa38a2a6ad7f7e0cc3614de7e103863616522282"
+SRC_URI[sha256sum] = "e791c890779c40056ab63aaed5e031bb6e2890a98418ca09c534e6261a2eebd2"
 
 SYSROOT_DIRS_IGNORE:remove = "${datadir}/fonts"
+
+SRC_URI_EXT = "xz"
-- 
2.30.2


