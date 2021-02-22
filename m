Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.33949.1613997400843974819
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 04:36:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A/N5mzaE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id m1so14185535wml.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 04:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=y75r/2yRSq6vvrupoGLYWg6cWUObJjLc3x0FqYJqJuI=;
        b=A/N5mzaExXb2I8ZGva/lwd7RKyX2PJplEX2b4JWIqjlMcPk/SdzRN3sSTzZ4455Ht9
         20nDl6M1v6FPsdh2aWK2VttxX6cMJuc39UoCtYFR+BBHG7mXeyqd6otdnoKAqTmmSjNm
         wUD89vcQLV43yUx1BxS8oXjSx4JFdWZiarJqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y75r/2yRSq6vvrupoGLYWg6cWUObJjLc3x0FqYJqJuI=;
        b=YSVX0E3sIOTP5PyuPydBfO1/dYiID6liij0Z1a+iaAiYi0nGbuS3BlhgaAS4ssXsod
         ebhAlCQSh6ZauJMMiF9SqIx3gCltQ9h/xSz/TQgolyG5AJlgFZ7UR+1I9wjnVqo8ok/a
         YZmxzkyPhoAgNZhJMuNVVQvvDg2XHfu7sqD7SjluqiHkGBEnPWk11FuGxM9IK+Mo+RG6
         QHAjTvyFhzt89eSqm/kUZNaN1bEtYn3A4ASWCDA+JhFH0bi9EFjHFuMuktGbdV1kjtTP
         bQB0n30I2V+pm2SD/jq4aQpHT1Woke5L+p8hrfVryXTJF2k+x0wLCVGU80mNvCRjhRjd
         IYUQ==
X-Gm-Message-State: AOAM5333HSeecCpIPKddsGgnT+JCB0Irc31SLjFx3SIMbpim7/tQa+dv
	wriMKypdJl8XobMjeQc2EC+/KDx56WJeXg==
X-Google-Smtp-Source: ABdhPJwzpRkjCqi/UnO9jwB4ogVs5J722LLBhjqFHdzRLyqNzdAZ66BVBrVcHlSoE0OSxds2FgNpvw==
X-Received: by 2002:a7b:c355:: with SMTP id l21mr20405582wmj.61.1613997399341;
        Mon, 22 Feb 2021 04:36:39 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6747:849:8224:46bc])
        by smtp.gmail.com with ESMTPSA id c12sm17432526wru.71.2021.02.22.04.36.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 04:36:39 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] diffoscope: Upgrade 166 -> 167
Date: Mon, 22 Feb 2021 12:36:34 +0000
Message-Id: <20210222123638.3754068-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210222123638.3754068-1-richard.purdie@linuxfoundation.org>
References: <20210222123638.3754068-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../diffoscope/{diffoscope_166.bb => diffoscope_167.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_166.bb => diffoscope_167.bb} (83%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_166.bb b/meta/recipes-support/diffoscope/diffoscope_167.bb
similarity index 83%
rename from meta/recipes-support/diffoscope/diffoscope_166.bb
rename to meta/recipes-support/diffoscope/diffoscope_167.bb
index 14c95fe5afb..9ce59a0ba01 100644
--- a/meta/recipes-support/diffoscope/diffoscope_166.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_167.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "20d0b4091ae535dc7d094bf5f366e0687e0b4337a268254b11925b8e7c9ea9c4"
+SRC_URI[sha256sum] = "d95cef5b3eef49fa1c811c1ac103f7f7cca4a0ebabc674e4283b51f28309d242"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic"
 
-- 
2.27.0

