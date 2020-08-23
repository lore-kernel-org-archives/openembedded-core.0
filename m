Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web12.181003.1598214087941640142
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FXlG47PK;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id b2so6269945edw.5
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P6bl1fi9ikaJ4jhDcXR0IA3XC+QunL2cY7YQif7o0KM=;
        b=FXlG47PKkthUt3ypoe3IffSLpFk4sGJ+1ccUiP1onQAdvJ0x3F5d+bGnjQlXtbiBvJ
         0zMijvDJpxXBUfEaTPpHJ4LMBLEQ1Fva/AbckPHJsebkw0a1wmj8mp8wiFDA5oJVfERr
         ddJapsT+jkJNlH88OQJHAQi9YYmJ5Yyibzq4RkBByb/JGHwNRlYnnohcUfd100a1zE9J
         KGM2iE2UZZG0/bomMe+l0yVpFb9N6cswXzXw8I9lm1PMDQFfY/lcZ8M+chGjJArTgTzB
         6sHEYRYl5m8bjRtckdR9yqsudbmSTxpx4Jk7WAkYObYZnIBcPz4+N/A/CRp9GjQVkT49
         QdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P6bl1fi9ikaJ4jhDcXR0IA3XC+QunL2cY7YQif7o0KM=;
        b=PmY3eYPwvtaNu9CgFc7dAykDTIe03FOBcwMTFKNxHfDzmDyC2b7bOLW1futRZCMdve
         A/FA3curqshqAQwYTLicUUK8BfZlxxPVz9XQfh2uCcxgnnrUf05yWOFwr7xdYRS7mKAd
         d116CrRQDcsFETbjmkqbY+Ozsm+GRcrIBPaRdJuru+bwC19l+BadnG0W8kMKD4u8ECT2
         imDAZP4SN4p4vNxP+y8lT5+o83OhpkKTZgs+YSyvzozZXt4Q0a9itvJZN9R3Ma1JomRn
         LXsyw7CaAflBUKGMM2V+jgdvGeP0dK98oZ+WBG97pejfOtZXAROC3jK9BSiNiH43QitX
         xvtw==
X-Gm-Message-State: AOAM532H3k01p6KCKfEV8CjJYwlK2eeUASmgpkkOXHmVGGXL9NHC7RJ7
	qVA2dyJ5Jy5AtDgWD+1ZLIv7VOZWXjA=
X-Google-Smtp-Source: ABdhPJxBiuwP2JEgeaqPTj8p7ayW+NQyXqFWBHf7OJ6AX6hD79XMdw9byS912joyMVuz+Z6a4xSLNg==
X-Received: by 2002:aa7:da87:: with SMTP id q7mr2576041eds.166.1598214086243;
        Sun, 23 Aug 2020 13:21:26 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:25 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 22/37] piglit: upgrade to latest revision
Date: Sun, 23 Aug 2020 22:20:16 +0200
Message-Id: <20200823202031.24686-22-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index e531ffc408..d35117a4f9 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "7d76fca56e8ca72ab6809f6f0234b5971af5690a"
+SRCREV = "2a6a8f954dcd3f748055f28e019d2eca64635332"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.28.0

