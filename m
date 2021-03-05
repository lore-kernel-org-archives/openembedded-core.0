Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.12801.1614955701365417541
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 06:48:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=SjPXAe3B;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id m6so2340695pfk.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 06:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=96sqg/xoDyGBnqUKidBTBmMFqAiZPOCf5io0VskLOsY=;
        b=SjPXAe3B7BkoWn3IN7PwNF52GxED0f8OBmHnOS7u+kIrFtiGaoFFB1dd1PEnOymdN+
         A0ZgkHk8AnzvPwFfT+i/K20aT1Zu/AiQDws0N46o3QE8mWF83ZwlsPo6htbOmulbcS3e
         Jxb/lICkmlyj2x7EzkYLfUJZ9eEH8oZLjclZLHoz2lKwJ2jIEOFbeHnkuTiX9kMJBODB
         kVbeW7FfhR/m+A4ZzUNcIiF/D+vZ4ySSwgD19gEhlXJC0FRCHha9MjPXoX0O5diqTh1n
         B5pEisrvwxHkNxGqY66rYCvaaoU0Gm1wj23clRoYJvv0NREvURdRwyEv1qofD6Il3TmS
         yhcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=96sqg/xoDyGBnqUKidBTBmMFqAiZPOCf5io0VskLOsY=;
        b=Psa7lnj/cfz+ZP66OJ5K0FZVMqkWFtbo62oB2brrN64ochrvP5jFzaCGfTN6xG3B/O
         Jt2UU/NV7CEuRGKXVvC/gAo7xLRaVyFpGbVfQQaUqupGrdRi4dbBfKXZ/71kDXQQgK7W
         QdyAeDE1LenpFf1jBu18Yi/rUPmww+YuDTFayO8zzS6Qk6/P/1v1QUmEdFRvNJLfJIcx
         8WX9gkCRQd8Blkat1LY5DEPNBqBMeXdKeyYdZyI3ptfm8S+c+lY4xsTPGtRdJ8QFfMTI
         S26naLIYYyE4Ty7AOiPPkc741I0iiLOyud6oJMlqKW1UuH0fz2uRyJm7MFii4bguvbWd
         zPOw==
X-Gm-Message-State: AOAM530HSSbvr7+7+CN+DCKBMljfQVXpCeU7a6Gtstyd7f9qOcwvEt7R
	fX9ZBShdJ+bS6gddvXXyi4wEUXsrRTIJ4wQz
X-Google-Smtp-Source: ABdhPJwsP/a75PyPT8P2E/A0KXw11wsb6H6p0up0DzhfvTM5U8smxKUJxGe3TR6PbURKatFHmJCcpw==
X-Received: by 2002:a63:9254:: with SMTP id s20mr6172714pgn.33.1614955700023;
        Fri, 05 Mar 2021 06:48:20 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id c72sm2659261pfb.165.2021.03.05.06.48.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:48:19 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/27] libevdev: Update patch status to backport
Date: Fri,  5 Mar 2021 04:46:24 -1000
Message-Id: <5112dc734efbb47cbe278bb8cf75ae97136739a6.1614955420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614955420.git.steve@sakoman.com>
References: <cover.1614955420.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The patch was submitted and merged upstream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 871bce0703ca9d14e5c44f6ee0b66fcb13cfb630)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libevdev/libevdev/determinism.patch | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libevdev/libevdev/determinism.patch b/meta/recipes-support/libevdev/libevdev/determinism.patch
index 33a6076b78..06128a8e7e 100644
--- a/meta/recipes-support/libevdev/libevdev/determinism.patch
+++ b/meta/recipes-support/libevdev/libevdev/determinism.patch
@@ -4,7 +4,8 @@ Sort to remove this inconsistency.
 RP 2020/2/7
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Pending
+Submitted: https://lists.freedesktop.org/archives/input-tools/2021-February/001560.html
+Upstream-Status: Backport [https://gitlab.freedesktop.org/libevdev/libevdev/-/commit/8d70f449892c6f7659e07bb0f06b8347677bb7d8]
 
 Index: a/libevdev/make-event-names.py
 ===================================================================
-- 
2.25.1

