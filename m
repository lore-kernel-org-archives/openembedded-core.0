Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web09.2548.1628559425077164094
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 18:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UHVuporv;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: flowergom@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id q2so18762992plr.11
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Aug 2021 18:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ao+2UcQPv997N0sgbm7zWh9ZAQYLu0aZAAoQhm7blnI=;
        b=UHVuporvwzbxaWbCGwFjy8g94R5HEzbMDkS08xpOlukD15ohiFRcbR42WxFOxfbZjv
         AWgBxs/oCYT5HRxPrBWQKNVBweJ2eGF8Any1V+mBE8fNCVNSPD+W35b2BoWdvfaiCEQc
         qBqSagpiCPw8Wk/rlrlXsQrrvp8puSIPLBAvYsbOUc3G9l+K4FsQUy1fbOOzJqEOv+2b
         ZBPq0z5jKYogcgGJe3WA7SxjdIzFoqdSmKinZ7OJ1SQhFmiwgO2i3DZ0sFf0WBpLNEYI
         Li3kgxqR0PJ93ioQTiOJpvT4sD9W/Zvv9ptGR/wccPjPPfh+dh4WKKMKHDVSaID3pdPY
         Gn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ao+2UcQPv997N0sgbm7zWh9ZAQYLu0aZAAoQhm7blnI=;
        b=rsNY17FAhf5FpXTVGEvr0EBEqh/qQ3fLBpT86ams0TDitBvxZe5fBSKzl1aqqG+cdD
         3rsgQHQ4XmH2jjAhvIw9gBbVzU1FF0uUxdGd/ven+Hz22KAnHpkfdQ42LypukAY6XJZb
         VwB3ny+XdWkg2H9Ax2ei1P18k9aP3pqZRL8p9+e+C+LGxws2NrZ3jRsGmbmB8JHIge3s
         cRChBgJqGtNpfePO6VNDg4+4HhDQp9z7/ppSmfWnGryjsj2OX4TsEaTSLoH4UaMDLQOj
         +cX845G+bwubVOHpmbCrV6pEFgJybMmHs5V92FJmtO1w1MWAv7Tekus+Pp+0WrbSod/C
         MOBw==
X-Gm-Message-State: AOAM53066bOzPKubFNLLeDPjRIlIw2e+kxSqYT5ODuMtfX7Uc7V0KeDX
	YtRitzRLRcdIMsQBKr9mE3IspH82hmMFIw==
X-Google-Smtp-Source: ABdhPJzYv715mt/JdsBr+PX6EnJs88jKGD4F2MJfYDqP3zH7LAZo2QehaF5Zngak7mCnWXj5haAr1A==
X-Received: by 2002:a63:7cb:: with SMTP id 194mr44444pgh.308.1628559424295;
        Mon, 09 Aug 2021 18:37:04 -0700 (PDT)
Return-Path: <flowergom@gmail.com>
Received: from localhost.localdomain ([59.6.144.168])
        by smtp.gmail.com with ESMTPSA id 21sm22012992pfw.67.2021.08.09.18.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 18:37:03 -0700 (PDT)
From: "Minjae Kim" <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [dunfell][PATCH] ruby: 2.7.3 -> 2.7.4
Date: Tue, 10 Aug 2021 10:36:54 +0900
Message-Id: <20210810013654.234909-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This release includes security fixes.

CVE-2021-31810: Trusting FTP PASV responses vulnerability in Net::FTP
CVE-2021-32066: A StartTLS stripping vulnerability in Net::IMAP
CVE-2021-31799: A command injection vulnerability in RDoc

https://www.ruby-lang.org/en/news/2021/07/07/ruby-2-7-4-released/
---
 meta/recipes-devtools/ruby/{ruby_2.7.3.bb => ruby_2.7.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_2.7.3.bb => ruby_2.7.4.bb} (95%)

diff --git a/meta/recipes-devtools/ruby/ruby_2.7.3.bb b/meta/recipes-devtools/ruby/ruby_2.7.4.bb
similarity index 95%
rename from meta/recipes-devtools/ruby/ruby_2.7.3.bb
rename to meta/recipes-devtools/ruby/ruby_2.7.4.bb
index 318b9acdae..dafa7d2f6b 100644
--- a/meta/recipes-devtools/ruby/ruby_2.7.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.7.4.bb
@@ -9,8 +9,8 @@ SRC_URI += " \
            file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch \
            "
 
-SRC_URI[md5sum] = "72ef97685008981de3ddb748d0dab31f"
-SRC_URI[sha256sum] = "8925a95e31d8f2c81749025a52a544ea1d05dad18794e6828709268b92e55338"
+SRC_URI[md5sum] = "823cd21d93c69e4168b03dd127369343"
+SRC_URI[sha256sum] = "3043099089608859fc8cce7f9fdccaa1f53a462457e3838ec3b25a7d609fbc5b"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.25.1

