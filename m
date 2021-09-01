Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web09.8191.1630503945099552887
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=le8Xgx6a;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id t1-20020a4a54010000b02902638ef0f883so824436ooa.11
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R8lcfDx4kA8NvSUHwCO4nDKytRpdeaexF/9Np0HcXCU=;
        b=le8Xgx6a3u7Rp/9Oa1ygOHxzMTCgiCWV9ri9fExNa9vkAwZBVWuIMA/4z32E6BNJ0L
         TXGlaqNQJePzI4aR7xlk+D64IZGo7NPDfsV1gR4MgKPWUiZKoF0EdvqaZI0pWCQJPG6d
         FTvbGDvwzZ9j0tvVFwDWbpgm9k76BP2ACbk6PJ1MKFBN+gn2HFAYy1Nuvw562U3VqyOY
         40VhCmk58xPfBQU98Mef8oFO/9uCyYh0l2fJ50MySo1piRicKiDJIfpIDUTVt0kCkVFH
         oXMsR3JQI0TXw+kiFrmgwoojlCyzB19HFPKS6fp95qiS5/PkQZoDM5N5h+yptSUTqpog
         S50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R8lcfDx4kA8NvSUHwCO4nDKytRpdeaexF/9Np0HcXCU=;
        b=p+MkZKpdtWoqkDNV3FSTUH972/YhAcjoDpMA5GN3V2I/EnFnEDegVM1kEhTZprbJcg
         Ftz7lc4WMICKT6uvccx6IvHAgN7MX03yMRX4iobcn1mfjYk9dZZjiWS9+NH7MFWOXJF0
         GN6r6K+zURnBWxNrYaGELtagJLiCPVkX3Cj4jSUWu4ddsDEzV2qAxOiDzYqwHh3nTEIV
         nmzX5JPDZMgu0Ird/+5ldru9dlCamx7vGmE1vNfzxCghOx7ywDixZYwTI0wPo1SnFdX6
         ZrmPOR+Ue9UcV59TNmoBXVYoG/6hY5+WB3NJ7wowkTD6KJXi1ATi2SL4Fs/RFfLoCfY8
         RWhg==
X-Gm-Message-State: AOAM5319FclK25vtJNHahFpzdTR0l1fLsdsbGIpcLc48m+Ib/d1Z9Evj
	JIgJMXAtHRqK5s+gdhcpiJTyZqX8188=
X-Google-Smtp-Source: ABdhPJzLclbbqNMUPobx3v5wrIJYrhwmtCp17Ln+rgwMi7nNCPzUGufOWV4SefTknGytGs5RJZvNkg==
X-Received: by 2002:a4a:c904:: with SMTP id v4mr19411757ooq.26.1630503944149;
        Wed, 01 Sep 2021 06:45:44 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c75sm4283772oob.47.2021.09.01.06.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:45:43 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	saul.wold@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 26/31] libxfont2: Use specific BSD license variant
Date: Wed,  1 Sep 2021 08:45:05 -0500
Message-Id: <20210901134510.29561-27-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901134510.29561-1-JPEWhacker@gmail.com>
References: <20210901134510.29561-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the license more accurate by specifying the specific variant of BSD
license instead of the generic one. This helps with SPDX license
attribution as "BSD" is not a valid SPDX license.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb
index 24e0b054d7..9ad19dc826 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb
@@ -6,7 +6,7 @@ such as freetype)."
 
 require xorg-lib-common.inc
 
-LICENSE = "MIT & MIT-style & BSD"
+LICENSE = "MIT & MIT-style & BSD-4-Clause & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a46c8040f2f737bcd0c435feb2ab1c2c"
 
 DEPENDS += "freetype xtrans xorgproto libfontenc zlib"
-- 
2.32.0

