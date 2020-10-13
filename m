Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.807.1602610544514354865
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 10:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eA+2gtYL;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id n18so286375wrs.5
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 10:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6c+OptBx7fpxblBe8EOl4QOKjWsHa41Au++9FppwxXY=;
        b=eA+2gtYL6Nds5GJpcgQ4LNeQXRibkcHhsWCAx0bRiB7fjlhDNowWDiNCbLftOLKkHb
         wddFMpz+JKzGj7mFArXwv6nwUDk9rE0dE5ju9lIw1Z+pSFXC4MbIu7WPjZiio9lQA1rW
         V8Gu9RJwVGSMhY6kaJoGIX0dDkY/gFU6Pt66dRnaksrHXluUmDkUY4PlRshLeBlPtyvy
         WL8ibFNLouuYwO+N0oR9if0gN/NhMmr/W6Is9M5GV2sw4D0EmWbOMo2Vi4Ne3nB5L3Fx
         8aQZ1s1xFgM4Tbv2RaeIuTEelWThcgK+74D99dTQG53UNHkwkKw/ylJiv3SdJp1za4Gn
         kf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6c+OptBx7fpxblBe8EOl4QOKjWsHa41Au++9FppwxXY=;
        b=kbVda/Ty7DEW/7+gfjwk46ZqqV2eh05RKh3FI8BA0AWLmQ0D1z/mu0+XyCoS2KQbsy
         JUFrJT4jvnH+UfVjPyNvorsKeJAtIdEPUrOfqUOsUOn0QqlxPdKdUGKKhzuG2Fm+x6H7
         Eo4a980619os3iKtKJfKwr3M+TPSjH2bmwel/hWvn8cS6s6lRBlyRaEeEh5HVa7WnBEX
         uTAExJlu9O7NEkOGd+wKhkkCGRnhiQzDcOAOlN66TPFUIitGMQTK5/jicrU52RW/ULZb
         X56t8qwTAul5FH2BaGShjdqybF2/pEBisZBlcZxPy0ZEbVTGAEhtV/t0DB3A1J8MQGcu
         d3bw==
X-Gm-Message-State: AOAM532mDSDhKb31YCS/6ngL9VXBaGeLYztirfHeZn5CoFDhumTqrW0l
	7shEUhiE6pGuOBzbzVuY57QFQhw+2/9RSA==
X-Google-Smtp-Source: ABdhPJyLw91PAr4VJTuG8SgmolegeIia+l0MhoO3CRjiTJwYNe2kwR/Eg6NXFYtwyPkyhUNLVT3MIA==
X-Received: by 2002:adf:e801:: with SMTP id o1mr815906wrm.359.1602610542909;
        Tue, 13 Oct 2020 10:35:42 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id w1sm297412wrp.95.2020.10.13.10.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 10:35:42 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 5/5] shaderc: enable only native build as the target is failing
Date: Tue, 13 Oct 2020 18:35:02 +0100
Message-Id: <20201013173502.2245733-6-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201013173502.2245733-1-quaresma.jose@gmail.com>
References: <20201013173502.2245733-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For now, only the native build its working.
The target build is failing, when we can build for target
this commit can be reverted.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../shaderc/{shaderc_2019.0.bb => shaderc-native_2019.0.bb} | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2019.0.bb => shaderc-native_2019.0.bb} (86%)

diff --git a/meta/recipes-graphics/shaderc/shaderc_2019.0.bb b/meta/recipes-graphics/shaderc/shaderc-native_2019.0.bb
similarity index 86%
rename from meta/recipes-graphics/shaderc/shaderc_2019.0.bb
rename to meta/recipes-graphics/shaderc/shaderc-native_2019.0.bb
index ac3db09937..4e095e1243 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2019.0.bb
+++ b/meta/recipes-graphics/shaderc/shaderc-native_2019.0.bb
@@ -33,4 +33,8 @@ do_configure_prepend() {
 EOF
 }
 
-BBCLASSEXTEND = "native nativesdk"
+# TODO: for now only the native build its working
+# the target build is failing, when the target builds
+# we can drop this inherit and rename the receipe.
+inherit native
+#BBCLASSEXTEND = "native nativesdk"
-- 
2.28.0

