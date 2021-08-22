Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.9683.1629636692353793218
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=krYBdsde;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id x2-20020a1c7c02000000b002e6f1f69a1eso12132373wmc.5
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pMC8vX1fs5xWP3F84o9gw/vEmlVBcb1mTV+IktnSuf0=;
        b=krYBdsdeav8DWMG5kWRiKxabXWmJTVrW2XjKEvlSOq9AxDdxSt+nvoEhx5gCijA/NE
         DG8KVfs9hYXSIuqBxIaL625i0TkpSEmA5sUe9Jx/cN4+yD28U3tQQWRBts42UZ1vSe++
         moNmAJNylZF6l3f8CwHVCyky84M4GUI280Lgpob2k4/WoCMMtAZxTJX1K9Fw8+N8aVH3
         Orw9LfDTVSD4bMW1Nq6a/BGvdoUHONE8tmo387yTg9egpkRgvsvSFVERQR5W7QbzlTkM
         hDyTz5KIINyMiH/Vt0asodRrRaUaqmn79pU7XHXkpvdQCHpvEnIxZntMZTAql5KDdiYY
         o9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pMC8vX1fs5xWP3F84o9gw/vEmlVBcb1mTV+IktnSuf0=;
        b=X6Ngqee8A42+CRuuNZcyg1JWtrV0lJ7t4Qtx0P5R7QIFaLSYSUYWdg7TxIwGfR5X4p
         5jQBh9tTbUAWJ/8+4sJ6CN8mrjU+aFpmRD2WnaRe6eUHWeoz9QJMRomv8rIGVIflAuI2
         o1fjbdv9bzglF9yUpDWlrctZ770B8h7MhH7W5HYvCV1OuzPJUQQz0NI99Q0a0cAiG82b
         O3cnlG4juD5sfoxrKao0TalSReKob0f/IQ27EN5Ou/xZtIBVtxHIluSZtDx2tq23ZONB
         U2uMooc9wdw456Zez1Vy5qjacjLUQmzNgpk9Nyc0j/y1YhXbWY6cvKU9MRpkrPzFJw0s
         OFvg==
X-Gm-Message-State: AOAM532ezn3lwSlcacw3Dqa1X6d5kOmq/2NfGIGZpakynNwyuH5vxwXA
	UzrjjjecCGqark4QsK7ogxUPxPZbUa8giQ==
X-Google-Smtp-Source: ABdhPJzWkHuNvCcnwM//9E4+k+T+d0/cZWUrM7ID0yLTgINeGoheo1JSkVY0OeNLr/nnvH1MI5c97Q==
X-Received: by 2002:a1c:7d06:: with SMTP id y6mr12106796wmc.7.1629636690983;
        Sun, 22 Aug 2021 05:51:30 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:30 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 29/55] python3-pygments: upgrade 2.9.0 -> 2.10.0
Date: Sun, 22 Aug 2021 14:50:37 +0200
Message-Id: <20210822125103.310416-29-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{python3-pygments_2.9.0.bb => python3-pygments_2.10.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.9.0.bb => python3-pygments_2.10.0.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.9.0.bb b/meta/recipes-devtools/python/python3-pygments_2.10.0.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pygments_2.9.0.bb
rename to meta/recipes-devtools/python/python3-pygments_2.10.0.bb
index 7fedcb5a88..3c1b5d15c3 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.9.0.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.10.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=98419e351433ac106a24e3ad435930bc"
 
 inherit setuptools3
-SRC_URI[sha256sum] = "a18f47b506a429f6f4b9df81bb02beab9ca21d0a5fee38ed15aef65f0545519f"
+SRC_URI[sha256sum] = "f398865f7eb6874156579fdf36bc840a03cab64d1cde9e93d68f46a425ec52c6"
 
 DEPENDS += "\
             ${PYTHON_PN} \
-- 
2.31.1

