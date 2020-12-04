Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.20176.1607112484106170387
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 12:08:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hSIizpKv;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id b9so105395ejy.0
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Dec 2020 12:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8f+cI/LQrFRgjbvXnjYiKMQxSlgtedO95xqCk8I0lxk=;
        b=hSIizpKvN9wCuhlVrSKKYCfEDasHSVsgvF19B8X7VFtmmzeoaXwKuDknHq6vvXqND/
         7UxmuR6qkNzc1XrMk0suHtfWQleUWp2LfMx6CvNV+aAlpOjOLsDdexdTr+BHba63H+e4
         Xg3Qu2kLdwZrCefNdxrgRgTpHX9hPS5fZ735cbVhnnMgtNvoytClNnzhSd3p+KIR/aDw
         DYPgcnNgWl2GtXcGywFqxjHD+wTFi+iqr3SKSL5C5XGu4jG0UlvfolkOVhZ2ibtBd8RR
         bDMk1TPKTsQoLpgqXEmXYXrdA2ZhlA/QMkr58fknF/fy56G1gxA2uO9g8RM9Fmm7WqF3
         WXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8f+cI/LQrFRgjbvXnjYiKMQxSlgtedO95xqCk8I0lxk=;
        b=f/c34f6Bfxu3eBJTCzuG/tohxI3OjxyhZPDJ6+XnSt/D4lOa6bVX+kJdzbzLPU4zFC
         v0W4fzYbIorz11DbtQMpcRw2hc6FGEJb4Uq19y1LjuYkp0uyO4ADfJFCnKbM8p2Bilqh
         LrJi2RyId23aQDBaE55fpnBHxWTo0lwQjOQFnTU2sWJMjcGpJcPT9OCK039QAv0zLxSt
         MHxXp0AmXUyEBG8PpeiY8TxR4PyG1Qehs9CNtB5stBfgQKi0JNY0VbhQ6EY9YbjC7QTk
         3X1KWpPpoiOZf6JT4Mn3lfonks2BWlPTrD5iV32+czwre4fQOCLviiXCFPv3VEySr7t3
         QAGQ==
X-Gm-Message-State: AOAM53356bWF55hu42FZeKZ+ZsUjy0oGSMcVmTu3b6xIRShf/MV0H+aX
	aKMNCMbf4hPxsH7ez4luqzfljrnQdqYPPw==
X-Google-Smtp-Source: ABdhPJwOHdm/SbwxnijrSeTKXh2FvyG3F1u+cFC6MhW+N0KEpdbhik+4hwGo/tDxuYKVzbWXUEXvfQ==
X-Received: by 2002:a17:906:4016:: with SMTP id v22mr8914383ejj.266.1607112482429;
        Fri, 04 Dec 2020 12:08:02 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id d6sm3601660ejy.114.2020.12.04.12.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 12:08:01 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 19/23] lz4: upgrade 1.9.2 -> 1.9.3
Date: Fri,  4 Dec 2020 21:07:32 +0100
Message-Id: <20201204200737.7072-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201204200737.7072-1-alex.kanavin@gmail.com>
References: <20201204200737.7072-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/lz4/{lz4_1.9.2.bb => lz4_1.9.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/lz4/{lz4_1.9.2.bb => lz4_1.9.3.bb} (90%)

diff --git a/meta/recipes-support/lz4/lz4_1.9.2.bb b/meta/recipes-support/lz4/lz4_1.9.3.bb
similarity index 90%
rename from meta/recipes-support/lz4/lz4_1.9.2.bb
rename to meta/recipes-support/lz4/lz4_1.9.3.bb
index 455d2a5141..00f2dd32fe 100644
--- a/meta/recipes-support/lz4/lz4_1.9.2.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.3.bb
@@ -9,9 +9,9 @@ LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=ebc2ea4814a64de7708f1571904b32cc \
 
 PE = "1"
 
-SRCREV = "fdf2ef5809ca875c454510610764d9125ef2ebbd"
+SRCREV = "d44371841a2f1728a3f36839fd4b7e872d0927d3"
 
-SRC_URI = "git://github.com/lz4/lz4.git;branch=dev \
+SRC_URI = "git://github.com/lz4/lz4.git;branch=release \
            file://run-ptest \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
-- 
2.29.2

