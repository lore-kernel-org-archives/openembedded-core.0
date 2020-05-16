Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.7371.1589644728912589484
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 May 2020 08:58:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PG2tMcx1;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id t7so2225684plr.0
        for <openembedded-core@lists.openembedded.org>; Sat, 16 May 2020 08:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iPNDuaMRnq6dS0jb89l2p94//HCkjElusLgRTMoZyvQ=;
        b=PG2tMcx17w2LoZE0L8oGAJsXgmb3nxdtM6NAETj12Q9VNjTscsXUYZ49Q3LF/Jf1h8
         RGsKeC6cxxw6/mlFBzlTENcJRTcuXJN+uH8VXHK9s6HFm3BezOilUWKi+0gyMZ1iX663
         zSRQla0UrAizHClyJUS2IqDNsYM37nzeKkGBfOHfG4eXVp12LuJjHsiZypB0Ga+ZoGfU
         jgqxLO7ql1c4pxFhrxiad9cx4y200HPFhERiR9w6eYlnnY8jFrCSRPjeLpq9ONSDeBAI
         5qiz6GoVL2NraONT0bGOLXt3vNQDMQ/MiOHcHAOlkKnlSl0HDdVrZEjLKnxHCPNk+vld
         AGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iPNDuaMRnq6dS0jb89l2p94//HCkjElusLgRTMoZyvQ=;
        b=dVpsVJFKtkF15W8/sEfvmsB+OhKNjS6Tbnak+QR/4MX8o9mYbOpr6u8Txtw9qe1syO
         w384ZpJwXdS//HiA9DmBd+MKxnHlhUq3Z9SqziXScRu0oGtsJxqzhyiO9Fkz27C7PPkl
         IvLDDLvlTlG58Gzx3e9uliue6hFlFP+5K62sfcHTQbBSp5w3HVdmQ8X7zkiwwZqhD/kL
         ydzlzRrFRpqn2LddueI8T11ACfrnIygsGYu3+sy7av+Lr0DCanUVIoQjJuFI+23jU9IG
         YTCfIzxvqE1QmD++8ybXFZatN63HyG3NaAMseE2INCYULTHSoKBkspc5TMbWYaGKp0E0
         j88w==
X-Gm-Message-State: AOAM5324/RrM4CHG9vgCcC+Oh9eCfNa/NSj3cCIhgu48bWDxp7vBKzxX
	sA6EQVw2jgqOfxu2caexR+yl7CziXVs=
X-Google-Smtp-Source: ABdhPJzvEIqJICWVVjlj4BE9lvCQEblmXIaY9/7z+A1WMm1iA8Djxt92upd1EPwWVZPOeB9iiN/MlA==
X-Received: by 2002:a17:902:8ec5:: with SMTP id x5mr8661413plo.149.1589644728135;
        Sat, 16 May 2020 08:58:48 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e62a])
        by smtp.gmail.com with ESMTPSA id jz3sm4202003pjb.40.2020.05.16.08.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2020 08:58:47 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/6] multilib_header_wrapper.h: Remove pragma once
Date: Sat, 16 May 2020 08:58:40 -0700
Message-Id: <20200516155843.1811017-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200516155843.1811017-1-raj.khem@gmail.com>
References: <20200516155843.1811017-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was a bandaid to avoid include recursion caused by multilibbed
wordsize.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/multilib_header_wrapper.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/multilib_header_wrapper.h b/scripts/multilib_header_wrapper.h
index c81e7ee5e8..62b57ca8ee 100644
--- a/scripts/multilib_header_wrapper.h
+++ b/scripts/multilib_header_wrapper.h
@@ -5,8 +5,6 @@
  * 
  */
 
-#pragma once
-
 #if defined (__bpf__)
 #define __MHWORDSIZE			64
 #elif defined (__arm__)
-- 
2.26.2

