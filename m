Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.9681.1629636690755246680
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M2+J1MAo;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id v10so10551080wrd.4
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KLsCv31Faybc3Y9W6kyF7DBkf5Y4iQfeqhF1ftUBTAE=;
        b=M2+J1MAo8ysb4PeKhAfFhd49v631/XGxnYU7WW0lyt9/BjWqcV3hN3N5a+VXFiROHz
         ocZqt7MsiBgvyumKS717oB1/dUzAqYmyQDCamUKrTdgcV/TqY8g4J4S4eO7gmmDII2X0
         3cgqtlmmxDdPsuk0DTVEDGbFBKWoqHU0lQHyRpuGcnIOSFYX33FNiTE7IRnqQFMA5A1+
         FlSXJ7CSoddwl1Cslc8bwsPn5cv3yd25KQBb81JU76qJ4XjmNGjRoLejyNcZn7hG4EHp
         94iq1DkfHoDmFp4nEFCuvSa4O0qXCZ9hf+DL7X/3X7guidkaWVTD10wYi6mgE/ZGnySO
         iQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KLsCv31Faybc3Y9W6kyF7DBkf5Y4iQfeqhF1ftUBTAE=;
        b=MhclC6HjVYHb3J1MkxPpaAYD1nXSO1yzVJEOmCbChUesuwSKuJy9ov78zKTacqSB3a
         fx4JRChT0Gw/APJ0HoxavIYxX5UrUQyHp20Q1svs8wbfjSJocHoGCrqJBQdNjtDe5RYb
         L8jOvt08LfF8AG82cu3+C9bl51Y+6lTwzDA5aKkVLDcy4uY3jATU2OweB+2N3FE494cs
         y/lKZRjL4RRXp2Unoqviv6U3cAazJ2rlZJsV92etaj/hXBvxolloius4XBdRmSoc8Jco
         QhRdzqGzY5wPRx4D0dvunQtLffQ7dV1z3cAQzJLQwzkuha9zIKxY0xHpLKXcAjuPgmBo
         C3nw==
X-Gm-Message-State: AOAM531sVfukbPcNvxf+maKyhQCrGNjacwG8IL3HAE0r0tyxutpmiSH7
	hX2mqw2nmqnXxfHI1hnH/rkNpH56EgGvZA==
X-Google-Smtp-Source: ABdhPJzlQTSWVhtwSN8oZGqBjisxEp9wSRJz9vgqXf8qkdNV90ZivNJG7kMsAAPoAQabOmMCSHfsDQ==
X-Received: by 2002:a5d:508d:: with SMTP id a13mr8574802wrt.172.1629636689432;
        Sun, 22 Aug 2021 05:51:29 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:29 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 27/55] python3-git: upgrade 3.1.18 -> 3.1.20
Date: Sun, 22 Aug 2021 14:50:35 +0200
Message-Id: <20210822125103.310416-27-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../python/{python3-git_3.1.18.bb => python3-git_3.1.20.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.18.bb => python3-git_3.1.20.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.18.bb b/meta/recipes-devtools/python/python3-git_3.1.20.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.18.bb
rename to meta/recipes-devtools/python/python3-git_3.1.20.bb
index d1c50d4322..2c20d3952f 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.18.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.20.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b838a895977b45ab6f0cc926a9045c8d1c44e2b653c1fcc39fe91f42c6e8f05b"
+SRC_URI[sha256sum] = "df0e072a200703a65387b0cfdf0466e3bab729c0458cf6b7349d0e9877636519"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.31.1

