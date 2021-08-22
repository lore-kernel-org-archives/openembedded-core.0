Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web08.9613.1629636688055188204
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t1v4AVMR;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id l7-20020a1c2507000000b002e6be5d86b3so8938203wml.3
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=67Ra/Wh0QLm2pmuMgA/4RD/CSGE50CqjRFNr4ghGT+8=;
        b=t1v4AVMR+iZB9ef6Jqs6Bj/WBpmH+hNULGl/F5r67I8VgWd7ow3g8Lgeg22EUpUa8U
         c2XkSDXAx+R3I455jqfFBjyIaYlBNXaydxqINndrXNvihpZ7w29korRYSs4Tdt3x03uT
         WY92B2F1IlwZr+muuTrdrHud1/7/HNBtgD44Z5AouUY8RdkpJ22ovp7Xe3baCkJ2vB8e
         6TE1BWWBRxRpQ+fdNQNWdV5v8/9lhkcsaRNdNII+IAc5UgOuYhhF2hO+E3smx6SIye4s
         NYwX2S46SKq5b21sCJ0tvTyM29Gbz3YVxMzdsvIqqoS95a9XuDdYPhz7JvtT52Hhp3tQ
         ukSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=67Ra/Wh0QLm2pmuMgA/4RD/CSGE50CqjRFNr4ghGT+8=;
        b=XacdRdY2bPP5Io5fFBb1J5iGKI29T2gAG5N5Z0Q39tE7fUlRUk6WogR6leSpRlgr7h
         8e/wB7Ol2hk6rIES4TXOvQVeUpfrIr1Wv21JdcBUFyMh6xVLln1DKDjNZU/QNJxGMbVR
         aXVyXfciSMa1jRi5xwArscpRPpsqT0WXQUgcL0MmmBoP0SPUhj3rmpJBH7qHf/QYUghQ
         jrn3nD6mqaU0H64kfySZlIJXmwlJXS9YumcN0sw9EgDEb3UMDQNUhHFmXVlrJWGHH5CQ
         3eHoHMrgGoNLeFKsKcQC0w3eSj2do5W7ZAJgMfwK0hM+xEzK2sJYq5RVzsCMDF28rA/M
         mmsw==
X-Gm-Message-State: AOAM533tWCdlzcLTMt+GAtU/AYiuJQMlxhLTUx/qqGaE/ZMyYmvjJG2n
	pASP0K1Bislh5ydsbcjxH6BcOfV3NKbjjA==
X-Google-Smtp-Source: ABdhPJzYRsr7TbWzsmpGHCeqpTeduVh0nD0l61TbiNgYzgMjwNfwCIHiCYMHGWBZc/oMPAZP0+nR9A==
X-Received: by 2002:a05:600c:2256:: with SMTP id a22mr1863291wmm.16.1629636686684;
        Sun, 22 Aug 2021 05:51:26 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:26 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 23/55] log4cplus: upgrade 2.0.6 -> 2.0.7
Date: Sun, 22 Aug 2021 14:50:31 +0200
Message-Id: <20210822125103.310416-23-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../log4cplus/{log4cplus_2.0.6.bb => log4cplus_2.0.7.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/log4cplus/{log4cplus_2.0.6.bb => log4cplus_2.0.7.bb} (85%)

diff --git a/meta/recipes-devtools/log4cplus/log4cplus_2.0.6.bb b/meta/recipes-devtools/log4cplus/log4cplus_2.0.7.bb
similarity index 85%
rename from meta/recipes-devtools/log4cplus/log4cplus_2.0.6.bb
rename to meta/recipes-devtools/log4cplus/log4cplus_2.0.7.bb
index 4b7c76ab46..3798b93f76 100644
--- a/meta/recipes-devtools/log4cplus/log4cplus_2.0.6.bb
+++ b/meta/recipes-devtools/log4cplus/log4cplus_2.0.7.bb
@@ -9,8 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=41e8e060c26822886b592ab4765c756b"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}-stable/${PV}/${BP}.tar.gz \
           "
-SRC_URI[md5sum] = "71051de4c2c3ef67f66ce3bbb083cf43"
-SRC_URI[sha256sum] = "5fb26433b0f200ebfc2e6effb7e2e5131185862a2ea9a621a8e7f3f725a72b08"
+SRC_URI[sha256sum] = "086451c7e7c582862cbd6c60d87bb6d9d63c4b65321dba85fa71766382f7ec6d"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/log4cplus/files/log4cplus-stable/"
 UPSTREAM_CHECK_REGEX = "log4cplus-stable/(?P<pver>\d+(\.\d+)+)/"
-- 
2.31.1

