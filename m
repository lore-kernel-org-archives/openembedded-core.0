Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.214.1616596801709365882
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 07:40:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=u+iEWrz6;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 32so8642166pgm.1
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 07:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CQGpbF2cL8j74v332FjzngZDcu+KLpD1BIk+/37uAtE=;
        b=u+iEWrz6hVt/v5fn4QqFxKqNoOXeTenYegXRnXV/JpFDaNkgIpmX8DKWfp+HrqJpyS
         dgua/KWgN7JQLFz55JNk+DLY7lCHcKjsnK+0k9vh4xW84QC2wguZnoPsVnLwMjUsVwuA
         xQcN/+q+cgip5TNa2q8q/yGb2F+ylcRdzUy9Osp45C0IyFn0e4/gjHLHxPPDDteklMpg
         xFJHyGJUgOMiWf/PVDNVF9ixJmhOyJ5aOd7hdzCaSl0W1PGoxDQgY8SHvw+LWDajBFxF
         BcmWAWhQyjc33Vy13ko1s1DGt00NrnT8LfOiAo3cNsbvopoUl+2hexU8IN12gRIyZWeY
         8uSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CQGpbF2cL8j74v332FjzngZDcu+KLpD1BIk+/37uAtE=;
        b=n+xguBrI4F1xnsC91DMdBNuIjTxotUfKECCQg/ZNJ2AU0MYbzj1NlQw71/IaYPgEL1
         W5ioDDVM2A0hapJkW7dmM0Y+OjdH8+Bo1xl+0/qE1y5TtmSvtpQv8/ShJ48T1imUxCUO
         N9YFfjNMlhmRya0/KAhSfdlzI4E8rpybVonr0f04wK8kcWCFsaUgJN5Li1SUS822+XeL
         SYaLVwclOAjuZ2+7t54eCA8T6PzcgvdjZjwTzdEatHeXSnlSWR0f5Xn8Y5SgQNUtcDU8
         wC23e7b8li0Dta7xpTspjWQFPap0vKiOKDQlhU+42b+5LugxRkmevS2HmBNrcT6xb+VH
         HwFw==
X-Gm-Message-State: AOAM531GMfciIxrQ8EY2EUzaenSD7kA26UNjF2s2pHGLKmru5NOSxnIW
	szl1s/M41MqawEOSGM0/qtPXiZRUG8n5N/PN
X-Google-Smtp-Source: ABdhPJwJte3lCL2lZgTyZW/hH/j1noSvyV2voNT/ONWQb1EJDJmFBASps9Noqx4S2jvEA/OHnf4fvQ==
X-Received: by 2002:a62:800c:0:b029:203:6990:78e2 with SMTP id j12-20020a62800c0000b0290203699078e2mr3508687pfd.3.1616596800744;
        Wed, 24 Mar 2021 07:40:00 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w17sm2705806pgg.41.2021.03.24.07.39.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 07:40:00 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/21] wpa-supplicant: update CVE-2021-27803.patch
Date: Wed, 24 Mar 2021 04:39:06 -1000
Message-Id: <060587ae477d785db017f4d8a2152206c258da42.1616596544.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616596544.git.steve@sakoman.com>
References: <cover.1616596544.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Martin Jansa <Martin.Jansa@gmail.com>

* update to match what was merged in master branch (and I have now sent for gatesgarth)
* fixes Upstream-Status (there is a missing 'c' in 'Acepted' and 'Backport' is more accurate)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1

