Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.7498.1608284583340290356
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Dec 2020 01:43:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H9ns0Wk6;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id i9so1435856wrc.4
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Dec 2020 01:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pbB46PjKktTPPSSqOaKRrBpb8YOYngia4KHoShu2NnM=;
        b=H9ns0Wk67SENNeWE1v8F/QogWNZRQRucZ2nW9A2ggB7zxqt9vmWCWslUIomUKUynzH
         5pnEyAv/X0fXW3Tn7y4JtXxENJE8MiVpCJeduSBK95Ml8DJ9UCwKx0owzS6XuADANfaS
         AODRbgKVeLAJ/9jAyXrPnwNJb/rRCOPGTX7fIeLTWNy0ea30oSdt1j1IOG3c+E0vrGJX
         nFbov/EXRb/Q3topE3rvigEe+OLAr+Ls8/wwXnDIkhN24YEVmlL7/vpwvA0CymeKzigV
         /t1y9Yc261qeOTHZ2YoXeB+Acf3txym04JXAscXDram0IyE201XM9yFdfh2PZrkNaTZV
         dA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pbB46PjKktTPPSSqOaKRrBpb8YOYngia4KHoShu2NnM=;
        b=khJBs64PMIvSLe/MjKzklPTUjfyLlGILPVw1vMuOaxcJxO8D8snqi6rkfCNeI+SmoQ
         m6u7L+fGTEuNPFOP6fm/0T9EBMUL1GAH7mTMGx65wWUkuQCYuzmQcyx+KmGVNhKId7TD
         SFcEzejXavTMFyKJX/S8/BBNKRqSjfsSvZxqaJpcGVXA81QGSxTOmcjk8bkmopuY8+ee
         QatYZRbJKmTalnbnGLhwsRcz5wiiFwSIMpgKmDUqK2gKxnBwJkZavbw0oA4M40x2Mc6Q
         a21hqCzLT4/lNkYaa0uxvDiKCfdwRIhWVSLbHyReJH4S1Pfq+/yqDPUkJ73OEL12B0Qd
         ybQw==
X-Gm-Message-State: AOAM530T9fYS7itn+Mmw62iZKTJUaYrW4e9eMZBhSkzGZF+tton7Rlij
	d7mDmcRthGz7yVE+G3g9FjPOkwDpR58v2w==
X-Google-Smtp-Source: ABdhPJyADXkLigfqqZRVG7mwbvT/d/qkDmQbm6C7mViQg9BZ3Q3/FlLhX9tUIsd/mpxWgVKt5YHtgA==
X-Received: by 2002:adf:e2ca:: with SMTP id d10mr3407729wrj.65.1608284581471;
        Fri, 18 Dec 2020 01:43:01 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id n12sm13441622wrg.76.2020.12.18.01.43.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 01:43:00 -0800 (PST)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 3/5] systemd: ship new systemd-dissect in -extra-utils
Date: Fri, 18 Dec 2020 09:42:54 +0000
Message-Id: <20201218094256.3796401-3-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218094256.3796401-1-luca.boccassi@gmail.com>
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
 <20201218094256.3796401-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/systemd/systemd_247.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_247.2.bb b/meta/recipes-core/systemd/systemd_247.2.bb
index 3129b266fe..05dd4f3b7f 100644
--- a/meta/recipes-core/systemd/systemd_247.2.bb
+++ b/meta/recipes-core/systemd/systemd_247.2.bb
@@ -470,6 +470,7 @@ FILES_${PN}-extra-utils = "\
                         ${base_bindir}/systemd-escape \
                         ${base_bindir}/systemd-inhibit \
                         ${bindir}/systemd-detect-virt \
+                        ${bindir}/systemd-dissect \
                         ${bindir}/systemd-path \
                         ${bindir}/systemd-run \
                         ${bindir}/systemd-cat \
-- 
2.29.2

