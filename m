Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.966.1599081256886666309
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 14:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qSAaa6qV;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id q13so669559ejo.9
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 14:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UdBjmWgeSNi+5rvQJ7SXku/7dv+VfQV7YvJ+koHdHk4=;
        b=qSAaa6qVm9+6eku7X7+shXOyTnLfFymI5EVEt7TgBe70SomUud9vpERZkg0iame31b
         3JHqmXpse3ijUCIzAWUrk/Q2A/Hhf4yHvpJnNyxBGme0SfksyMpsKNdqHJHr2UAYCeJo
         Fgqez+r5Hjc4chOoKbsR7wJYNvGBfLjKDvpvCDU9rDCwKF52dUGfbjuoBN+mExlrNR7C
         1Ry1MNj/dAIbYDBwyegRamyDHvt5i2oH4j61yYrIboWl0aEpRNp+8KseNQfl7TNFDbpl
         Y+AdmMK1EZhxr5gLZ//LAVBksBpGgnUF9BEdHtI5GRQGF79XQH4LH3ZpUAp0zQXS3fNw
         QV8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UdBjmWgeSNi+5rvQJ7SXku/7dv+VfQV7YvJ+koHdHk4=;
        b=hjC91RqnTLhSIifOyHfZhzJ5EQGl8zcPLFK1IBTwIXK2R7/MxDLSimi1ajxO3jjB8W
         ne/bVz9r0TYtAIAwE+NqTT16cxpYTNlou6QiQdcs0xwT0pYkYhBTQXm4tp7EO11khhkQ
         iAjqK72WErpJ7LhqTjxJkdm8pS9xSf70tiTJ+RGM4ZNDheFaWb1jLewfL85TwiMwlooD
         X3Li/fjwpycHkubDg/5Irvs02dn7QjJaPfzvVZq0mCLQCW9AAeA4csstA5c1Ey4ycrit
         dE4Nwkjhs/gA1nWt+KPj2Z7uSw2YgX5SoBeJcudAJu+tDCAG3POBN9xoH1MjjZLmzk/L
         2lYA==
X-Gm-Message-State: AOAM531kiz5mLICj/oUKqTKlcea7tMkGA2wzRfTpgxcZdp2f1zDTZF0P
	XyqrqT865hX7qVY4qp7XS1tn6edBaUk=
X-Google-Smtp-Source: ABdhPJynO4NUDhWM8yMbLZLNsjiicImmdG81GKnkdAHsWFea5+kLDrFgBvH9q+HGGjQvxmvmsRF8cQ==
X-Received: by 2002:a17:906:71c9:: with SMTP id i9mr68447ejk.250.1599081255037;
        Wed, 02 Sep 2020 14:14:15 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id ch29sm631607edb.74.2020.09.02.14.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 14:14:14 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 21/23] libx11: update 1.6.11 -> 1.6.12
Date: Wed,  2 Sep 2020 23:13:28 +0200
Message-Id: <20200902211330.4853-21-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902211330.4853-1-alex.kanavin@gmail.com>
References: <20200902211330.4853-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../xorg-lib/{libx11_1.6.11.bb => libx11_1.6.12.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.6.11.bb => libx11_1.6.12.bb} (93%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.11.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb
similarity index 93%
rename from meta/recipes-graphics/xorg-lib/libx11_1.6.11.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb
index da47a6d9ec..de7f1c366e 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.6.11.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb
@@ -14,7 +14,7 @@ SRC_URI += "file://Fix-hanging-issue-in-_XReply.patch \
             file://disable_tests.patch \
             file://libx11-whitespace.patch"
 
-SRC_URI[sha256sum] = "b1cc4b802058be7e3fb438ee2490f66fcc52ac3b2a14f47a22cbf77638e33606"
+SRC_URI[sha256sum] = "f108227469419ac04d196df0f3b80ce1f7f65059bb54c0de811f4d8e03fd6ec7"
 
 PROVIDES = "virtual/libx11"
 
-- 
2.28.0

