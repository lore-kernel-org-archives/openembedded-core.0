Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.6057.1626265585769961165
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 05:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H273YlmG;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id d12so2940449wre.13
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 05:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bqQXl5thSZNZYRMxwC9vzcIma/60RpN/XngxSe/2EOA=;
        b=H273YlmG9k0lgKx8TT3LgGsSW3gAakW2XsswXxyN9L5/6E8SzyNO4Snwkomb1t/2ex
         4Tw6Bu88rE+Pp73LpFdkHSMrutaj4J8CzHSt2O+HZaSp8JL0lXyCf3hOrBbZcBg3cQPl
         /fMddHZNvar3ibnAqja4oj7iMmk3W31Nw9yAW5XTKHQf5acV+DplcpLF1nkIEmsw23iV
         HOSVd3+Ke3mnAqD1WvUhbltWQ0Ak2m7lu7YGmIURVTob35fu1ZhqSTu3Dm0wzsX15/bP
         VVZp5L882Beed5tyirqymrabRmhxjIa2eiuolpH7rsrDnbQlYq99k33q8uZW4C8lN1UZ
         tNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bqQXl5thSZNZYRMxwC9vzcIma/60RpN/XngxSe/2EOA=;
        b=V4955mJgrOvHLpI8DLTVmXPggSBQJiamVtCt4bljPlBm1hHkmmdab8Nx2sRj8V+F0D
         cTbqf/S5slfC1Iqk9R9FZSjZkEoDhItLM81k2z5bSqe9ColKrIL19GJuGLwSJRpLg+XQ
         4NcQhdxR365hQJX+WrEpzrvrkV8A8LxVORLYb3VwaQC55A1PR4AHrIwfuY521hPyzx/n
         gLmqeSwg5eOXOT0kyg9nqqjUgq9roSVc8AQKfbLP/tdy3lTaR1UV3/C3K6jRYdJvjqQv
         FyuYadAV3VpKO3enYrjD5GH457IkUgmcgfkjYkHCjrWwVx806Ad/K6omqVf0jjztbSdx
         HHiA==
X-Gm-Message-State: AOAM533Zd0xpM393OJuzu9KrAmmfVbEczDBFTzxJWJFEDhvJR2kzP6gy
	5nWM/29P49QG/F+w8FzM3MIEnLY/HX0=
X-Google-Smtp-Source: ABdhPJxZBvLxROEWk1H+0r0EM19Ihs9yxSb0VWLmtJrIwrt273BCSMwAh4qcMy/3e0Qd0MzsaIVQ3Q==
X-Received: by 2002:adf:f50e:: with SMTP id q14mr12545220wro.183.1626265584450;
        Wed, 14 Jul 2021 05:26:24 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id g18sm1969395wmk.37.2021.07.14.05.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 05:26:24 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 18/21] stress-ng: upgrade 0.12.11 -> 0.12.12
Date: Wed, 14 Jul 2021 14:26:03 +0200
Message-Id: <20210714122606.605142-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714122606.605142-1-alex.kanavin@gmail.com>
References: <20210714122606.605142-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../stress-ng/{stress-ng_0.12.11.bb => stress-ng_0.12.12.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.12.11.bb => stress-ng_0.12.12.bb} (90%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.12.11.bb b/meta/recipes-extended/stress-ng/stress-ng_0.12.12.bb
similarity index 90%
rename from meta/recipes-extended/stress-ng/stress-ng_0.12.11.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.12.12.bb
index d0cf45f42d..97eaa75d18 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.12.11.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.12.12.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://no_daddr_t.patch \
            "
-SRC_URI[sha256sum] = "971393075321c24c3d5769acfabb705911d1f411ced5937b7cfea58528c1b4e6"
+SRC_URI[sha256sum] = "f27af50f6f2308e707fef927674bdd209a046b116734281b792aeca35a4e4499"
 
 DEPENDS = "coreutils-native"
 
-- 
2.31.1

