Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.17633.1590940463464336863
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mENQSNdm;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id x1so6857863ejd.8
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pJ0L/MRMFW0luivY0PGB59+75hfWhVYKAvXDLxFRFUo=;
        b=mENQSNdm9fsfJRCZTI/pggD0xReTHbBlUm7talW/rzezQX1QLErXWK+LZ5mAKYfenv
         nAmixi7S3HQZNFascJ/xyK2b42+byvlerXDBqVEV47SZoA0X47YCVct8SqKw7TQD0SWs
         OV1yKS4LotfZgFx29EiquytbKYQxJseHca+f1mfsTIY/MaN60mKNxoehCEUQUL669QhQ
         j0QNOuyUYPQWEAMJryWxJutam/Ky+/kHuxKH1aeBE8hMhYyha+OM1fRIScOShl3/TwE8
         mh+7bxDZRBwvh7bwsT2GYxp7P9NFP3yXiwwR7hT4eKcLkihu3lo16iZt2JcMd9Z1Br6E
         qKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pJ0L/MRMFW0luivY0PGB59+75hfWhVYKAvXDLxFRFUo=;
        b=K6swbtwoe/NUZIfFTPYCmG5w8tqbTa+tjYzpMGVWvxJaotVKQNB/aaPFs/PqY3tNd5
         OWYFxC0Ij6+8n3hPjqHKo792BqCGpNpB/tC1OXV0K1aGNe6C7dmVe3s1mfZS2Vcvbd2/
         8dtFyxvbX+LxHXbWZgCDL95vGVc1GtTi6D1Ut0sJ9KBJXrv29+6lEQgPLpaK3VFbQQy9
         JlJ0W5nnkDzMA/kdZY/mwgUl9pwH70ozCHxyR7pZp9QDYr18hjQMCkjAiUAQsAwrOiQe
         +CQldzXrAldeDgUBOiDG70y+QtqRO5LOh3706xe6rFvUJwzcYgVvHcyYIAJFCwm7bRpT
         eVsQ==
X-Gm-Message-State: AOAM533EypubcCTOA+CpvZmJn8KXv/QxRqVQbvTMmZlSwIB3Gfw5pqlX
	JnnyOlG2e2s92nQXksghqaJXH3oU
X-Google-Smtp-Source: ABdhPJzuDuHGUon9p/9mIoqkZAyHTPnYskdTq+1+39B4iHLABMZEQ2GS+CIXOl58YVZA/ije7cwW/A==
X-Received: by 2002:a17:906:f53:: with SMTP id h19mr15485916ejj.343.1590940461783;
        Sun, 31 May 2020 08:54:21 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:21 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 62/70] mpg123: fix upstream version check
Date: Sun, 31 May 2020 17:52:46 +0200
Message-Id: <20200531155254.10283-62-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-multimedia/mpg123/mpg123_1.25.13.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.25.13.bb b/meta/recipes-multimedia/mpg123/mpg123_1.25.13.bb
index 125574fcfc..6c7b6fa8c3 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.25.13.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.25.13.bb
@@ -14,6 +14,8 @@ SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2 \
 SRC_URI[md5sum] = "294a6c30546504ec3d0deac2b2ea22be"
 SRC_URI[sha256sum] = "90306848359c793fd43b9906e52201df18775742dc3c81c06ab67a806509890a"
 
+UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
+
 inherit autotools pkgconfig
 
 # The options should be mutually exclusive for configuration script.
-- 
2.26.2

