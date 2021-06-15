Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.6328.1623744786958190438
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 01:13:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RazIu/Fo;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id ho18so21068285ejc.8
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 01:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C7xv28NKCESQutBr+5YceLoAvFVVbMX6yK9sA3AtCt8=;
        b=RazIu/FosHgsQboHLBg0XBSFQ50zV0Og68l9LdQMDw7zFLdKn/vnuPyyb2uPQQB33B
         t1RPBJn32BfQRIsHuc5Rxf2ZHrKgPDGq2Y5q4vtE1K73cArt064TgWI/IcB4gumGiTOV
         fuAswSVT7j8rO3EDfILwKVjQX0+ueZA7ew8w46DC61rKX9f9QbH7c2qD5rFdLDKKRrqM
         xhbw6w1sNvE9Ne6a6W3QKhtrIZlqWES+Hgo36w8UWyAtjSYAPAhNfOrP7+DPY9eNUZut
         BfYy/6d5PqJVMPgiBcIM7jB6cU2hOfRrkdmQTagH3RoXkxuWk7d2Yx7w7cQZ/xAq1KrM
         oSpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C7xv28NKCESQutBr+5YceLoAvFVVbMX6yK9sA3AtCt8=;
        b=gjM3hWIllLdhOcIIFCfoByigvdYeVoUGuDbSu8Lc4+VLa5eYGWrX8+h8wfUJLzJ+IG
         OjjbRPx68BUwkZwzcm34FevgX6QIl5DcNtEh0H5iBo5IhWUVI0mCddTC6Yuy6BYRelE/
         iTMS39+df8SCP8SGipnoXtB5OBDfDm79sJn8gqWug6UnMt66QdVWjToqvYvcjUl0E0Qp
         /0GZCQw4PBtY2A3M1zIIKAAVdMKBg0Ai2YqNmse8sU3yINUV/6UeL6khJ+zeVOu5o5j2
         etq9lLO0t4dD1b+YQWVCUOETq20/BsHTSezcmoh3a8lpw8IJGqhlF7BeyWkaSlgIGDh/
         zMmQ==
X-Gm-Message-State: AOAM531Bp3RQAp4tRjJ203ZkvEgnoYhNGV1qkR7jnQGt4YwAZ2FZ5Z0F
	uTpLc1jDE/KlgYs/Kexb/BRW3gnCoi6IpQ==
X-Google-Smtp-Source: ABdhPJzRAtCfVoFo8VnF87Uz6c2dtELQqHWuedAQQmZDBgzN40Q6qtdfM/zTjAumViMXjgoZMPXTrg==
X-Received: by 2002:a17:907:35d1:: with SMTP id ap17mr20292718ejc.79.1623744785624;
        Tue, 15 Jun 2021 01:13:05 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id d2sm9118602ejo.13.2021.06.15.01.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 01:13:05 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 30/31] wpebackend-fdo: upgrade 1.8.4 -> 1.10.0
Date: Tue, 15 Jun 2021 10:12:39 +0200
Message-Id: <20210615081240.1734087-30-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615081240.1734087-1-alex.kanavin@gmail.com>
References: <20210615081240.1734087-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{wpebackend-fdo_1.8.4.bb => wpebackend-fdo_1.10.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.8.4.bb => wpebackend-fdo_1.10.0.bb} (89%)

diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.8.4.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb
similarity index 89%
rename from meta/recipes-sato/webkit/wpebackend-fdo_1.8.4.bb
rename to meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb
index 28b2a927a5..38a32dad16 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.8.4.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.10.0.bb
@@ -13,7 +13,7 @@ inherit meson features_check
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "def59bed5e8cdabb65ffa76ee2eef349fba7b42a75dac80f3da5954b17f4074a"
+SRC_URI[sha256sum] = "b89dfd3500a4dec711132cd7bff72599e67d56a419d000730e14bb99547509cc"
 
 # This is a tweak of upstream-version-is-even needed because
 # ipstream directory contains tarballs for other components as well.
-- 
2.31.1

