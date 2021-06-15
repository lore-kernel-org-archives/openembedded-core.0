Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.6323.1623744780788508701
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 01:13:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XPaRz+BZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id i13so49904020edb.9
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 01:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9YqBDuXTOFGIw60VToAstH3p82cP/p+Sf0k+0tOZJXg=;
        b=XPaRz+BZsWWK9t0yp+IR9LkRLn0cvoUmt9mSSXf3O33pg/Z5ymt+p6LXAZHeZ+qCoV
         NwJYHQ1WdletiqDcs66pDRt7OtLNcmyDn992p3lQt2MzOFvsC0eio4IEppKhwK4wKZNc
         MAes+mcJiCb9uYVNmNyqIfIquWON8vlfIel08FYj82eyohNq8BBYy6m5e79o0Zl3YASe
         Sosm31lJgvYJ3fHRNs4GJFWTD1hAnBUL66quVIfaHvbKAP95a870ATzI3NWqKLouqY95
         8JjOK2Y2j503HA/UxNQWLMaORWWFJ3faxa64VqTlYZtHMWidB47j6zdTYqhuw0BLGXA4
         FtpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9YqBDuXTOFGIw60VToAstH3p82cP/p+Sf0k+0tOZJXg=;
        b=pHpIXdU7ZbtarI/eq9xq0wLsc389yBb26Uqxh4DwmEPMB14OHL6Z7Git/ONAe30lyO
         9O6wS8WZHqTXH9CR8Nt+Wsk6oG+t8g2RqEgEeWhfw1Dwhz+/nOSUTszHM3Py77JDe825
         11qdffAt9TxdEe6C6nVV0iiDNQeYhRZf5q2YYnigKnU72htEh62aySgHCmzkobBsada/
         C9+HZlSQw3xEMpOzFziU4ACkXPMdzGLiuEjWmoSQHAEwrSFiJMDFXqThotYrJDw1CIaM
         zumIDI/0kj1f/D8L68LeqoztJ8UXT2mEqUs7g45PSoIvMjqbTjY/srhG1nM3nSS4KThh
         G9tQ==
X-Gm-Message-State: AOAM531KvDtBCTZ2eCDJ+BnjqkV17qiUomMC/0QMOblFi5gdoUFJn+/u
	zAlnGvyDGT3Sp5gE5Ea2S0d2LTrduTa2Uw==
X-Google-Smtp-Source: ABdhPJzkA9Uy3GMLOPfQSN47HpIsY81PS8VXycJlM1VvMU8JoFE5cVdWj0UpwVSRbiBgRbsBVAQaBQ==
X-Received: by 2002:aa7:d648:: with SMTP id v8mr21102740edr.203.1623744779457;
        Tue, 15 Jun 2021 01:12:59 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id d2sm9118602ejo.13.2021.06.15.01.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 01:12:59 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 21/31] libwpe: upgrade 1.10.0 -> 1.10.1
Date: Tue, 15 Jun 2021 10:12:30 +0200
Message-Id: <20210615081240.1734087-21-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615081240.1734087-1-alex.kanavin@gmail.com>
References: <20210615081240.1734087-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-sato/webkit/{libwpe_1.10.0.bb => libwpe_1.10.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{libwpe_1.10.0.bb => libwpe_1.10.1.bb} (90%)

diff --git a/meta/recipes-sato/webkit/libwpe_1.10.0.bb b/meta/recipes-sato/webkit/libwpe_1.10.1.bb
similarity index 90%
rename from meta/recipes-sato/webkit/libwpe_1.10.0.bb
rename to meta/recipes-sato/webkit/libwpe_1.10.1.bb
index d90557e3af..4680c1e95e 100644
--- a/meta/recipes-sato/webkit/libwpe_1.10.0.bb
+++ b/meta/recipes-sato/webkit/libwpe_1.10.1.bb
@@ -14,7 +14,7 @@ inherit cmake features_check
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "2415e270d45e3595ed4052bc105f733744dc2d3677e12ff4a831e5029841084d"
+SRC_URI[sha256sum] = "a327b3ffcf2356dbe8148c1db4bbdc5359d7e7163d177f67551a8393b144adf0"
 
 # This is a tweak of upstream-version-is-even needed because
 # ipstream directory contains tarballs for other components as well.
-- 
2.31.1

