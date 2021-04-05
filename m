Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.5783.1617633913141180556
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Apr 2021 07:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ox4Fggo6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id j18so11116690wra.2
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Apr 2021 07:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3Za/k2H0aAU+Ove+cCglkCm6+kfv9cQhjZBMTuUdVJ8=;
        b=Ox4Fggo6VyuccEsT6uq7MjlpoaczbknvmDyDcoB1Xuy1DR9oeTz0ysFLtQIRcZb+ia
         T+J5kyyfkcAQgs4hsKFnJVExX3mCXbv9dphXPwFGlCchbFdaO/3E0bbbp7QhNE+910O7
         qnuvmgC+ozgM5Xu0D1ELAIpZx9joxvWEbMLi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3Za/k2H0aAU+Ove+cCglkCm6+kfv9cQhjZBMTuUdVJ8=;
        b=Qhle7Q3xL3DKMCiOvmDYpANOz1AbnC3C5kjBCZrV9HgUFvWrWMFDoLraeNOe5m46rE
         Jo78Nfw6B8Ncno5ZqEU6EGJy1OvA8QSIGwbXpBGAuRzpIixW+cBb0qOnAXuVxXCD8hVp
         j6FyD7JnObGOlts5uYcSU2Qh/3QVONEWYRQoQKdXey8LiwL4e2PpsSRfxC7Ab3AqYlhD
         JhXqTPl3IP9WnxZ6BNC53N79mYY7ASpwlxGu4TCq9dg+b/VxRE4e47ASd0D5Pvk9CsLf
         GLPom7fDPSdkyVRJ5GZQDL9wfZ+jOxoLuniVaUBMXenillTrMSci5tAqLNVF1ueDUyxr
         lbTA==
X-Gm-Message-State: AOAM533QMY5Mg2eyGWVTqBMO5EyoaVZW8AIKGIIRA3yzptWs7cLze9hD
	2R8XSnopR/fNLrXai0/rRzr7mPFYnbbDHw==
X-Google-Smtp-Source: ABdhPJzv1CQh4+PVucjxkeFBiObK+pVkTadeNHYdXH13s08O/aKirKsBJIct1nZP38N9rGq5SS6Z4A==
X-Received: by 2002:adf:e4c9:: with SMTP id v9mr8073722wrm.342.1617633911702;
        Mon, 05 Apr 2021 07:45:11 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1d45:30a1:7018:4816])
        by smtp.gmail.com with ESMTPSA id n5sm6750847wrp.50.2021.04.05.07.45.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 07:45:11 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] diffoscope: Upgrade 168 -> 172
Date: Mon,  5 Apr 2021 15:45:09 +0100
Message-Id: <20210405144510.967151-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405144510.967151-1-richard.purdie@linuxfoundation.org>
References: <20210405144510.967151-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In particular 170 includes rpm header fixes which stop the webpages
for rpm diffs breaking web browsers and are important in the context
of the autobuilder.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../diffoscope/{diffoscope_168.bb => diffoscope_172.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_168.bb => diffoscope_172.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_168.bb b/meta/recipes-support/diffoscope/diffoscope_172.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_168.bb
rename to meta/recipes-support/diffoscope/diffoscope_172.bb
index a7cfdf9ffbe..bf4726e7789 100644
--- a/meta/recipes-support/diffoscope/diffoscope_168.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_172.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "c6f1dc3e75b7e2e5ceac4f857fbd2ee0ddb3f0169c2b39ea9187af34208e98de"
+SRC_URI[sha256sum] = "5ffe7f38555c6409bc7e7edc277ed77dd78641fe1306fc38d153dbbe445ddea4"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.30.2

