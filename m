Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.113425.1597938700328409417
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2020 08:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: bjarne.michelsen@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id o23so3122187ejr.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2020 08:51:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tgXP8Z4L71fe0d8mNH7vSQjxmDIJ2UXm3Qr7Pyt85ps=;
        b=OF8y0rE6a6xuP+uABPEgSa9awo2qbt1KgNgVzAkwnDoU8ulv4rHXPnxDaXLe2rV17n
         IVNR8UYxvP7yVi495YcRfWiDjYcTfhDwWKFTatU9FY0WWS2Uteo0mspfwwqs8GXe4t5Y
         i0/mt7MB6ZaTU/eCCIL6S4i8SCfr4idiun5gb3mMEWGWMkjltKNhhbNndkhnGHCZu6tg
         gvmQmdNvZqeWXep629EXqU6IPzQzZo/o5pp084Z2SzR0kwXANo/SufNAevtoATU+1fYW
         lW+jTA7DfF77D4d/s0IM0/DouzpPpkkzWkpvuPIq2M59D2dZoUdVOR5HA3qNaK38SF3U
         A84w==
X-Gm-Message-State: AOAM532t+OQCm5aqfnblhTUFn7jRfWlQIaNWkq2xlIsEEwIHKmTeVqN1
	CUyOWMUbZrluRvZYxqYLRQZC0KUTlEVNFQFx
X-Google-Smtp-Source: ABdhPJwxvHmBuJZBEi75piAshr8eBwgJJR+uIGuUNPWzLFerbjkoMEzNXqPSWwn/Ci5suE4FJzN/VQ==
X-Received: by 2002:a17:906:9618:: with SMTP id s24mr3844375ejx.53.1597938698335;
        Thu, 20 Aug 2020 08:51:38 -0700 (PDT)
Return-Path: <bjarne.michelsen@gmail.com>
Received: from bjarne-ThinkPad-X1-Extreme-2nd.fritz.box (ip5b402d63.dynamic.kabel-deutschland.de. [91.64.45.99])
        by smtp.gmail.com with ESMTPSA id m13sm1545305eds.10.2020.08.20.08.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 08:51:37 -0700 (PDT)
From: "Bjarne Michelsen" <bjarne_michelsen@hotmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bjarne Michelsen <bjarne_michelsen@hotmail.com>
Subject: [PATCH] asio: extend recipe to add native support
Date: Thu, 20 Aug 2020 17:51:30 +0200
Message-Id: <20200820155130.8397-1-bjarne_michelsen@hotmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allows usage of asio for native packages

Signed-off-by: Bjarne Michelsen <bjarne_michelsen@hotmail.com>
---
 meta-oe/recipes-support/asio/asio_1.16.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/asio/asio_1.16.1.bb b/meta-oe/recipes-support/asio/asio_1.16.1.bb
index f381d12fb..dfc3b798d 100644
--- a/meta-oe/recipes-support/asio/asio_1.16.1.bb
+++ b/meta-oe/recipes-support/asio/asio_1.16.1.bb
@@ -25,3 +25,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2"
 PACKAGECONFIG ??= "boost"
 
 PACKAGECONFIG[boost] = "--with-boost,--without-boost,boost"
+
+BBCLASSEXTEND += "native nativesdk"
+
+EXTRA_OECONF_class-native += "--with-boost=${STAGING_LIBDIR_NATIVE}"
-- 
2.25.1

