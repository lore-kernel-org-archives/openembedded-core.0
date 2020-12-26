Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.19465.1608974880359657458
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:28:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UxiCKVE5;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id ce23so8295797ejb.8
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rUSOFCAbXAYnmHLeYWnuZMp5gYQ/YdEg9lDnKET9yJw=;
        b=UxiCKVE5XT0Q2hFJi31keXDeiFH88dpdMv/Pqgwx+qyxjoVD95icyfAvLBGgzaV0HK
         LyuPgyZWSdqy51omntCy+x+1Vbl5hlrY+MczsndCTkyzkQ9Sy1D77RxMGE3e8RNELQqc
         JqrMQLzK3Wuh3LSAXY28SXmGcitLMA38ySyAICbG3laLOc9IdSgaTTIsy4lxQi0Qy4OS
         L9ttc/ojTpz3d3UpaWUhZjfAuR6Zm43GWqinf9adSlCVrBFpCp9ppSPX9YS+gyP8fu9t
         GvoMq13sctNcbtqC2xJ6IDDlC6DHtvAQ5SRwo0oI69QFQH6x+5ymbviirthepO9zYpjK
         ry3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rUSOFCAbXAYnmHLeYWnuZMp5gYQ/YdEg9lDnKET9yJw=;
        b=neLKkzXM72tYCmwJOSD6P2v8IGJwr+mCb7k5oc5j1FiHU2AKiu98mFMCZFfxpf3eZC
         nXuLjdKcpJY8WvdSFLEqTd/8o2wN7QPqGQs/NZZY4ZTKrXympskUY/C0EWDrD9ZxouRC
         eVjtFtvAG0f4lLTgzQpSk+xi9/iaAyk9vxCOKeho9eJTflqwNJQNkhu7arIkT3jONFWB
         7pM0kVsU6iLl7ob+whlE/Alu3oHawy9TUFHC+oT+o9UOCyQ125qfk2JiAGfh9W0VDywA
         R9pIKXXS2ffohK+SytVNh17YzKP/pKexLGDSk/IupjMB0NFb03zOdJMCUMOzspQzOMSN
         Ejag==
X-Gm-Message-State: AOAM532+foObG0tdfkAdJe9Xhg9om2yOaunujjYX8/DZBsv6Kow1g3rI
	id+DnyQGBJVY3D7dVMYXfXOILzIWN/U=
X-Google-Smtp-Source: ABdhPJy/X2bJSb9DoYC7GOU6Bcxb2p2CTbkjM2OjPZSz8PdwQQwOK6IH23Lq4yI1AKcHbDJ7MMl9kQ==
X-Received: by 2002:a17:906:2612:: with SMTP id h18mr34944295ejc.469.1608974879041;
        Sat, 26 Dec 2020 01:27:59 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:27:58 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 21/48] puzzles: upgrade to latest revision
Date: Sat, 26 Dec 2020 10:27:05 +0100
Message-Id: <20201226092732.52323-21-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 8e4d5b3349..5b65cf8655 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "9aa7b7cdfb2bcd200f45941a58d6ae698882a2d4"
+SRCREV = "84cb4c6701e027090ff3fd955ce08065e20121b2"
 PE = "2"
 PV = "0.0+git${SRCPV}"
 
-- 
2.29.2

