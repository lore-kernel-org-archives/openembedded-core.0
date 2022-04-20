Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 127C3C65BA4
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:11 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.13949.1650491495639403753
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 14:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=rQepeSU3;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id u5so72366pjr.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 14:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uRFoy7KTIMB4WOGezHzBc4i9lUUeIf8jxi+qdwBSJOw=;
        b=rQepeSU3t4BJerbowQXByBCqVM3b3i5aGaPbuUIYR3O0x7/btlvg+fnrEl4NT7ibOs
         LQxtGdoqOICFRV21CN1ghhsSV5hRZ8S/lPunj8Bgbuoh8zYkfP7qJbexqEYmDYj/pQZR
         cC0FNDBN60L1/Wlf4eHzkRTzn2bk/uaRuXc6KvvzwGvta3a3IY/b4EuGPEF9BdHOfVvP
         Sw+fFk66NPhibJQGYhxDi9lxI+4ArEMS7Swwqvml311SieNE5sftRlvpv3EmjLT0q5tS
         Ki87P4Hid7nEOEE6cu+Mk7W1wPRJvLxLfiQ6+S7ysTT/O8X4EE3tUCbzRVQLCdKplVNB
         u78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uRFoy7KTIMB4WOGezHzBc4i9lUUeIf8jxi+qdwBSJOw=;
        b=RNX+k3sSi1tIQ3STsQ+Gl1fNEufbs9kvf7FS4+0hYDoSL06C3Kb4zXxBYFM6Q9i2Q5
         nbujKD48z/Ac+U0Yd6N1HF00hFj5sfEb4XU4k9JN4zIyhvJncbNfwBm/TosjceJ8h8RN
         WbdlJ58kmfLK3D62qKj8L9TpYKZWu5v+wuB1VJcZ1csKcUYgwDjW+JcpEIJQaNwkJYe2
         ZQ/pM3KQsgf0G/MebU8CkyK1fmO+rYtWGplsLDfKiV7rn+y2AJykteRotBUlsFz5VNpf
         ZO4jmceCquwJNVYqHeOKbaGWHLBqynlQG83gLiDrgeAAtC9OjDujYrX7hSmEHitE6ZRV
         ecqg==
X-Gm-Message-State: AOAM532VUn8uR5TMa52C0G5TF237FR0XeD1K4kk4wdjYgKy8yiKkobqg
	pvNqKpt8MKAadoeM9LdaFK7iBUsDKI72abKKAlw=
X-Google-Smtp-Source: 
 ABdhPJzemTWV91FmftOxyzj6Ut1A//dhH7YhduZX7H9Fvk7MjLF6XLPsDdA1mLk65gLP1hIbiIRB3Q==
X-Received: by 2002:a17:90b:3908:b0:1d2:8794:5a48 with SMTP id
 ob8-20020a17090b390800b001d287945a48mr6682790pjb.61.1650491494790;
        Wed, 20 Apr 2022 14:51:34 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 e126-20020a621e84000000b0050567191161sm21102153pfe.210.2022.04.20.14.51.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 14:51:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/9] wireless-regdb: upgrade 2022.02.18 ->
 2022.04.08
Date: Wed, 20 Apr 2022 11:51:09 -1000
Message-Id: 
 <635d1ab7ed8e813e01f49b47894d978c8497df34.1650491190.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650491190.git.steve@sakoman.com>
References: <cover.1650491190.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164729

From: zhengruoqin <zhengrq.fnst@fujitsu.com>

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c6ea7450a919f2b571746e7af350c1362e41f8e1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ireless-regdb_2022.02.18.bb => wireless-regdb_2022.04.08.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2022.02.18.bb => wireless-regdb_2022.04.08.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.02.18.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.04.08.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.02.18.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.04.08.bb
index 4e6da4cbe1..ad6ba8dc8b 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.02.18.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.04.08.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "8828c25a4ee25020044004f57374bb9deac852809fad70f8d3d01770bf9ac97f"
+SRC_URI[sha256sum] = "884ba2e3c1e8b98762b6dc25ff60b5ec75c8d33a39e019b3ed4aa615491460d3"
 
 inherit bin_package allarch
 
-- 
2.25.1


