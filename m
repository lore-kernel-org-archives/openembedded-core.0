Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.9855.1620227981004065510
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hgWrW0iW;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id n2so3455130ejy.7
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U4raqMRyh0oItY9kmydAAcJ6KXfwJdx9/3BwMRyTfgE=;
        b=hgWrW0iWnUCmn6U/rvnM+8IiPrOR0CXFi8XiYsYu2drarMEGEqt1NRHhqpZA24Jg5h
         VUFx61AU9yJkjqBHsZzgU2xcuMdp3JWg+LVKju1+Diu5BmARH/IlU9VGh62JBBBAns7+
         pX09c1h3hxfXE+r5P+syz6E8/aHg/iNyB/Lkz3Zq5BWWHQmkSA3H4bvs9MD9E58um7OJ
         dJvUJ/7cvS4K108SpjkXaPKcGXtthYkU4BuVlIuDv+IqrKCCLTTKWWKfdUiFULNCuJMp
         iNwAAhVTipIovw5iIvq978KHsx6oKyG7Wh/xek36xRcyeh4TYkfY0y/n1og7xTWpJsDJ
         9wOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U4raqMRyh0oItY9kmydAAcJ6KXfwJdx9/3BwMRyTfgE=;
        b=COHLp1cm6jh7zGy9uvGkbtzkLfjwU97wyuZSXIOt0grz4I0HjO8iEpjiiaKLrisIzI
         Bq3FQa7nWwD6o+0TguasJohet64M+9CjnEpyv3EQ9CjRiq/Qhppm/ZBiwmuJ5F4PdvbF
         UhA+oPjxt0ddgXl5TxKn4ilSIQvL/xuX4brpa1ilLJiFRo0yow2myxXKugrkbWDcaPzQ
         P9DE4oBDzjSjIiKITxh05mUosuUD/v0Sw9+5q+LTeDVQfsBtYbDvjxReJ+iTSVrIdaWZ
         Zg9IyFR2412aoPoja8S5kTbxt7gw3+pwE2z4puNJHNepR2itB8COk9zGd42SQVRBUl/R
         tgrg==
X-Gm-Message-State: AOAM5318htZUUssYUg121J0U0obMcZtPeVqrr7a1icSkj0odwwIB+GO2
	oYwx29p23+lnI34SBnYmbNweUtRwUO2xig==
X-Google-Smtp-Source: ABdhPJxkYDylgw/v2TlRTBcHzzxy7idyavrdf96XO/ptaJNLp56yHcyB4407HQYobn0Or6zYZtEfxA==
X-Received: by 2002:a17:906:5855:: with SMTP id h21mr28326363ejs.522.1620227979671;
        Wed, 05 May 2021 08:19:39 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:39 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 53/61] x264: upgrade to latest revision
Date: Wed,  5 May 2021 17:18:42 +0200
Message-Id: <20210505151850.660512-53-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-multimedia/x264/x264_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index f95fb0c41e..81354a8fd3 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/mirror/x264;branch=stable \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "544c61f082194728d0391fb280a6e138ba320a96"
+SRCREV = "55d517bc4569272a2c9a367a4106c234aba2ffbc"
 
 PV = "r3039+git${SRCPV}"
 
-- 
2.31.1

