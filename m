Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.8980.1618733798895314191
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Apr 2021 01:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rNYoFNib;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id cu16so14224148pjb.4
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Apr 2021 01:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zDghvp5CSh+RpIj1LAgkFuoz3IQi6bUn7N8DViI3K7c=;
        b=rNYoFNib1RjuXeIBdY5qkTFns7Z82u3tIXSvy/NW7UJG/3BWHkNDKJFB+lPSDAiA2d
         QLwo4e7sNDW2TV7rqmtwjai5F+RR7FKEiZX+RLkfjw5EFhd507ZUudyLBDw/OROW28Fx
         DFfRfO45NJpE7EGlAyEJRZ0Hcv6G3c0O8qY+QV7N67gBMJ429gr1j4TcxlscF7sj7z8F
         wS7jy0p3qrbnKYB0zxbKSrAWDmDG0Is+++jiuabCYKWy6AbVTBdzPt5NanTvjTTL0TFz
         tM2j0eftTUwxfe6d+Wh6ez+ws13v1Su8GFTnFKMf6hiVwxpsv5Ms6WSI8fYOkufhAFCl
         aeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zDghvp5CSh+RpIj1LAgkFuoz3IQi6bUn7N8DViI3K7c=;
        b=YSrTAaEHrHak/r1w9CjVljgEJn09AgCKs/g4Ap40+6455DKAU74Ax6reY3aI9m0W66
         ALwkxSFZ9312t9bpgJvWJKH39MbNjFyg5dxeRGnVHSVGXP35pEtHE0RHbFGYT/DTQxmn
         Ysdahlm2XHTBiJzrIUESOeKmLtNv0r8K2IR9veyF/adCCc+IiMJPc21fk7bYczb8yMCH
         GYrU2W+smYNIhZ2vTnzJJ0aE6KIwRaMe87VSWFwHYzUt5qjbyVKIaiYsuo2nJkCI2bD0
         Fi3BruT0K3afMECePZtdBfbHLdQmd+YGAH0tAfZmPOmv46tDkcmIoj+44nxH33H21Htg
         oKug==
X-Gm-Message-State: AOAM533D7SX3wjX1eUjdtYbQ0INRxPiD8/D0N9NIwajEJqZF8UTxUqYu
	8XH9YajzB39aiQpCA6xTY+DY4uIx/eVywA==
X-Google-Smtp-Source: ABdhPJzg3fCwBByjJ3LTXC6XPbKtl+7Y5osy+j1gig3/l+p6GTQyD/uLkkNFxm1EFQafY4NL4e9Diw==
X-Received: by 2002:a17:90b:14c4:: with SMTP id jz4mr18044437pjb.144.1618733798302;
        Sun, 18 Apr 2021 01:16:38 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id g2sm2339211pju.18.2021.04.18.01.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 01:16:37 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/6] glib-networking: Prefer openssl backend instead of gnutls
Date: Sun, 18 Apr 2021 01:16:30 -0700
Message-Id: <20210418081634.3169548-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210418081634.3169548-1-raj.khem@gmail.com>
References: <20210418081634.3169548-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the defaults to use openSSL

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glib-networking/glib-networking_2.66.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb
index 230932daf0..786de744cb 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb
@@ -11,7 +11,7 @@ DEPENDS = "glib-2.0"
 
 SRC_URI[archive.sha256sum] = "c5d7be2437fdd196eebfb70c4517b96d3ba7ec13bd496318b8f02dea383e0099"
 
-PACKAGECONFIG ??= "gnutls ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
+PACKAGECONFIG ??= "openssl ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 
 PACKAGECONFIG[gnutls] = "-Dgnutls=enabled,-Dgnutls=disabled,gnutls"
 PACKAGECONFIG[openssl] = "-Dopenssl=enabled,-Dopenssl=disabled,openssl"
-- 
2.31.1

