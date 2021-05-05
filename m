Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web09.9799.1620227972143976195
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t6aLn1Kw;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a4so3490610ejk.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k8ThrfeT7Oov/U9aerm2ZW6Y8Aj/w3iGRF98kuwKLWE=;
        b=t6aLn1KwaM4LuUhZ9T10bcd6DtKijC0UIWBwtocX32MGfgLQU5yeQiTQu9QcSIY565
         oKOkfW7pERopCy02cGrPZPxIBrlRLEEUOWhBXStovUmpx9ytq9CoqwKMOSj3TCsLnZtL
         CYeHBhAExWLzTLEuxGPbv1kq6ekw0Nee68bZUWRduyXAky7HVDnAQCGgpJ8F8AqqzZKq
         ahPRXGMetJccZJPaEv7EwYrZsJ6hNWfqW8On1NaqTT6Jsr7wwbZH1DF+TsX5znpNAj41
         uwiiFe/QXvMzIz0N2Ov1LoY5BzAmxmwhDKvdNsXn6W8RaiO6Thv3e3qTBQ8wqFcVhjWZ
         4U/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k8ThrfeT7Oov/U9aerm2ZW6Y8Aj/w3iGRF98kuwKLWE=;
        b=Tt5f9zRc+9UKRatgAlWkxA3HaSFEoHLx4tmfHsWMKLQwnMJBUv0XBYNhj2/o/pwMNx
         FS3lk0r9EF6pMpgxcjCgSPj6vBiNMEpObhUfT+6TPkjXMLD9yONFBtK/ps2xmg8TvuDu
         F69msCfsKa8KdXkZMm273knmn1O4rE41TxQBnXU/0sovClpeV4E/4Ie6YG62b2tklrMl
         zqHPB4MnCCHXp6eF/+DEsElW4Lw83St9QXoT3rOvUoGZ6YIOf75e8wOxbuwXzyOgEoJX
         f9TEs3uOrzGri5vlcPxSXIdX2GYvEOrdDwSjCBFGvIBQAHCwAjVE+cPj7uaz4NvpyyRq
         UZ5g==
X-Gm-Message-State: AOAM531PtTo2ArT3TuXwwTRpBT2/n1pZUmpsJZV1lJHwQpfZQD2g79MD
	LlndwUVZJ9ZmibyLeK3K9VdY4e6T8/0WbQ==
X-Google-Smtp-Source: ABdhPJySfCbwUMY0ZRtnySRnbSaqJk5uSELUnQdzvMXD958TALOHAFXR2GNhdU/Mg30tzjp5pM56+w==
X-Received: by 2002:a17:906:2c4c:: with SMTP id f12mr2292298ejh.3.1620227970785;
        Wed, 05 May 2021 08:19:30 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:30 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 44/61] piglit: upgrade to latest revision
Date: Wed,  5 May 2021 17:18:33 +0200
Message-Id: <20210505151850.660512-44-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 14f4c75a2c..b64a20a586 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "d4d9353b7290ed22cb7349226a8e4017402d3f02"
+SRCREV = "6a4be9e9946df310d9402f995f371c7deb8c27ba"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.31.1

