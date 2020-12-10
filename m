Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.12239.1607604805827768208
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Dec 2020 04:53:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Tqag4zkA;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id r3so5375941wrt.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Dec 2020 04:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YlbwukCs2VpTpV5KP5hnHlGFpiD2Gb1/JS5B5VZyEkY=;
        b=Tqag4zkAJn0M5EJ1HoMHUaEta9D6XixL73bCzg3eBiVuohbwrKL3hlL+Qezr/5koHY
         gk5LplHZgXMarXe3qFCbnsYSM+8H2SsekIv4VqSUA6P3oMzJIXDu7KTv8M+iIPFMNEOj
         jtKHZIioI7roev+qojhBaSD0yBCT0P1y4kU/MnwgZRC+k3YxlZ9wefTfpn9MJxjxXFkv
         cECWFxPs9w6qoqgBVGhm7MSCKZ35f1ESo/fP6Gy2LMX9/uXYr+3whVqGO5WXru501dRx
         74+T43NbiGKBcnnaHh4wHuCe0Drqat+rZMwyK/nmlRT33hM36URv6e8sfTBKolekCm83
         cB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YlbwukCs2VpTpV5KP5hnHlGFpiD2Gb1/JS5B5VZyEkY=;
        b=hHNEqyzmYrlUz8oqwVOsa8nPwn2JACk/e6TD2zgr2749kioZy7pNZ+lorsgsVgg3bC
         Z9ryWAZ9/CpmDz8Wd/0BASUiU++H4KtU8fZrE5FUnJ7xRqqEk+EKjQH0DNOLcesPJEf1
         hNJJYyng5RiEoAVbDLQvcI7iwgKa8uUhgslhB2isyHyptE5H5VJoXSUzPgHQl4yIdd85
         kmSn91UtPJsXmBhfJlRh3MpOgzUKzAVoKjvKoq/0yF+WHUE7X4zD9haA1/yP/Lv530yV
         eKK7PMxpWpq1V2aDZW6DyAeg7rG+G2XYdepd6mrgUrTs4QGBf/8eh0BBrLkwjj09/cP9
         SWYg==
X-Gm-Message-State: AOAM53230ADjGZfR0eCs0hjpbBB7o0TjwxjVcxLduFpgybBIpuXGH211
	j7JpBcJC+GcKyZuvXTm8cd960tZQikwLEw==
X-Google-Smtp-Source: ABdhPJwl/vCmnz4IPF8LJ6XdhMnhFo76P4jf/YL475tThIE2qibUIF4vdTwuO4TVPGJv2bwM5dAhfw==
X-Received: by 2002:adf:e84c:: with SMTP id d12mr8445100wrn.382.1607604804084;
        Thu, 10 Dec 2020 04:53:24 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id l8sm9703141wmf.35.2020.12.10.04.53.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 04:53:23 -0800 (PST)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] systemd: set -Dmode=release as recommended by NEWS
Date: Thu, 10 Dec 2020 12:53:11 +0000
Message-Id: <20201210125312.3302065-4-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210125312.3302065-1-luca.boccassi@gmail.com>
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/systemd/systemd_247.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_247.1.bb b/meta/recipes-core/systemd/systemd_247.1.bb
index 09dce2e07d..f20e86d94b 100644
--- a/meta/recipes-core/systemd/systemd_247.1.bb
+++ b/meta/recipes-core/systemd/systemd_247.1.bb
@@ -210,6 +210,7 @@ EXTRA_OEMESON += "-Dnobody-user=nobody \
                   -Drootlibdir=${rootlibdir} \
                   -Drootprefix=${rootprefix} \
                   -Ddefault-locale=C \
+                  -Dmode=release \
                   "
 
 # Hardcode target binary paths to avoid using paths from sysroot
-- 
2.29.2

