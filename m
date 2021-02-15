Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.45.1613422441850886624
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 12:54:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZmMpJW+u;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id n8so10564499wrm.10
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 12:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=58JrFPemMFWfiQCV5d/hNBYUtPVgfU91I1/wWHpZGSo=;
        b=ZmMpJW+u4Endai9ZRWEBlXc4/EcoXaxlY28m2A6/QNt3XyxSNgm7wRdj6vUOjSPdG/
         m6qX5b+09rC+VHp7zTJT8QaaNZ9pQ6NYBZjBInqXkbYo076rzCRQeMIOSGvnKgJBtlqQ
         7NSuXoQ294H/2ekjS5/ySjNdd3rN8jHhiMcwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=58JrFPemMFWfiQCV5d/hNBYUtPVgfU91I1/wWHpZGSo=;
        b=pg5XyVnGGwNy+EG4m1aXcWvOp7MXFId/bYUHzxzfDr0SkwU1JxnscBQ/qE8U3RT2md
         Pv7UQ31sY48qedDpedzwABPKrvlXtjy13TGKPnAsT49mG+rWgASvDxqvTIziDsHSYvxC
         i+Xz3ijK0g0QnDPGYuWYJJiwNhQ8aBxJZw0ojukOAu6LfvSJchH0ocSyHDCdCplfXr+c
         dzDhNFveRZPkcMzOZdkUIroZKAbGc3qy/l6PFXfX8v1WzOHi+0cQ6PU1NdCMI/8QQkHi
         zXbGh7uwQHGJjJU0yH2mCw2cI2kFMT/LgO+fj4UDEphZ+JjUMzbJItrkEduL+m003xjk
         Zf9Q==
X-Gm-Message-State: AOAM5321NpFbWMc6tGPDdRGqGBB4H/O+eTThdVZmE5EIS/vUO3pNgeij
	Vu5Ho6g72PumCY+CcGQ25gP0YyqdsenLaw==
X-Google-Smtp-Source: ABdhPJyjOW7/kIMjVrZtXaNyG0GGVilJ1K/AkOssHqlziJQet0zHzDk2yQO1aFDn7TAgTjXr0kbmZA==
X-Received: by 2002:adf:9148:: with SMTP id j66mr21241411wrj.28.1613422440153;
        Mon, 15 Feb 2021 12:54:00 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:3015:c6e2:686f:34ff])
        by smtp.gmail.com with ESMTPSA id 17sm786174wmf.32.2021.02.15.12.53.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 12:54:00 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Update to include fixes for glibc 2.33
Date: Mon, 15 Feb 2021 20:53:59 +0000
Message-Id: <20210215205359.2001548-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pull in the changes:
makewrappers: Fix glibc 2.33 fstatat usage issues
ports/linux: Add wrapper for fstatat/fstatat64 in glibc 2.33

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 4287cfcf93f..17bd02c27ce 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "d03de55845edf68908879db841834584d4724c43"
+SRCREV = "60e25a36558f1f07dcce1a044fe976b475bec42b"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.27.0

