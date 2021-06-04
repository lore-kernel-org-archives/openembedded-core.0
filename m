Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.6025.1622798110345411277
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 02:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q1iLBD/H;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id g20so13500746ejt.0
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jun 2021 02:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M5IeoYPXZz+t6bGfPoFOE0lZTG0i0XJokrDSFoV11s0=;
        b=q1iLBD/HCi89/0PgagQxwlisq7sVrDrqmo3jAZGu76k2kJZ4ck8t3YlSaNu05Xg/6x
         RVxR1Nm32+Kp07RrW4J22UrmbGP6ypwpBKm3L1f77OSLtnlXXeNeMgVqjlDqb9ceHjWO
         DieZC/kn/MsWXCR9+whoWYle5zAMZlwN7bMIvxKT7hVRcsXrXoWDNEHJNMb8ohBhUsN4
         MlFcFN+LyIVBj3wKuTbb6SZDeS7S5PV6QWWyBLnExIO6GWCA7uj2T5vojRwuEERipg8/
         GWAW3aMb4TtlVPv06a/lp/o6obZan77MY6qaQNdVOh9qTi0Mb3w2LuVi+q+ZwuoVqEpc
         YFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M5IeoYPXZz+t6bGfPoFOE0lZTG0i0XJokrDSFoV11s0=;
        b=ACS7L7EMbXqXTnmIxy9i10IokjOwYNV+aEQu8v0rmyxrgne9+I43OEt9QdWkyeJNV8
         NVnf9iSKjmvCOAX8CaMFUmbmlE8K4PBfJxlNSlWajpvlgCdaiFIqODDE8PiKeY/pjd7E
         IdQHStGoxTY3697tu++jKRlmOXXcIepYwdKh6bdfrqvA9qUQU7aNcwktPzAf8BlgzjFU
         1nSSrtwVKtmV+OCEi7+V0h8qtVwVgotNGYSVfnyojSHy8eRboMW9JnqUK1xT2Bd0MudQ
         B2BBuSukWEoLUsxjTc+UWQIt+m8hHaMnd8fJFJCPy17TYmEf1ZuKSdDNQAKVx1UxQ/an
         /wKA==
X-Gm-Message-State: AOAM5323PRkSX86DzyPV1KI4HZMPL1RQnmohCPyHWMfnKu3xlyF6eWB5
	8YxMCB7oirMQHWqIOhDn2NsLbq+l74dSiw==
X-Google-Smtp-Source: ABdhPJxuuP2ZY9J1iWOI44rvAyAKCAWSKNpZHyVHxC6tIUHF/3AzpGYAEehcNanai5PrkAOx/co24A==
X-Received: by 2002:a17:907:1c25:: with SMTP id nc37mr3345731ejc.300.1622798108967;
        Fri, 04 Jun 2021 02:15:08 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id br24sm2508544ejb.55.2021.06.04.02.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 02:15:08 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/10] erofs-utils: correct upstream version check
Date: Fri,  4 Jun 2021 11:14:58 +0200
Message-Id: <20210604091458.1381144-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604091458.1381144-1-alex.kanavin@gmail.com>
References: <20210604091458.1381144-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/erofs-utils/erofs-utils_1.2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.2.1.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.2.1.bb
index 6435fea68c..5ab4bf2816 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.2.1.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.2.1.bb
@@ -7,6 +7,8 @@ HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.gi
 SRCREV = "d1f4953edfcf4f51c71ba91586e21fc6ce9f6db9"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git"
 
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
+
 S = "${WORKDIR}/git"
 
 DEPENDS = "util-linux-libuuid"
-- 
2.31.1

