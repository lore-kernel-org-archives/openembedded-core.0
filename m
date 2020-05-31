Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web12.17611.1590940436643016593
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FoAikJC6;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id s19so5390928edt.12
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=91pJAsTl+DjUacr73DN4tjrFJhzZURbJHm/MiO97jFc=;
        b=FoAikJC6diS7zH29+Q+F8p7A/F3Ae1WHraQxCFWwOEQiaH1EB9E0NaU8yXU8jauY31
         dK2ULk+ELDvGdX0kccsIt8QvEbsjJrss0UP5s6cGwBgIwtBmVrvxPTlrDBC3bVN8tkox
         qx8OREDoazjLyg7tYtaS3pcJcHNumxkaCmWW3+h/SlE7Dx56FGWBgXltZfhhPKrzoubR
         8Z0Waq4+TpXvcsxdTSFkO9pZt54SIZ0EMY5nKBZiBb1i1aH1OnJ77FPCZ9nzVj16BMe1
         MZ7Wkbq0vmCXM5XFwUS780VJsZEx9Ntnh3nVLjrBMofXmoa1b4uvx5suQdk3+pWHvTV0
         MeBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=91pJAsTl+DjUacr73DN4tjrFJhzZURbJHm/MiO97jFc=;
        b=skppyW5zCuTg1Depqrh5dGI1zZx4GMal0PzsrZM0kTbSMpCCczjFBh79MsEj9vI1RF
         wXMD0VhIZVn1i5IbrTLCktD1jhgwv7HNKDiT4zrcPAh0QvuWvU9CMD3eDJIGkaTVe2BM
         qOoZBAD5W9NOvCBsf8kK3OStE7WKGqmL4W/+eAC+fFOHiATCwaCGmkOhbSHx1TseGdcw
         1wQcjbcAJdQ8QS8QWsYPx+j8RjYcpzbcM1iWecdS3tQUjrlw9lAJ2FxXLdVlERUt+Kl7
         S4o5Uw5GL2Wsde+9mF/wrKAVPHgwARgF8AI/SQnq3s3dGvblDINBfarT3X+zwNu31Nr/
         Nhnw==
X-Gm-Message-State: AOAM532Ls/w2bZnnOsFVDC2i3Q9ecMEuDSh4UKaLAE29UdbS7Z9JIOPN
	AihmYWfIMWHc71ZR1py6cqehESzR
X-Google-Smtp-Source: ABdhPJx3XT79mTGBkJVOIGovxznRPQgZPLnyW1bGOuIU4wybVvUfWJVjmzRUIZLP2KrN3L34mWniGQ==
X-Received: by 2002:a50:fc0d:: with SMTP id i13mr15918539edr.260.1590940435115;
        Sun, 31 May 2020 08:53:55 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:54 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 32/70] piglit: upgrade to latest revision
Date: Sun, 31 May 2020 17:52:16 +0200
Message-Id: <20200531155254.10283-32-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 58d10d6b9b..47950c8633 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "6126c2d4e476c7770d216ffa1932c10e2a5a7813"
+SRCREV = "5cc4fd749375f37e8e8725a86072d8cff7173b98"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.26.2

