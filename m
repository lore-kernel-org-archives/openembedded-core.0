Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.24869.1611512816784889816
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jan 2021 10:26:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Oq94JiYW;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id g10so10084215wrx.1
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Jan 2021 10:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MJ1Q5R7PtiUybFoGei4VJ0MHgzVcmmCb4l7V/4qMP2Q=;
        b=Oq94JiYWBm39mVIDkry+K6NMb1SXMnwZFJahlGaCr6S/HdNV7LkC28A5lsr22YaVep
         Q8i7LYzgtRSVxP3c1naXoX1+g4rXvO50cswUOiHzktaW9MswO67UCx7ZIiOY7/ONbkOb
         m+BzygIZQnbIhJUHgs9ouZhy2+lr+oCfx4wZ7e3Wp/5Hrq6U8OGhqG2kw00wBZ6OVfZc
         CjIWu6ImgPwIw7BfYIa4HusW1twa0dNRYcLZipWDH5DDNVFMIPZyTQZooRr5yA6PiPry
         CfN095ngIHU5CiWzdkT939F7WEGIfBcX/b43uW9c2JtYusxpksaYNc5ReAnjkb4gsxSd
         VyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MJ1Q5R7PtiUybFoGei4VJ0MHgzVcmmCb4l7V/4qMP2Q=;
        b=Xa5vQPPnvnwssgSdP6EejQqIrTxS5nG226qi0rzfN3R06NkL5C+oXZmOZgkp/b4d7o
         Gp3eUcJWacB/vXGg+gPKLezYsQlpN3dr0zgCX+8MA8PTZwnPmTBgqgp34at8x5sw/GPl
         ffkt7+aRTIudrfCGJvAmLFTYk/7mHUYyNC13ubqXpt5di2HoZJCslnBeWa/TJzFAfEN4
         /PY+S0GXlnFZK9smYh1rnXyTjtch9iIFY5cCPh4pQmNgnc4xchvagFHLDfPu7NtP12jW
         vHBYhfsjNf/xpr8/jznwNdTgGpOgH9uEzpcJY5V4ZEdEmHVE5PzcDMOhc5fJc8tBa9JP
         8p/w==
X-Gm-Message-State: AOAM530u2je5hHmr4mRQT0tTRyVZ1C8mpvL7hDD1Tx9VKoD3zUMNie8R
	+daCqYOtiymepIeXr/X4cLgOHHRtpqyR/w==
X-Google-Smtp-Source: ABdhPJx63pSBMSkd/oJ23r3DDzn+Pt0jdPpHHph09EDGhcoxOwrlr+xTuMfwlPkLjFZL7m/eoTZI4Q==
X-Received: by 2002:a5d:68c1:: with SMTP id p1mr880904wrw.325.1611512815490;
        Sun, 24 Jan 2021 10:26:55 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id p18sm18365509wmc.31.2021.01.24.10.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 10:26:54 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 3/4] selftest/reproducible: remove spirv-tools-dev from exclusion list
Date: Sun, 24 Jan 2021 18:26:46 +0000
Message-Id: <20210124182647.1613511-3-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210124182647.1613511-1-quaresma.jose@gmail.com>
References: <20210124182647.1613511-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index eee494e5cc..deddf6e50b 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -65,7 +65,6 @@ exclude_packages = [
 	'quilt-ptest',
 	'rsync',
 	'ruby',
-	'spirv-tools-dev',
 	'swig',
 	'syslinux-misc',
 	'systemd-bootchart',
-- 
2.30.0

