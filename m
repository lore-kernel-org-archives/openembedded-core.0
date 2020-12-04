Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.20368.1607112482093874958
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 12:08:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ta5XHfQu;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id qw4so10409407ejb.12
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Dec 2020 12:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=06EtsO+QQXMWjLiuTp6ol1RGMkFUSh34TbkHwFRhG4A=;
        b=ta5XHfQuG9BKPKUvHSPWsgYoF964aKSnOjm8OBnxNfGsrXcfqg19ZuLhJQquV3YBgY
         MpO9dnbkq8R80c9ixiLNE9SD9WXGbS+9JUH9W4o01D9S6zgtLmZ5By9cQZSoWf+tl1sg
         HENM9xJHbq0+T7YBenu+8u7y/YsoN0wSMoRB00NM2PvBS0RIMkQEFr04IMfljPX6NreZ
         DgC2FdaLUtM2OzDMsBEUaM1KjXwjioto2TXnzA3DdDN6P3SAsMhIe+bC3cvOfJTrv8eA
         0DFk8vba+3ZHpJtv5chlthf4Z4Io4F5kjP5emJGCqg7WzirPTTn88rvOhl3IywU6X03d
         kBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=06EtsO+QQXMWjLiuTp6ol1RGMkFUSh34TbkHwFRhG4A=;
        b=BodjPklKL/g1epN25ZixKq14L0gT+jh3qRAiKEWZRAeSnBu4Y85eREUEPgLe/xmEYI
         oFaD0ors9HvfQV+xDeOuT8f3vzk1MJ/g9vG5RYq/IDvmoogsdq9TUU4SPbVE1M+jyBeJ
         NTxuY7AVlErtU3MfZmr8g7CjyRkpyDJ9d/frqDRXDxrEBbGmgZ7s3YHn1uwE+ZhqdJ5+
         teUdo1wWRSEbTSzaJdZDQUSSLmjjuEtY0j06JqMt5gPdqlPqa130cGG2JRg29GQ4nCkW
         vHbfMCZniu4WSf3K7PlAeikqqOoIJxbV1Lzu4iA52ZnlimSahGFeWAW7Pk33phlkcuCe
         616Q==
X-Gm-Message-State: AOAM533NFPMKBaYt2s4AndNgmJ3yKPDQjWWC2RkkHRD6TGM6XLcuYzQw
	ktPYv5x194ozS4b8/tPWv/WVvN4wG9rjlg==
X-Google-Smtp-Source: ABdhPJzRaxlfAeQwGScsKZI49la6J6+zBxVRYtDh6F4KElkp7Pz97+BrZckWUWLSmgv+Y2nfrHw2oQ==
X-Received: by 2002:a17:907:2122:: with SMTP id qo2mr6602870ejb.539.1607112480523;
        Fri, 04 Dec 2020 12:08:00 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id d6sm3601660ejy.114.2020.12.04.12.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 12:08:00 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 17/23] piglit: upgrade to latest revision
Date: Fri,  4 Dec 2020 21:07:30 +0100
Message-Id: <20201204200737.7072-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201204200737.7072-1-alex.kanavin@gmail.com>
References: <20201204200737.7072-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index a9d1d39dfe..6dacc4bcbf 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "59e695c16fdcdd4ea4f16365f0e397a93cef7b80"
+SRCREV = "0fda9f67a782edec640998286e7b6058e8933d17"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.29.2

