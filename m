Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.2791.1593155941589932295
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 00:19:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bw4RC7at;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id d15so6110104edm.10
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 00:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T4qKuOFQ9WVS1dc0GfUl7PEk0xXX0zJTaXqy6rUXhb4=;
        b=bw4RC7atZhnhoXWz6HfzcrjfqVF2UoYdrJxFKwfe7Hw2ju9U1ips2HOSMJI+/DxoIh
         5fDflssQtF+Ou7tXp6C45xS6hzhLlxfC4YoHE3lh8ZQ2qYKpuJD3syopoPdTdJnSozvW
         JrayWV7sZCC3EEBQGWxLOwpA91XLLKxPx6iZfFo//D+3dNP9T3sHI5bJaq5j7GI3230I
         7KcgZN+3pWkOBrttPT8z66O3Ja1nV6dEVpXPFR7vztXKiveRJQLCviVWGiL8xlmuJ2H3
         3xkQ9OPGbuh6+K6YGHo83Sn6QbOcBu4WTESBeUEy9ipjAVx/JBw7qw6Ml4HX6CLdeC2f
         6YPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T4qKuOFQ9WVS1dc0GfUl7PEk0xXX0zJTaXqy6rUXhb4=;
        b=suGKOquuQuZXv3ciFNymtZ7gi+i6x37nUDlGhFHvNuTAo9WL+QZ9pzCvPdFN4tQIkh
         GgsOixvNFspGIRmahoPbcP9DUeB84QimPKil3MXDlYj4BlWSfPmYdB7/HP1NEH39mfBg
         IEqOWbMjPAvG/ipQW0rqDbtvw1yX+BvqEPHpi3qH2G9BUqhVTSg/wz5meQjAui7ax90P
         Mi9cvAF9GILV8L5zTJ331N48dMqFL/6od9YE/hOq/v1dsi7O0GrJllKrAGDh35PMuKhT
         1bKsqVsKBl9bYr0OrhixoGsVZ4xx+M9SAqy//YHNHkoVeYB0S/7OfhbXFcWnaoHqXZA/
         dy1w==
X-Gm-Message-State: AOAM533peRILlW5+Ore2g0MgDajXODQXyIWHrBX4Yxwzk6CDq2aS6ATc
	iOHqNHVF2yuCxCIoPa5oSvM+jaL3PMg=
X-Google-Smtp-Source: ABdhPJzNEvoxV55JDTAtJv1izLnEeIWEtx4mH9i8fN+6nw9sgaOhiTpdaQpfp24FOppuh48A8jwCdA==
X-Received: by 2002:a05:6402:1d18:: with SMTP id dg24mr2005312edb.33.1593155939752;
        Fri, 26 Jun 2020 00:18:59 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id p4sm20826194edj.64.2020.06.26.00.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:18:59 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 01/30] dnf: upgrade 4.2.21 -> 4.2.23
Date: Fri, 26 Jun 2020 09:18:15 +0200
Message-Id: <20200626071844.29134-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/dnf/{dnf_4.2.21.bb => dnf_4.2.23.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.2.21.bb => dnf_4.2.23.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.2.21.bb b/meta/recipes-devtools/dnf/dnf_4.2.23.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.2.21.bb
rename to meta/recipes-devtools/dnf/dnf_4.2.23.bb
index 44dab1d8a6..8cfd4d0c89 100644
--- a/meta/recipes-devtools/dnf/dnf_4.2.21.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.2.23.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git \
            file://0001-dnf-write-the-log-lock-to-root.patch \
            "
 
-SRCREV = "864c381baabf024c299dca75abfda96139b8f583"
+SRCREV = "126d861812f827285960592359615ed7cb195aac"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.27.0

