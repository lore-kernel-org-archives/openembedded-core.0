Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30A2C25B74
	for <webhook@archiver.kernel.org>; Sun,  2 Jun 2024 22:43:42 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.70310.1717368221550723836
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jun 2024 15:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Zv4vlOZe;
 spf=pass (domain: konsulko.com, ip: 209.85.210.177, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-70276322ad8so34453b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 15:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1717368220; x=1717973020; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=74fgNKc+rByvQ+OUcwCDYw+iooV+iRenL0xWHkS4Tl0=;
        b=Zv4vlOZeSRQV0MJ3V8HV83n96rVBGphAPJisxokLak0Qi6tNHLHHTZh42ITDLLK556
         dTy/PNa+QFC3MikPMO7HAA7cknMDutDInrx5Y5leCyAo6jHAm8GGYQw5Gp8ApVt3MORJ
         NQt2lmAFApkfebl1H8ZLd6LLKwy2WTyW4qhag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717368220; x=1717973020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=74fgNKc+rByvQ+OUcwCDYw+iooV+iRenL0xWHkS4Tl0=;
        b=jd/raCh5NDrZbRU9m+vY9E3w5YL6dpODBuXFGHww5iOQQkC6kZF2/WK/oG/KJl3W4m
         AYs4r1UaPXUAdT/y+3oSlzHS5ns2zMcXGW0gUlYnJV1yG3CGSD2Du2M76sqeMDB4pxBq
         TD/PsGMIvi+WBdnun1VN6ivuccAv6BbGBtI4S+LfpeuCQZRS49BhFCVBRLre4xyrWifw
         U0+PgPjDIQgRNtHUCguoYo8xM7074j+p3xP4kw5ehA51SNBNfOympnC13ygEz4geLha7
         9HfOFfjeX+VOUKA2oZ6827oUvNeRhfUrIq3MP2yFxJXjkl2Za0oJIj487BE8JVPaZROj
         SkWw==
X-Gm-Message-State: AOJu0YwCMaXKNBAX0Ob/8Ped/JRryMakqMbxrpzjB4H8EIfjLz57kf6J
	AsXdoi/k4SPgv80hZSDCDTzNMHa28FO4EHIfvGlcqrHnlTDtJA/QbVLKN7v/qAo7bWLPonh7zbr
	clSI=
X-Google-Smtp-Source: AGHT+IGbUQWVkVWMGFzZeF7Cbis94InwGpA19FsZvzG9zkI3kgJi4QfGmX3MJ7oKmZok3+gk1fXzAA==
X-Received: by 2002:a05:6a00:21ce:b0:702:51dd:b315 with SMTP id d2e1a72fcca58-70251ddb663mr7468054b3a.19.1717368220348;
        Sun, 02 Jun 2024 15:43:40 -0700 (PDT)
Received: from localhost ([2601:1c0:ca00:bd60:3fc2:5771:b380:483a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702425d8a5fsm4368765b3a.76.2024.06.02.15.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 15:43:39 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-meson-python: ugprade 0.15.0 -> 0.16.0
Date: Sun,  2 Jun 2024 15:41:03 -0700
Message-ID: <20240602224102.1935115-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 22:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200226

From: Tim Orling <tim.orling@konsulko.com>

https://github.com/mesonbuild/meson-python/compare/0.15.0...0.16.0

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Tested by running 'oe-selftest -r recipetool.RecipetoolCreateTests.test_recipetool_create_python3_pep517_mesonpy'
Tested by building into core-image-minimal and then "python3; import mesonpy"

The AUH failed to upgrade due to what appears to be an inability to handle unicode characters in the file name.
Filed bug: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15500

 ...n3-meson-python_0.15.0.bb => python3-meson-python_0.16.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-meson-python_0.15.0.bb => python3-meson-python_0.16.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-meson-python_0.15.0.bb b/meta/recipes-devtools/python/python3-meson-python_0.16.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-meson-python_0.15.0.bb
rename to meta/recipes-devtools/python/python3-meson-python_0.16.0.bb
index ad3cfe17d9e..79a7ff05eff 100644
--- a/meta/recipes-devtools/python/python3-meson-python_0.15.0.bb
+++ b/meta/recipes-devtools/python/python3-meson-python_0.16.0.bb
@@ -13,7 +13,7 @@ DEPENDS = " \
 PYPI_PACKAGE = "meson_python"
 
 inherit pypi python_mesonpy
-SRC_URI[sha256sum] = "fddb73eecd49e89c1c41c87937cd89c2d0b65a1c63ba28238681d4bd9484d26f"
+SRC_URI[sha256sum] = "9068c17e36c89d6c7ff709fffb2a8a9925e8cd0b02629728e5ceaf2ec505cb5f"
 
 DEPENDS:remove:class-native = "python3-meson-python-native"
 
-- 
2.45.2


