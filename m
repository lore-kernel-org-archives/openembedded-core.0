Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web12.1188.1604335812681244637
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VS7EMG4I;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id b9so4828211edu.10
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7Dd41zNSvFJrZO2/0wDyWXzQK/KpRrvwussuF9ZG/Iw=;
        b=VS7EMG4I9LrycRIztm593RsQ67NCMD0Ntfx2V5DFEqztYUGCMCF3BTikv4x3WPNwk7
         bpiq0Cuw08VIhfe+xdOhffDlBnGNw8f0cpJxkCdpgh2AOZbwuCi8q8xKcINA/H1svsDb
         I49xaXaqp9mAF1ClhKwPa7I3cw2mMq81HtkmlnQhQMVD3ZvN6xq8sP2p84v4iAYklgv0
         f31DMCCYVNwvmixW5njFXR7fuHrXHH69Zo6zr51MqyqOJsEK1ZfmMVc9k/Zr6JCN9R2h
         Oz/PZcChVwGEfJBgvt2CDoVKBrqkJcgMxQ3qaI7T+/05DuHdto07B8hvhhMFwD76vFt4
         Tu4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7Dd41zNSvFJrZO2/0wDyWXzQK/KpRrvwussuF9ZG/Iw=;
        b=IlG0ZQrFW0mSvyw3+hIiRRfNvFXAa6JcrMlyEa1y2Ep/5v83QZhBzcOHmf/PQqhHnE
         zlu+fon59Hbu4Ynok6KsQLnzls3UEsf1SRICsKBnVeh973a9bQOilDRDFPP1lTU5IXyu
         Yn/HMeN0ONM6hMMWQkYu3arjr83+yn820nnypu4nmX4ERcZpkLOmLL2WepwiyrQmIMpP
         jKUWJfk/Ne2xSSjLm3+lnd8MPR9Hj/p6ziFV87YZ+ptw9NKJE6MxHn4PkkfohJc62nD7
         FENPtVw3kGZOfxMTH/WKDKwUuNxKxBvD9sT3WPwAagFMs21Canv3B9jcDGzGnj6q4RQ7
         dCqw==
X-Gm-Message-State: AOAM531Wx9UqJsGjDas2496FEahnMExAmQnehjWKncjUa0mU3fA42q3/
	7p44ddb1pSir6x+eiNeoQIO1xi8n5QR8Fg==
X-Google-Smtp-Source: ABdhPJzmEkj2lLfcwpi7p5LDPBca2Hf/VQKCvrJSKiH1Sw+YGupkz2+D/GKK6Ns7zI4FKpawFI1y8Q==
X-Received: by 2002:a50:ab0e:: with SMTP id s14mr11791110edc.172.1604335811050;
        Mon, 02 Nov 2020 08:50:11 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:50:10 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 60/80] asciidoc: upgrade 9.0.2 -> 9.0.4
Date: Mon,  2 Nov 2020 17:48:47 +0100
Message-Id: <20201102164907.27572-60-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../asciidoc/{asciidoc_9.0.2.bb => asciidoc_9.0.4.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/asciidoc/{asciidoc_9.0.2.bb => asciidoc_9.0.4.bb} (95%)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_9.0.2.bb b/meta/recipes-extended/asciidoc/asciidoc_9.0.4.bb
similarity index 95%
rename from meta/recipes-extended/asciidoc/asciidoc_9.0.2.bb
rename to meta/recipes-extended/asciidoc/asciidoc_9.0.4.bb
index 711bfbfb9b..51d12cb8c6 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_9.0.2.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_9.0.4.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4e5d1baf6f20559e3bec172226a47e4e \
 
 SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https \
            file://auto-catalogs.patch"
-SRCREV = "9a407dc9a497364c91421fd961954eddb565baf1"
+SRCREV = "8de61a75572b5b8f90c1f87634aa3767472be7a7"
 
 DEPENDS = "libxml2-native libxslt-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
-- 
2.29.0

