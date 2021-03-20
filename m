Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web08.1309.1616227945241431085
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Mar 2021 01:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V5fEu6Fl;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id u5so13256098ejn.8
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Mar 2021 01:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pruU7oMzp0RK/IViCN2y/V1Q0fY2ybNOqlZqReW0pjc=;
        b=V5fEu6FlFhjqDmoMkU7aU8GTfzQ8OI+fIb3ylPnRvXjfUxaUJyX2CbVAErJQcaKAwv
         /F6L3BuP4D/nWrb6OrJtSQaAILpIEtC8ZkGfYAxMRXHXLBZOXzb9vhjlaHx2dl/zgvQl
         AJP5FyqIYJds0VpXhuyDcrnx+Yr4BmRLmKs1z8wrL/XXyVnwx2xIi75QoDx2S6Pmc2wY
         Udfmu8wHEUcvBBXsr93w/LqIkgNsQaKQJQuMKgoj+6Rmfni7UdYtvJ4jvSpkQQhCTtow
         ZcuVCU9xvVPPNYIOdnS2+uT7PY/0hetI+wb2zs9yIuLUr5c+rcvOyt3TpiA902BnO6I3
         V86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pruU7oMzp0RK/IViCN2y/V1Q0fY2ybNOqlZqReW0pjc=;
        b=POGtIEuUbuJx7fopeI3YrVCwJEH7O6GkyLsgxgNx9DO+BXgoHzFW7T518a90RC1cQv
         Z8t9ZfnkJz17+LNKGufzXxL+i3LEGZRIHx3z5dg9JSrLENVZh23VFEMmZMCPuYYc2ybA
         jzTRnypqELFYbPNZh+YJ7UbjNRzYpjj7WaP9Je7H4VaFHMf2d1qQXngf6QRGNh8T1ive
         +ONg1Q3VLSTx067GSPMw8ZRaVUL4deAWHbM9gJUpPWaoLvTZfldDrn5pokSd8HZ9kES5
         aPcSCofxCtTOJDF4HFgz8xrxzze7O+i9WCf2BWMURoqscTd0Emrd2xK9RMRYu7AnxusP
         me2g==
X-Gm-Message-State: AOAM530t3yOFi3mCOW2Yg39emiZuP11tU/WtpzaWVqXDdmP7j9v1uiUx
	xOeT77hZnV2Hb3iHgTkOuqtK2Wsgeic=
X-Google-Smtp-Source: ABdhPJwUgtULGNSzb6PgjyKNaKXPDaperMn0kRAUNWRIBm0OlS+50pH5WtIu9SD5iZHGKpdoChOnMQ==
X-Received: by 2002:a17:907:7683:: with SMTP id jv3mr8558781ejc.450.1616227943880;
        Sat, 20 Mar 2021 01:12:23 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id br13sm4788581ejb.87.2021.03.20.01.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Mar 2021 01:12:23 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [dunfell][PATCH] wpa-supplicant: update CVE-2021-27803.patch
Date: Sat, 20 Mar 2021 09:12:22 +0100
Message-Id: <20210320081222.19804-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* update to match what was merged in master branch (and I have now sent for gatesgarth)
* fixes Upstream-Status (there is a missing 'c' in 'Acepted' and 'Backport' is more accurate)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../wpa-supplicant/CVE-2021-27803.patch              | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-27803.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-27803.patch
index dc576d1a11..004b1dbd19 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-27803.patch
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-27803.patch
@@ -18,15 +18,19 @@ p2p_add_device() so that the stale pointer cannot be used.
 Fixes: 17bef1e97a50 ("P2P: Add peer entry based on Provision Discovery Request")
 Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
 
-Upstream-Status: Acepted [https://w1.fi/cgit/hostap/commit/?id=8460e3230988ef2ec13ce6b69b687e941f6cdb32]
+Upstream-Status: Backport
 CVE: CVE-2021-27803
-Signed-off-by: Minjae Kim <flowergom@gmail.com>
+
+Reference to upstream patch:
+[https://w1.fi/cgit/hostap/commit/?id=8460e3230988ef2ec13ce6b69b687e941f6cdb32]
+
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
 ---
  src/p2p/p2p_pd.c | 12 +++++-------
  1 file changed, 5 insertions(+), 7 deletions(-)
 
 diff --git a/src/p2p/p2p_pd.c b/src/p2p/p2p_pd.c
-index 3994ec03f86b..05fd593494ef 100644
+index 3994ec0..05fd593 100644
 --- a/src/p2p/p2p_pd.c
 +++ b/src/p2p/p2p_pd.c
 @@ -595,14 +595,12 @@ void p2p_process_prov_disc_req(struct p2p_data *p2p, const u8 *sa,
@@ -50,5 +54,5 @@ index 3994ec03f86b..05fd593494ef 100644
  	} else if (msg.wfd_subelems) {
  		wpabuf_free(dev->info.wfd_subelems);
 -- 
-2.25.1
+2.17.1
 
-- 
2.30.2

