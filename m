Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.3350.1594933699047637323
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 14:08:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BXWRJU7Z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id s10so8536830wrw.12
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 14:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=G2iwUHYdZhy6fhnLovuMPKRFdMhWp1AxF3wrHweGwAk=;
        b=BXWRJU7ZjTrA29orczYlYeu+zX5+GL4ANSQFln5oLNyuj1h6GHS0mW09VHKassG2eR
         fgsTH2ZhCNrJYjbjJF82lc7rTw9jSsQ08mSQ4yngATrsovnYJqJ+rWx9uxSyIAiXH/Qq
         9neasS1jGRq965EfA/p4dlpKVxMZqoXPurFJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G2iwUHYdZhy6fhnLovuMPKRFdMhWp1AxF3wrHweGwAk=;
        b=arGeDT5QXFwLNHFf5hl3gkksa6meDRs5IDoCFJvOglNowsgryqQK759XkCbbWYOuQm
         YNfkTvmt34WQ8o0kTSNLOoQ8d6PUMU3ltZmm94MEoqNbb/lACfDPOJ3c0dBY0qzfbsbF
         60Efc4PLdLqa3iE39bP7VYl+IPYSApjvtgiwRNf4wZ0ZPGYA8UNrfVNOp4FBhNBXBdtY
         fNvFdh8ACQwTmcHS5+utZk7gq5X8yY59z4lDNVi1bwjYEbnUgsisP9619IcWXE81vYhx
         LKH8HFpy0UHc/v1JK24tUxZzp4LD0W30U6UgGdo89+Wrxn6u+oZl7HCq2tB56pGeTaXU
         U/6Q==
X-Gm-Message-State: AOAM533bLDxZV+i2Vd1tK3LO81jpXFE3F/ANd8tFj5f7W1DZB/nprwBx
	nnqUgHA4mlXTgtEGIV6YV9XcbOu+U8A1ag==
X-Google-Smtp-Source: ABdhPJxoFzX/ZDfwCOqvvSrMmNlNya33pD0Kd9nOY/s759GzbXIsFosnIOIo8QeMRuQAecZ8SSpXpg==
X-Received: by 2002:adf:8442:: with SMTP id 60mr7350452wrf.276.1594933697270;
        Thu, 16 Jul 2020 14:08:17 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.2.4.2.d.8.4.b.f.c.c.1.d.5.4.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b45d:1ccf:b48d:242f])
        by smtp.gmail.com with ESMTPSA id r10sm10952034wrm.17.2020.07.16.14.08.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 14:08:16 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/20] python3-git: upgrade 3.1.3 -> 3.1.7
Date: Thu, 16 Jul 2020 22:07:56 +0100
Message-Id: <20200716210808.7438-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
References: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-git_3.1.3.bb => python3-git_3.1.7.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.3.bb => python3-git_3.1.7.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.3.bb b/meta/recipes-devtools/python/python3-git_3.1.7.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.3.bb
rename to meta/recipes-devtools/python/python3-git_3.1.7.bb
index 064868d858a..6d1fc4b6537 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.3.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.7.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "e107af4d873daed64648b4f4beb89f89f0cfbe3ef558fc7821ed2331c2f8da1a"
+SRC_URI[sha256sum] = "2db287d71a284e22e5c2846042d0602465c7434d910406990d5b74df4afb0858"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.25.1

