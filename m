Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.273.1619279806918270405
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Apr 2021 08:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gL4HVIPd;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id a12so36061511pfc.7
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Apr 2021 08:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dgX4bmvb7pw83rYr7rJc0CBNkIY9cpa98RFpl9xqzL4=;
        b=gL4HVIPdxXtWLoEeJZ8FND/6mdWNjwoPhg4F5biomd/NTNWI15Jbbk1kLjC9c44sP2
         HosPsey2Xssc5rEvs6LWftZ6N3AaKvSJPBOtmP7RE57eN0HJC9IQBm2LHq9aYHyA2rB3
         gDNidgW3USx9nnP2xCsfkogWC2ydiaDy1D9KN2a8GTJj/yyuQiNstdGwRcm/IKwepzs0
         /IGDEhUI++YGWP6oW0Be1WRvsmDiZNL9TOUCOEg/hfUP/8b1VEJ9cAvJhBkyg0CIh1t6
         Znn5a9DX8k0hlTokLvc/u9STI6I+FKltuqH/JQacdp8zEINgLnHlHc76bYlxLoghY8Ml
         cnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dgX4bmvb7pw83rYr7rJc0CBNkIY9cpa98RFpl9xqzL4=;
        b=aGep6S1N/MGpXaPJjeDcTO5weqwWigrqJyPsoJq7Z67N4vzbpF5QM4EmGTqeTuOdz3
         ZeL0J0JKuKZpblNm1ZevzWqrC+o8hiMHqrMxN6axnt1PV6JfEE6X+GhAuu1CF8tbhgIb
         8JhlNv5tBe4pD7FcIJZ1+go0TBJa+qxth0ZXMkFG8uRbsg3cD2iVmc0yplmKXVBmyHnL
         HTa/DRbs0iATrPpq/W4EaoxSioWcFmYBIxXmqJY6T0oUcanN09VicR2I19dQNuA3ZxX9
         sk3rZIF5CdU3pEKA1uplTN/LWqupkoGmpCdCJp79vxUEhXNb6UznZh4iTmi7zYDCjPOg
         h5Jg==
X-Gm-Message-State: AOAM533aiKqZRiuq7zOihi2zP8kKCyFeQ0fbIEkGwGiqvwsN21NRKYtN
	SgBRZjAC3/TNqCrpM9ayI4jTNEqNmGvVpQ==
X-Google-Smtp-Source: ABdhPJxkxBrxtzxV3p0NKudpG5dyG0/3OyxVxiCmLwwaLRTSpOtjSv6pVpM8M7sg+/N8vytYeEiQAg==
X-Received: by 2002:a65:4c89:: with SMTP id m9mr8768495pgt.330.1619279806375;
        Sat, 24 Apr 2021 08:56:46 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from hilo.hsdl.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id a20sm7198299pfi.138.2021.04.24.08.56.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 08:56:45 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] default-distrovars.inc: Add seccomp to DISTRO_FEATURES_DEFAULT
Date: Sat, 24 Apr 2021 15:56:39 +0000
Message-Id: <20210424155639.1131482-7-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210424155639.1131482-1-akuster808@gmail.com>
References: <20210424155639.1131482-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since xattr is included, seccomp should be too

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/distro/include/default-distrovars.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 9fcc10f83a7..45f4633c354 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -10,7 +10,7 @@ LOCALE_UTF8_ONLY ?= "0"
 LOCALE_UTF8_IS_DEFAULT ?= "1"
 LOCALE_UTF8_IS_DEFAULT_class-nativesdk = "0"
 
-DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth debuginfod ext2 ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat"
+DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth debuginfod ext2 ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp"
 DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT}"
 IMAGE_FEATURES ?= ""
 
-- 
2.25.1

