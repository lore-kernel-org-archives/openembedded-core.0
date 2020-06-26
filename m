Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web11.2800.1593155957196183946
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 00:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S7GJki0i;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id dg28so6131696edb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 00:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hWt0bM5UXBa/8uMjQ5kmT7G5yzO/30EheOWmtRrVyHo=;
        b=S7GJki0iK+kZ40JgeidQ2zbZuON4X5MA/vGVq/+nOK20yECToV4EKhQa17EXFeKSRO
         OSbl4yqR+KEsZhIRs+E7IqkfkjMGjg6HN+SWXA2s7wYjIsRmJWaoF/WGQTb0fFiDSf5d
         YSZebx6NXVwAukeKRvjOQTD3bx31rRm717rkXz4iWvnxxV7VmIyPuOxphM7TWnxsiIXn
         9kXRSZLxFX4lBUmIaXFeCX2cNhJKFoLJ1hQeogbpt/zNzm6jw5e7BGbZFovy+4hUVjr/
         QkCDtKElwQ4lvNJWUmjV0m+mAoWdzpyknK7x3R7ZerxsbgDGFtQz3sqEevAn6rFfccVq
         3rcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hWt0bM5UXBa/8uMjQ5kmT7G5yzO/30EheOWmtRrVyHo=;
        b=dbCVTzJ7T7Tz4r2NqDU4neouOD/n2lyRseR4kuiwsP19us5ASGozYcJDIEZfRayWp4
         hyGXxXpYUrxstg9YiugvlfTI4JUFsGHI+ifgtmMr2Qw81dDf7H31YCbcguyRT8+Tj6CX
         pm/QvPtUlHON9IEw0PDfJPskDlw4uqP3JJidqmlMZ6kqrdOO9Vd8eZj3AhyY/mCwfrSP
         wxSOCMt6eT0/0WuR6J2qfZgaYJZ2b4VIIqu4PiAHQ0z9DmwLM/1509cSjaToUKKCx7Y9
         vrjT4yTRbjGuaCPvqfoqoZUqJMzbQ0iS3+ZhB8O8pLQAWRdOBAzOFaTffqo91IP/PbH2
         JGFQ==
X-Gm-Message-State: AOAM531iDLAoqsFW57d42KuYRu3Wj0E2PIK0hRDqh2J9Iw7maD7W7Sji
	97jtnXXuzTGirIjB5iowMmA5AmoLHTE=
X-Google-Smtp-Source: ABdhPJw9Rk3cD3OGXkNmmtBQDTWJ7OANu902FebzpYSXVTa2nslaYP9di/Ug4qkLPOQyY2h6wx9vZA==
X-Received: by 2002:a05:6402:1486:: with SMTP id e6mr1900848edv.99.1593155955557;
        Fri, 26 Jun 2020 00:19:15 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id p4sm20826194edj.64.2020.06.26.00.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:19:14 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 14/30] piglit: upgrade to latest revision
Date: Fri, 26 Jun 2020 09:18:28 +0200
Message-Id: <20200626071844.29134-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626071844.29134-1-alex.kanavin@gmail.com>
References: <20200626071844.29134-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 47950c8633..e531ffc408 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "5cc4fd749375f37e8e8725a86072d8cff7173b98"
+SRCREV = "7d76fca56e8ca72ab6809f6f0234b5971af5690a"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.27.0

