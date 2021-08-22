Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.9775.1629636696225254972
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BYLpX3NQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id f13-20020a1c6a0d000000b002e6fd0b0b3fso10514628wmc.3
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SgbUk0nnsMo9IrP+Bf34xpT7RNb4QZX16hdcAYWtgus=;
        b=BYLpX3NQ9g7dgCeXv4YdenzXKJhHsa/gRT2WPlranDCb+c1mOMQQjUroRRDiILvxOU
         Ux4dHWTrpCxCn9ILjr6VW+4G6WiYRrF92/h3J7vzFadsjtlBApciP99PitZNqh5ZV3yi
         9GSktie+SHqOV8nMY/YcdYxgL0nXUyGhBmhwfCYSoMync27R2x5y3iKyDzDBAkrFX1aO
         0F5+RtCbmp8t/QhL17dwiX9QkzVzt4F//6UahYaw1sz11e6k9UqABnjU2UutH/w3qBYr
         nSamWgppjGGCMVmIXJ4RqoyHRvkzBA3t1g0zgYKrYn9odR+lpdEHuWh+x8/dZCMTqQv9
         eUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SgbUk0nnsMo9IrP+Bf34xpT7RNb4QZX16hdcAYWtgus=;
        b=fggkyc6boBeUMmHA8r7wW1S91n4iyyOQBv+I/hYEijqUQJUNrcG4a8cLjQehHu1+Vs
         utu3U9zEVidz8qmFIwAVjj0d3IoEfka4VIv0tZnZF5zACo1hAJwNAB/ykPJ/fC0x6G16
         9LLmb9b7zSpMZNa8ZI9EKyy9EPPMKD33lR/i9ry5xjODzg1LyScNkD24uiO4f2LQi7+6
         9YZAmuWac7X93niCi1rY2tGZJXaGmK7pbaX0ZtwJH+PGPTpeX5ynaV8dLAvTkNXY9gid
         s9hcSRdHAMp51VaYz8NoEKEKHiCfv0v21+x3cWqnA2PjNPWUA3RK6ywuE4vxymvqWC5J
         MWow==
X-Gm-Message-State: AOAM5322749P/CkgCww6TT/LwyRbnxJ173XR76+gnZMPrRALoDyK98ix
	t7THc4CdYwNGTlUYmlkhmPTsCqbA1P/EQg==
X-Google-Smtp-Source: ABdhPJyQg2xJFo1xEjifKJW6bP8BKwTAsl95zoTKN3is1bMHHeADxbLK3ACnxsfTAL/BpAKxGeVlTQ==
X-Received: by 2002:a05:600c:378d:: with SMTP id o13mr11958567wmr.156.1629636694885;
        Sun, 22 Aug 2021 05:51:34 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:34 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 35/55] sudo: upgrade 1.9.7p1 -> 1.9.7p2
Date: Sun, 22 Aug 2021 14:50:43 +0200
Message-Id: <20210822125103.310416-35-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/sudo/{sudo_1.9.7p1.bb => sudo_1.9.7p2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.7p1.bb => sudo_1.9.7p2.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.7p1.bb b/meta/recipes-extended/sudo/sudo_1.9.7p2.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.7p1.bb
rename to meta/recipes-extended/sudo/sudo_1.9.7p2.bb
index 8d47c01706..9b5b2f3c69 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.7p1.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.7p2.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "391431f454e55121b60c6ded0fcf30ddb80d623d7d16a6d1907cfa6a0b91d8cf"
+SRC_URI[sha256sum] = "28b5ee725dbf89a7852f42f309ca877d2810a9531b4eecfe59f3a84b6b4afca8"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.31.1

