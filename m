Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.1352.1610183748775732178
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Jan 2021 01:15:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fgzm6+GV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id a12so11209287wrv.8
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Jan 2021 01:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zj7K/EDvgzgysAIGQpOa8cx0OV4FI9cqz0U3cK4nS18=;
        b=fgzm6+GV5U6sodPfYjSBhtKk/wHDeJUjhAMQwbiAH7zWRKHldNixBt7ci29LMDebAl
         D2mdbKC+Vv89XzeyKEZOEN1mk3Cynu7yY9Uh2mBLE/L0Ik0rT/dZoA2SZIt8AaNAjMZf
         Jw2KhwbFv728T/pgZM7yNqe//2hsXtGiMaRBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zj7K/EDvgzgysAIGQpOa8cx0OV4FI9cqz0U3cK4nS18=;
        b=QLkA1y65jSLCguPna7dZMtsOr00yT8D3dUTstb5SUO7vR1PWFHvHM4MwmlEtRvc7VP
         GlUuLr7l91GNnknRhEs9wuZ7kesZgik/Pfn786J7w6c/FotIsAYHNwou/5rRDu78F/g+
         PNbbbdSKLSX2KPVchiTjVM60r5jNxTTC1F6WUdj6hEoIYmSRZr67pYhBCqtbUCPgqPAt
         ECWfGibHU7teQNZhrHWPUmMpXA39RLzefN05MVPtiwPE+ShWpqiZhsJjU2KkRA9dgHPW
         ysIzy22DOobMb1dKpa99uczt82fu6AwEOCLkpwA9lMd2O0YaZiijRt6KdvJPvSmLXI9k
         h+Xw==
X-Gm-Message-State: AOAM530OJczQPQen0I09QswnJljzNWIibAVxydTB+a/G6YNO5oNDqVLf
	saIFplcOW1SdATgMYwxXBuOdWTTc5+Rttg==
X-Google-Smtp-Source: ABdhPJywh5UuwdyYXUJ33B83H6kQj7pFCZxQ1cpkcbkdAWe63v9b1vmOOHXWXHLVphqbnQmmlQlHGg==
X-Received: by 2002:adf:80ae:: with SMTP id 43mr7417839wrl.50.1610183747103;
        Sat, 09 Jan 2021 01:15:47 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9f59:d30:dcb7:19cb])
        by smtp.gmail.com with ESMTPSA id l7sm14719934wme.4.2021.01.09.01.15.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Jan 2021 01:15:46 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Update for arm host and memleak fixes/cleanup
Date: Sat,  9 Jan 2021 09:15:46 +0000
Message-Id: <20210109091546.655344-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pulls in:

makewrappers: support architecture-overrides in wrapper modifiers
makewrappers: fix Python 2 hangover
Fix some memory leaks
Disable deprecated function warnings
Silence switch block warnings
pseudo_util: don't overrun strings when looking for keys

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 7fa11a54e7c..29fa9152e2d 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "1ee9a1e05e200f189f6644411ba9304e8a479b0b"
+SRCREV = "f9754ac14672c4af19b77bc698a1a808b0828265"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.27.0

