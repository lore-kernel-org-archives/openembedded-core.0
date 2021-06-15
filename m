Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.6326.1623744782995193275
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 01:13:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NPemF2zE;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id ho18so21067958ejc.8
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 01:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tPCduklUVXvgE1dw1VnosJmyuX6cBD8YmpbygVWfDP8=;
        b=NPemF2zE3kI42K+WMGrrm893w5d2OB2CttdL0cM0OIf7frJ8ADkzIZfpJbJ6rUj2bV
         JPtg6Pnf9Dr57uO2EFiSoe1W7HLWVplM4C81nGKXK1vVEeN96Z6v5uORraJi3zun34Dv
         8Ni/IBLhb5lTwVUAuHO04sIibDDSKOFlHp+9hvPWaYwmY06eUBnMjCue+0tmCG9Yr0X6
         nqf9XVhWhQnJ8l86u+Z75NKlfYoouHPGPxqDLQvgI0uhc9WGCA28823dx+gyw8mWHFAX
         Ocqq22p+kRkz1yJYthwEQexqVZO3vpRQsWe6iRX2SIV2lIi/jzJo1+dzSennHqoMzTIK
         YqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tPCduklUVXvgE1dw1VnosJmyuX6cBD8YmpbygVWfDP8=;
        b=eFZH26rsPfj2UQhC/WQdqufSU4ems3SrSAcnKzxRebwli1Dayfd9e5Ba6bZ5o4A22M
         wyzAT96I7vqmeUGrEMEOlJUXW7hM4mEZMeHiViC1vhnBlkCYW0AfsiXEaIyc18+WLzqS
         Y+Wyo8He4t8zLMYIdpWpVjDkZIP7GbQed2bYQbbL2P4cMGLyWo2mLT0xYZQJUyZttXRT
         SWakC+eMDlJYqv+XZXFZInbyoOQ8HR9rXA9D7wm4mbrkKVxksK0jw9R23WvXnjuvS0hE
         u2Vq3aiqi5PJWHaGa47YeNjpCvq6A1+Blk97/3JIxFAgbsRSpzAU0oAMq28/83CKjLf8
         UUZg==
X-Gm-Message-State: AOAM530SIGns9k8lNP9MRAmoIFeO8RNwxOevMLV7Kr+YT927Dbk7LEHB
	NfCJAoGUQcZbMTDx4i5GZ3GuZyDkb5vhtg==
X-Google-Smtp-Source: ABdhPJwIuhZwgazaMynEKiBMKZFvBNXFyEYvQ5/mK3OQU7Xu76Zgle66qooVMEjbUOt9E5rjGPqxQg==
X-Received: by 2002:a17:907:2044:: with SMTP id pg4mr19599327ejb.447.1623744781523;
        Tue, 15 Jun 2021 01:13:01 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id d2sm9118602ejo.13.2021.06.15.01.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 01:13:01 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 24/31] puzzles: upgrade to latest revision
Date: Tue, 15 Jun 2021 10:12:33 +0200
Message-Id: <20210615081240.1734087-24-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615081240.1734087-1-alex.kanavin@gmail.com>
References: <20210615081240.1734087-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-update: copyright years

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 69c3faadcf..44fa597008 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "Simon Tatham's Portable Puzzle Collection"
 DESCRIPTION = "Collection of small computer programs which implement one-player puzzle games."
 HOMEPAGE = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=93c2525113e094a4a744cf14d4de07e2"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=6e7d24cf1c949887ee9447a1e2a4a24c"
 
 # gtk support includes a bunch of x11 headers
 REQUIRED_DISTRO_FEATURES = "x11"
@@ -17,7 +17,7 @@ SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "c0da615a933a6676e2c6b957368067ca1bc10abd"
+SRCREV = "8f3413c31ffd43c4ebde40894ac1b2f7cdf222c3"
 PE = "2"
 PV = "0.0+git${SRCPV}"
 
-- 
2.31.1

