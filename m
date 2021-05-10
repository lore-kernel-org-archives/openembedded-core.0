Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.32410.1620657007865767006
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 07:30:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=I0wlmKde;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.50, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f50.google.com with SMTP id o202-20020a4a2cd30000b02901fcaada0306so3501477ooo.7
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 07:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XLwvUM4ddi1qfhQqtF0hw1lVy4cdqqblvb9xDT9ms3s=;
        b=I0wlmKdenYQR6qvNfxorRQe5MKh7/BbH5eMmgEaNITh29MBgiBviHnpVv07Ru33EuR
         ZCvAQ7g5Scobip1cMor1bJqjq0GtTM+vCQDdjjAPM0TZc/YC5qL2oUuowR0M6z7JC/ZY
         LVvXEHKrQsc7vKHmww1Rsvt1MG4pxt3H6wM66YLdV2yQxeOHM2Lgyd3CfXG29EzeZdla
         mI8fUdyfenFi60dIlrCSa9WEjDe1Bv12X0qISib8UDjiANwS1VxX4EsK/HTGrkxdfNM0
         1zqhRO7UcuKiNJsNC8XuIU0wlu2LnBW2izWdEo366v+a9y/yieuAkfr8JD/AK/4ZlAAg
         1gjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XLwvUM4ddi1qfhQqtF0hw1lVy4cdqqblvb9xDT9ms3s=;
        b=dTfn+P1PkP4Ig6WtdBy6Q/F2/wpnw5io4F88T/4YYAXZJlFeJjIcMlg8Ma8HF6jBgA
         Fq9MMpugBQ95QXqQ82TFWBmeLOu2R4xYF2LzoWaaOOVf0rMT5REBXX67fhDnzTzr7hz5
         aOLLli93hP8jEDcA/UgavuQjrZb4U3k2FnrubGo2OCWpI5yG0jCz8FW35wefv3AGbcbR
         EX/7jHnoQmKzA2DfJoqzmnACY0LAnNPLwMFLQ3AGi6yuUVlhBkDyOZaVc8p65D6H3WW6
         VwrMkB8J2kX1+c9QUmTOJOAQQNJKbF8JJAAP0GeeA/VjtPP0VNuIs7ashbSXBXGA9XFS
         0ngg==
X-Gm-Message-State: AOAM533VRmPjb3HGkt1lgvKltnnhIsLNVTmz2fE9dbYgvH3E7MjlkX6z
	/3FwV3A1Mvn7n6gyxPhV9mtDWGwcykoRzRQRvVk=
X-Google-Smtp-Source: ABdhPJxfTG3SRzqbLa3H83gNzKKrnrp2ToQAl4pNQC1SEGk+3UxVDx+TLLKDMSWPrRsaS63+xU+c8Q==
X-Received: by 2002:a4a:b50b:: with SMTP id r11mr19376545ooo.64.1620657006694;
        Mon, 10 May 2021 07:30:06 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id g16sm2661309oof.43.2021.05.10.07.30.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 07:30:06 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/25] wireless-regdb: upgrade 2020.11.20 -> 2021.04.21
Date: Mon, 10 May 2021 04:28:46 -1000
Message-Id: <0813acd5c8b53bc9adfea54bd6fe3d99d7186513.1620656333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620656333.git.steve@sakoman.com>
References: <cover.1620656333.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: zhengruoqin <zhengrq.fnst@fujitsu.com>

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit df540a630f87c02898f7ce5703f63e9c7bd2c156)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ireless-regdb_2020.11.20.bb => wireless-regdb_2021.04.21.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2020.11.20.bb => wireless-regdb_2021.04.21.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.11.20.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.04.21.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.11.20.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.04.21.bb
index b3567bca95..f79c0b29ea 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.11.20.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.04.21.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "b4164490d82ff7b0086e812ac42ab27baf57be24324d4c0ee1c5dd6ba27f2a52"
+SRC_URI[sha256sum] = "9e4c02b2a9710df4dbdb327c39612e8cbbae6495987afeddaebab28c1ea3d8fa"
 
 inherit bin_package allarch
 
-- 
2.25.1

