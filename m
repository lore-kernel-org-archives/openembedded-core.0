Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.33588.1612781987821842870
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 02:59:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NgrXHLuq;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id df22so17569961edb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 02:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tQfsTg6pL9MxIbx4CS8OY/86UxWKDK6t8J8QxkdQZRw=;
        b=NgrXHLuq/vDQibZuFJo5B2gJ+0/2pGo5SY5JMIlIej+Z9qYBv/og6GUqb4E1QZkzD8
         eoq9k9Fe9ACwIWapVmbvR6v5d31ZhKFRENzqs/4s9uWzw5flRk/8YdD0MVaVv/Aa75OV
         1J/2iq5Rin9TlYs+t0Lh1E6PjhQCLnwllqXCfw3wWMGrX1YE1xyqZ7YaTQSF9W4KxHeo
         WfznV+T+TsbSUStgU4pAvCEmjThCij/8Kkilamj0gYuGun6Lm6YDQBlRVjzcW1f7FSB4
         IHzGalz0uRZCt0FH4013g+xsJdbWQWsusc2svgPepSMWgOYS5uCb4IQ44wfaxuwOVeo4
         TNOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tQfsTg6pL9MxIbx4CS8OY/86UxWKDK6t8J8QxkdQZRw=;
        b=hb+QCzN6yJAhecsawF8aMhZQVVN7XLq9+KkG+5Z4zHtEV5LqOj8iE//VZ03PCzG5lv
         YwJQ0mFGo8ZbVd+NHMSr7ql6M8pdjZ19O4Omy6xdHyLKlVL9MY+hkX3MvHj0OEtJGxPz
         Ox/nx+FqT+NTKfTEA3XyCjp77I0qMkE4XM+AkhXqO4cNaTZhPqMSZBs3V5glIfRj5Z4T
         MT8dNx5MDDXTt8l2oEb8nS0fVLCT1AfJTg/UFVdr2DoBk7l/Ty8aK6J2yLmnJlvuwRP4
         klsCjY9Y+dEdExQ5WgvBPOkvoVe8N2GErVWm33f7VGJGUCi1zGFKd6SPNgMf9ki6y6pD
         aiDQ==
X-Gm-Message-State: AOAM533BmIiSBlkqnjfOsnebTPl5VueSJuJTbarVMrxH2b29pkt2o9Af
	ycK2vnSg0BIRZJdRCcI2m72PvD+9iaUkDg==
X-Google-Smtp-Source: ABdhPJwED9ORovky4ZRkcl/CjY5DFO6H/6MFG7uxjz1aTpYkUgmZl7On84wzl0KQgCNxrsru/jutvQ==
X-Received: by 2002:a50:a086:: with SMTP id 6mr16192707edo.70.1612781986439;
        Mon, 08 Feb 2021 02:59:46 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id t19sm8382226ejc.62.2021.02.08.02.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 02:59:46 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/12] shaderc: correct version check
Date: Mon,  8 Feb 2021 11:59:31 +0100
Message-Id: <20210208105932.347925-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208105932.347925-1-alex.kanavin@gmail.com>
References: <20210208105932.347925-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/shaderc/shaderc_2020.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/shaderc/shaderc_2020.4.bb b/meta/recipes-graphics/shaderc/shaderc_2020.4.bb
index 8658a5737b..e966ed3d77 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2020.4.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2020.4.bb
@@ -10,7 +10,7 @@ SRCREV = "0dbd899941a43ffd55df527d65128b3b66e75c9c"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-de-vendor-libs-and-disable-git-versioning.patch \
            "
-UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
 
 inherit cmake python3native
-- 
2.29.2

