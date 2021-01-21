Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.1599.1611246853016617174
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 08:34:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kw6h0F+i;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id z21so1695013pgj.4
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Jan 2021 08:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=2rbpVUVMvrxl5ebN68szlyAIVFB53gGMWFRcZCKyrCk=;
        b=kw6h0F+ipc5kDLhuPp5G8bNB1xWzWVzRF3FoyryIHSt3svWjYWy54KOjVhyZQR2mLB
         VN0jb+eY7ljWSpJChhaC6JhYIwx4aIjgFbGylCiBcdhPvFfjipqpOmfLmgALO4rJqwG1
         tvKXr+2SiVpQmDWyKDnLCQUlY2KFTA928gskBGCz+r4VSG3jfv7TkAq02d9RwWmMH1uW
         UpAcRb+xMOvTkPKvWHm6O7IPQPrrBuSEhfo8dffHemOqke2rsTFDZG0Qbf6UmvAkp8iZ
         qbLXcBRRwFFi5/XiGa459oKctKUNwJsrWIP7X23l81gseg6lm5RaQVNe/crb7PAXB+lU
         e93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=2rbpVUVMvrxl5ebN68szlyAIVFB53gGMWFRcZCKyrCk=;
        b=UNnmPsDlLP8VHNSX+97mUBIlt5YBEOnufCA30kXDHksN/uOHpaRrk73AKtwub+NLVL
         IRdGiI0NoxqJhWwlYd/pjrQFGHvcVjyTrHTup65KF70FJ0ciN6h7Lzgm9gAVUEeskq6I
         +NTCd91kr1P8tFzNDmnLQuHg9ybDOad4/7e1vh2ZDUAbM6EHEU8/G9HYhf/cQMiPYmGZ
         ygKontpmx38MfFboPcHefwsXIllwwEfkGNdIISMc+Obn9eTP1O0KYBV8KJhiDMFSHaf+
         3aaOnglJaGKjGOhCROd8BtzFXLqip6nuY1T3RC8wJoDbTM83NM/oJtQ6OxaJS5FFoKAI
         2JUg==
X-Gm-Message-State: AOAM533+Iy8uS4RIaRyXNHAPCYdTYhojohmJkbNKQVQhYhgBTdPLQU8Y
	cdyqjj1raUXsbuk3BtQ1WCshLxCsNAsnzg==
X-Google-Smtp-Source: ABdhPJwXusboCJbcm9g1ZMWU5s8gh+xNISx+Zst5ucpf1C628uHZDHLGBJMjTMPQ7YXDZrAxfLFqVw==
X-Received: by 2002:a63:e814:: with SMTP id s20mr52439pgh.365.1611246852023;
        Thu, 21 Jan 2021 08:34:12 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c089:d7d0:f232:b36f])
        by smtp.gmail.com with ESMTPSA id d11sm6556234pjz.29.2021.01.21.08.34.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 08:34:10 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] git: update to 2.30.0
Date: Thu, 21 Jan 2021 08:34:09 -0800
Message-Id: <20210121163409.27382-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

For your info see: https://lore.kernel.org/lkml/xmqqk0t1g326.fsf@gitster.c.googlers.com/T/

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/git/{git_2.29.2.bb => git_2.30.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/git/{git_2.29.2.bb => git_2.30.0.bb} (51%)

diff --git a/meta/recipes-devtools/git/git_2.29.2.bb b/meta/recipes-devtools/git/git_2.30.0.bb
similarity index 51%
rename from meta/recipes-devtools/git/git_2.29.2.bb
rename to meta/recipes-devtools/git/git_2.30.0.bb
index 6433a2e2b70..93f8ed298b5 100644
--- a/meta/recipes-devtools/git/git_2.29.2.bb
+++ b/meta/recipes-devtools/git/git_2.30.0.bb
@@ -5,5 +5,5 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "869a121e1d75e4c28213df03d204156a17f02fce2dc77be9795b327830f54195"
-SRC_URI[manpages.sha256sum] = "68b258e6d590cb78e02c0df741bbaeab94cbbac6d25de9da4fb3882ee098307b"
+SRC_URI[tarball.sha256sum] = "d24c4fa2a658318c2e66e25ab67cc30038a35696d2d39e6b12ceccf024de1e5e"
+SRC_URI[manpages.sha256sum] = "e23035ae232c9a5eda57db258bc3b7f1c1060cfd66920f92c7d388b6439773a6"
-- 
2.17.1

