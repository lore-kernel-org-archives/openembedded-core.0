Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.17645.1590940444661557052
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=geR7EeuG;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id y13so6886522eju.2
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QlTOr2Nf6nT2AgWlzhpciFW0vTBlMPz0nc8jzpyEikM=;
        b=geR7EeuGsaZGfOa9hSc7Qkt/XAt2SgMwMAr0LSV330U3nG05T3NT6nUzJVem7R94p5
         cz2Fr0mssQnglM2nS+Cx4PrfJjs0ufGjc4mzzeuVi8tMWZInJc7bLfx1N54K2Uej7PIh
         RNa6xFf4Rf1FD59risK91WkjA5UvUAMmHJCVTs9Y048E4JQ6nUrIftRUKZUTPJVpEsED
         ss2GahwAo0NHIMTUlEBbvtbr6CBGNPq9IbF4LYt22C0bBMYmiTYzck+um+r6/yAxReII
         SihsXEBdTa5XLDkdBsn4/3zPumyJE5sh/4I5dW660oAgoLORxXyushp4TMJuBiE3UhpO
         YnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QlTOr2Nf6nT2AgWlzhpciFW0vTBlMPz0nc8jzpyEikM=;
        b=DaLmtXxAurX6lP+cBexKx3AJCCsPvRp6mKSWbvjePcH2YGaiokJeaHOqt/GFAIXH6w
         MWcnz8AX5IspXI2lrISK/aN1CAkkk4zc7p/MOVGwjMO4Kt1uRgybktZHg+NNw0A9Sm+U
         t9eytBQtz5DLSYLkdMmYv0gCgfT13jbufasVu/G0YYkLo6Id1Jp9a59f6aeu4Uvgis3h
         cLICLoBvr+WObMZ9OVL608l8tH0TaR8ZspQn2MzHrbgCy8EE8Ms1aB9KTeado5BVG0o3
         AKgTmB9lh2XwMSlx+nEobQVjDH0eeffIkK9WX7t5GqEVvfHoZG819jd/uU8YLmS2CONi
         wrvA==
X-Gm-Message-State: AOAM533jbhg9ugjj575pYoUYJyGKxHsU09dKC8Wdatfryd9eVlnh5fM2
	zI5rgMShlBFCrr/CEo+PnKwcV7dw
X-Google-Smtp-Source: ABdhPJzxIYn3+U5v9FKK677GjJQQBdTEZMcRMy2e8o+lJsL3YiuxapZ+mXQk/SmyOoIOy3KGmje0oA==
X-Received: by 2002:a17:906:a8d:: with SMTP id y13mr15559346ejf.455.1590940443076;
        Sun, 31 May 2020 08:54:03 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:02 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 41/70] x264: upgrade to latest revision
Date: Sun, 31 May 2020 17:52:25 +0200
Message-Id: <20200531155254.10283-41-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-multimedia/x264/x264_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index 39429a8809..1ff5348b9e 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/mirror/x264;branch=stable \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "1771b556ee45207f8711744ccbd5d42a3949b14c"
+SRCREV = "296494a4011f58f32adc54304a2654627558c59a"
 
 PV = "r2991+git${SRCPV}"
 
-- 
2.26.2

