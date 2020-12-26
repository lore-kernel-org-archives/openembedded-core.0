Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.19470.1608974888201997055
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:28:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WYCW8JVq;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id qw4so8257903ejb.12
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=921vdEfXmYJVqlqom1+o1bBeDLUFwFgm3obQmK42G2I=;
        b=WYCW8JVqsJfX+CO4U6CXtn3IcZI2NsE0TQWFccXMRMKl2RTUM7FR+sdThZzSoXkQ+4
         994uu8CLwbtzaIC4/MFGaYOsZqgvGZEjDCXcWVo8OJYipSW8jQbqt+PfKjwJoTy5bcqo
         QkO1HY7Ed3ZiUvioAiw3lauzvxhbh+Xd/B4o+UAonbxeoQXzRMgMnlOhQdwKt5hV4h5U
         /Z7ywzqQtGoDGhWWOT55CkLPvy7SL8CkM1S1gBeS6yn7oyJ7VazAT3UQuBoMMBf1LNTw
         SomSZF15iVDg/mb48voaw46LoNe1kLrQwY4Rrmy5mwFtqYhLmkMaAleLoJurILfRxJRV
         mT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=921vdEfXmYJVqlqom1+o1bBeDLUFwFgm3obQmK42G2I=;
        b=s8z5xkHxlfwFE58+NZ1bUufP4fkWfOx9xdFhym+HkGFEvDhZcYMBoLeIV9s3ZcKlGs
         FapgkHfl8y3IvNwgNDWz/ZcUWHF/PhkJUgjm3Ig9ye8FeNwZSHn4pf6AHoK1uU0fK9eC
         o4RoMjHzTK/xxtinGemO4aiIg+42opg5Nr4DHn9qkBtHKXcacFoxGJASfiF6L5IHg1nT
         axjmjjrV1meshnPCh/17h8V85FPDpFyAmMXJdoULzXcFxWNbLIVCvJP8itWtWnZOk/2p
         TbogZbYhsUfcy2Puz6wMm7mCULd9niMOBUyHyA0dBLrazzSAO7815iEFSajm3jGkFPJ+
         EkHA==
X-Gm-Message-State: AOAM532VFkdelJhd5Qg58jmd6ZoheT+mrnFJ3HxlcgPtg0PF+RuxU7aa
	I4ZzeQvXzbUsSNIElg3L7rMA7IyOcWc=
X-Google-Smtp-Source: ABdhPJxmovIUpygMLxEF4NoBVAqdJakSIn8hMPd5aFkzZnKHirtMRJDq0dHjpXX/UAjCJoE36PA7yQ==
X-Received: by 2002:a17:906:3bcd:: with SMTP id v13mr34298168ejf.181.1608974886863;
        Sat, 26 Dec 2020 01:28:06 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:28:06 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 31/48] vulkan-headers: upgrade 1.2.154.0 -> 1.2.162.0
Date: Sat, 26 Dec 2020 10:27:15 +0100
Message-Id: <20201226092732.52323-31-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...{vulkan-headers_1.2.154.0.bb => vulkan-headers_1.2.162.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.2.154.0.bb => vulkan-headers_1.2.162.0.bb} (90%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.162.0.bb
similarity index 90%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.2.162.0.bb
index 0e4d260960..a28954ad70 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.162.0.bb
@@ -7,7 +7,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=master"
 
-SRCREV = "7f9879b1b1fab53f719a9ed5e6e29533b10972b2"
+SRCREV = "87aaa16d4c8e1ac70f8f04acdcd46eed4bd77209"
 
 S = "${WORKDIR}/git"
 
-- 
2.29.2

