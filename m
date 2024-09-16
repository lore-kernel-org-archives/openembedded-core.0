Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86291C3ABCD
	for <webhook@archiver.kernel.org>; Mon, 16 Sep 2024 03:30:11 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.879.1726457410029127319
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 20:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VKWIAjJd;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7db12af2f31so3552334a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 20:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726457409; x=1727062209; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e6R7r81LXfApfZ7ce/KrUJBvE2Rgc0ZJBhdPtxTv/L0=;
        b=VKWIAjJdedGtoXWu+9zjMS+dJx52WHlI5lxshGM4n1+/zf8QDscK1C3fza3uxYSTmx
         kvDKLvxvZj8ifXVZrPPD8Jniqtk+8LnbAi/C7LhYInc9+l130KyLErmsMcpOZOD5bcaI
         gZ36jCXoTedRqUBtb8geMqOrhHxWM7vJoQlnuvUzczy3X8/HMIhIfKpUS3fsC/b/lW+4
         bILmhXZURx4JKIJhR3lTMLLsCMSjnXbHfCFltw2ZW5I3K3MJygLNIlNnMpGS6tS/lF6H
         iOGxbkxc3OM9lAO7IMDzX29gkccrfP/6tFXZuUMj18RDipBydEvscLdAQMe65QchaypU
         27jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726457409; x=1727062209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e6R7r81LXfApfZ7ce/KrUJBvE2Rgc0ZJBhdPtxTv/L0=;
        b=ObD7eI6M2tCTSf1z+ju6LCLhRqGJJRI3kIe2DAYJKAXXVWJAKWUIBf2eRh1rLCK564
         5Q3uy8P+6tNsT6FaIuNQC3itjgBpijATPovWFGdwxR3D3LUekUVFmYRexRm7JTm8A2oT
         HYmkgnIiNnNCav671l0/Lw6mDHqs9NiMzpL1/9r6xdNVS8W/eW6nagj6tperR+zINCyk
         AH57X5CQkVP/n2cWXaM3qaJpDFcuAIgZ2UkibT2+AoqrBoUqW9dypi/37seqsFMbDE2q
         XldWLkD/5uz/4/tAP6nDV+4ttMYGsAvpniHj4SGgs0FKpgUhHXAfLIg9R3lFzkTBs+HM
         koiA==
X-Gm-Message-State: AOJu0YwJWgbLdWVUWprvpqlry3kRJWeFeZub4ZECsdWuopm1Hpg+4jbK
	+dfwdNUpQWjVhW68vLGc5TVsorzC6X/t1JTIF36XTUcbm2BPih6/6c/5r1HH
X-Google-Smtp-Source: AGHT+IErOECQ0/R/9oNrkMCcxcuS8EfbeiYcaJoutYRx4qhQ6U9+n/sn2zvF8NMxccESNNcsoi+VGw==
X-Received: by 2002:a05:6a20:e68f:b0:1cf:e5e4:a24f with SMTP id adf61e73a8af0-1d2b5e600b7mr9359813637.8.1726457408891;
        Sun, 15 Sep 2024 20:30:08 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9c53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b7ad4esm2900862b3a.116.2024.09.15.20.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 20:30:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libpcre2: Update base uri PhilipHazel -> PCRE2Project
Date: Sun, 15 Sep 2024 20:30:06 -0700
Message-ID: <20240916033006.2657214-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Sep 2024 03:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204603

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libpcre/libpcre2_10.44.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.44.bb b/meta/recipes-support/libpcre/libpcre2_10.44.bb
index ceb2b854588..36f58e46122 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.44.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.44.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=321a5eb46acae6b6c1ff2c7a866d836a"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2"
 
-GITHUB_BASE_URI = "https://github.com/PhilipHazel/pcre2/releases"
+GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/pcre2-(?P<pver>\d+(\.\d+)+)$"
 
 SRC_URI[sha256sum] = "d34f02e113cf7193a1ebf2770d3ac527088d485d4e047ed10e5d217c6ef5de96"

