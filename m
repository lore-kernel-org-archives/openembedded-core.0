Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.17618.1590940417465561087
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QhXPHSUB;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id k8so5424166edq.4
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EuA21wh7QPUCspA18qv028NyQnemPqeYd/7XpFd490c=;
        b=QhXPHSUBvCESpv/T9Z3Kb7rBr/3Gl4mwAi2ZrMuVlGr1eGW4m9trzqFVUhYK4PgWk3
         Y1HyX0UrV64D3o9to6KrxFh3ApVkolh7DaPKESoHJ+10pd80dtHJu3OkCW9GhsOP1evU
         QoKhfFanqiynOoQFItHJwIhZzWgRjjeDapDtFHcUObqrzzq3PaKKcyeDcI6JfiigdZ0W
         0s7FlNXTFK5n/db95rogFHkm0vh71PH7Jeqw8jUEw4vwT2jyOfGUPYZb0qkH3914MttM
         VYtwgJrokIsh5WyWBt/b0+HUPmr1UYYyNsYo1UynnJZEBPqMPBWM+MnSr9cQqqI0CjOa
         dPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EuA21wh7QPUCspA18qv028NyQnemPqeYd/7XpFd490c=;
        b=L/RIzn/dayJNvQPGbEBr732TB4t3rUes7873zsq2HvfB0rS82sf2wNFPPPE1rPI8ey
         KumsD3PJf7JF5/piTQOiLZQtFRWNUHYN93S0jyPivxFmJ+ntxlVy5DFTw00c+nfVR00E
         JZd3euxcEopYAS1NTJeTdLAheMEjnojbJbevhwZsKvg65AMx/ioFQ203DjcsOxv9kZxM
         DQVhAYrg5ruRDMA69/lnqijCsS3S739TylORtzopRfzaglL2OqamU8dZzU72ntv9lpET
         w9naEp0/F41m6g6p+3SkjJP/w6nt4OHI8lcyrH9ETY726jbLpnWTZiBl6mmPULbxrI/s
         MbIQ==
X-Gm-Message-State: AOAM530sFxVBOuU3lw2A8YUQhRUwPIjvf/95JAHm/9W/mNscaABsTMB8
	u4g8tOW3TrQiG1NUWVqOEV1b1FXx
X-Google-Smtp-Source: ABdhPJydBHV/5Oo6zAgqKfIr2sRvzZqBA5OPOk0KxqJYE3yFr33CwZGgoyTSJLdFTpmCdX18gIbwDQ==
X-Received: by 2002:aa7:c607:: with SMTP id h7mr18025672edq.214.1590940415883;
        Sun, 31 May 2020 08:53:35 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:35 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/70] python3-mako: upgrade 1.1.1 -> 1.1.3
Date: Sun, 31 May 2020 17:51:54 +0200
Message-Id: <20200531155254.10283-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../python/{python3-mako_1.1.1.bb => python3-mako_1.1.3.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-mako_1.1.1.bb => python3-mako_1.1.3.bb} (75%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.1.1.bb b/meta/recipes-devtools/python/python3-mako_1.1.3.bb
similarity index 75%
rename from meta/recipes-devtools/python/python3-mako_1.1.1.bb
rename to meta/recipes-devtools/python/python3-mako_1.1.3.bb
index bc38009de4..cda4e99220 100644
--- a/meta/recipes-devtools/python/python3-mako_1.1.1.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.1.3.bb
@@ -8,8 +8,7 @@ PYPI_PACKAGE = "Mako"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "2660a4916f2f63456e6885c727b7cd2f"
-SRC_URI[sha256sum] = "2984a6733e1d472796ceef37ad48c26f4a984bb18119bb2dbc37a44d8f6e75a4"
+SRC_URI[sha256sum] = "8195c8c1400ceb53496064314c6736719c6f25e7479cd24c77be3d9361cddc27"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-html \
                   ${PYTHON_PN}-netclient \
-- 
2.26.2

