Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web10.17616.1590940414459758697
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hHzkxQiK;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id c35so5416584edf.5
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=19Eji5PBy34C5+4//byF5+FEu8blYpHrznGStVAuQGA=;
        b=hHzkxQiKbXqWNDIn2Ya9aaetJEYu4Lix9x6HBV/EDTCkjUij4UVd1kRep4fCjarvem
         w9oUGS1W9eUB7dCK+SKRjHUZzdTqCKkNx5bVrKv4SRwuIBHM7+nZN2X7OTtS6mbS2CPU
         lqlH15ngaMNvdixZE2Vz7NQKwZvpEXPLUs4vHrKSyIWISkX2Jsou6C34OHgLIYubWzX5
         CCuPblMb9ZRx9RYYhZ4pFJjbEPoX5vXYHa8mBnJwDPTnWnNtJZJQwhUa7ysATUAYglIa
         7NqPf9+37yagDXjCZGI0KsqVT9tmhEjaWm5Os21Mq0scMlTNxVsDvKjtPVVvGHZWRr7c
         d9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=19Eji5PBy34C5+4//byF5+FEu8blYpHrznGStVAuQGA=;
        b=UEmkv5rCxPgdhUm4sG3rDroyrmS/SkKmso8sfQc2ZGtIVibTx/c/b7hhJXj+rfM9Ry
         7KAtgLd6kdP+jLQlO2mY7HpYSzQCNttBPHUWT2wByl0bpj81b1/1UkRKRHR3+aw3qCpk
         ApgReQ0oEEvKzeRcI0NH4I9KQ7ulBseX7JKVdkt/AduZZoIS3qo0gENorq9ioo7Q899T
         o+a+SRohD9cRCPohU95NzqRwt02aJgLnLIa6Hsi6zPDYH4gO4PbjCGNTOtEz0QjTRzdB
         IESMgu889zHqRLk9szWxGgQiqcgB6zkCntu0ZcxqUBCd9helh2DYirZea6Z8oED5yXzG
         6c8A==
X-Gm-Message-State: AOAM532sn0LEjrK1NcU34WjESXcb+Q4ddT8b+UINJJy8uV1lF15l5h3+
	Nj+smUhlOqT5tywFcYoiBUDzCvMn
X-Google-Smtp-Source: ABdhPJzgc+updEtiBdtPJTAEt3AnVT+EObRojtxa6Y4TIo+8FP3EM7NYD41AlOy87qgmJ7zojQaUHA==
X-Received: by 2002:a50:ec0f:: with SMTP id g15mr9918798edr.359.1590940412877;
        Sun, 31 May 2020 08:53:32 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:32 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/70] librepo: upgrade 1.11.2 -> 1.11.3
Date: Sun, 31 May 2020 17:51:50 +0200
Message-Id: <20200531155254.10283-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../librepo/{librepo_1.11.2.bb => librepo_1.11.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.11.2.bb => librepo_1.11.3.bb} (93%)

diff --git a/meta/recipes-devtools/librepo/librepo_1.11.2.bb b/meta/recipes-devtools/librepo/librepo_1.11.3.bb
similarity index 93%
rename from meta/recipes-devtools/librepo/librepo_1.11.2.bb
rename to meta/recipes-devtools/librepo/librepo_1.11.3.bb
index 6a0a59f865..3e745314a8 100644
--- a/meta/recipes-devtools/librepo/librepo_1.11.2.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.11.3.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "67c2d1f83f1bf87be3f26ba730fce7fbdf0c9fba"
+SRCREV = "59b3f76ca6e79786a213cda72ecafa232d30553f"
 
 S = "${WORKDIR}/git"
 
-- 
2.26.2

