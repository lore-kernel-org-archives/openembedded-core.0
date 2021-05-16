Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.11575.1621204382304943754
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 15:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IRpBPNPx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id q5so4466483wrs.4
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 15:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xXjKeWgfYHE80SK5O/kFGDeBm91GnxTQloblPwbi1KE=;
        b=IRpBPNPxrPsmETYh1reEUYOB4N+bKtfHiQNPY/qxB6YayVXZubTPN8875F+R6bki61
         uk71IeC7CJOOoOwWqtrWNraJdtZSBhW2PnLhf7ez9wLqKuS2KsrKzkmoq2nzlarZa1Sq
         +PR8yBMv3jHmi0F1VBQOpdAEr5WCjvd0ywy9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xXjKeWgfYHE80SK5O/kFGDeBm91GnxTQloblPwbi1KE=;
        b=Wbi986Zp5vAqn8c7kMdwJQWO+EQbyRd3jpiTOwtQkeDk9SvngE5AuQyd7L0J1TDmBH
         D9gWFpaPI51oQwwz+9LxLrzu5cNgEzih3WLDhaVOIzvIGe8Y/PrxZJ8/kSHHcIUT+q0a
         DJ8tmmHPGG5dUtKfoSNwbcHxrwg7n9Rh0AkQiMl6ELCCwFoiBQoCkaAjGMZcV9KMzjB+
         A7qManHclfBJ2VxFByI+02ewQv7ZQjBKS14R1RFwKva+RJy5T9A1gfa4/y6HMwGbLsZW
         1meWJdHfyqAIx/AE3KslqHY3xEROn4t2eYXEWWFM36T2TU5ydYtCTTCD/Jt3YqCfEMEJ
         yTBw==
X-Gm-Message-State: AOAM530ThbXrmbkz1vmrowcpdvBa6PCyU85hDXCKCxxDud3SjgwyclA1
	5ezP0OxTxP3tzr38U2quQQFmoMv3BeclaQ==
X-Google-Smtp-Source: ABdhPJxPVbb/rgUj3hCDvn4DceuXasMXpTD/Jmi+MoxY//37M5p6DNzyeLnZ+7rlLnn5MbB0zIQnlA==
X-Received: by 2002:a5d:46c5:: with SMTP id g5mr71741114wrs.33.1621204380796;
        Sun, 16 May 2021 15:33:00 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id f8sm11621759wmg.43.2021.05.16.15.33.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 15:33:00 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 24/27] sqlite3: upgrade 3.35.3 -> 3.35.5
Date: Sun, 16 May 2021 23:32:44 +0100
Message-Id: <20210516223247.2401235-24-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
References: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../sqlite/{sqlite3_3.35.3.bb => sqlite3_3.35.5.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.35.3.bb => sqlite3_3.35.5.bb} (83%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.35.3.bb b/meta/recipes-support/sqlite/sqlite3_3.35.5.bb
similarity index 83%
rename from meta/recipes-support/sqlite/sqlite3_3.35.3.bb
rename to meta/recipes-support/sqlite/sqlite3_3.35.5.bb
index 459dcbd4c8d..d74a6210d5a 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.35.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.35.5.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2021/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "ecbccdd440bdf32c0e1bb3611d635239e3b5af268248d130d0445a32daf0274b"
+SRC_URI[sha256sum] = "f52b72a5c319c3e516ed7a92e123139a6e87af08a2dc43d7757724f6132e6db0"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_WHITELIST += "CVE-2019-19242"
-- 
2.30.2

