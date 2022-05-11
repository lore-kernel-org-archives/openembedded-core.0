Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45623C433EF
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 07:11:10 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.8434.1652253043957577433
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 00:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jnUq5kmy;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id j6so2083307ejc.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 00:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m+c+uQYEfHxTnWb6ZD/6fqj14rCNx80QwdW7tyT61fQ=;
        b=jnUq5kmycb6aiLCrwciwlD6OopLVyanZEzmsMMa+IA2RKfBhD0L2KQG2VpAXwGPYtr
         6yW6+wc02aAMOigEpiYndgIyCszOnr3JPx3zCZ5y2MTEQIhsGvMocVZ8tJLtw/FX+BEL
         qzPgsoWTvT5BNxgUIRwrqvWPcL0zPa2IugORyc9094+Zgp051zmbyEbBFqPF+i4kpQ1W
         oI3Qfh6ig52fTVN76fNGH7JZ2DB48F+pbdJwHfu+BhIPssHABB0m/bGY72yUK3FFUsO+
         4aAY1geOu+WtMDFOZpS8AQv+3fYXG+8p92wXOm/0mlQ/CkIhRcEtygyVQ5SsED1Q+vM5
         nRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m+c+uQYEfHxTnWb6ZD/6fqj14rCNx80QwdW7tyT61fQ=;
        b=RmEt4nzCaWsUJTT92tuMBSs/AUIv/rrPfyY9rLhjFZQxYXZ/U4TwWdEOzPhonlBl56
         hehK+UPlAl4zV1XKvf5PUGV3t6rM5mamYQ7a5N02wou/bESQlFErM6CxNt+AL0foDWmn
         DSt7At/TAtK2bW4C+sSroomBvtJo6UUU7PWS/0IIa9zb7/tUCPidLoiJSCG9fU/eC9G+
         obMPbDFGdn71l34sX0abJ6oE1a3AhFlPESEtWfpakBAIj3vs21GvF0vqkxH1UEwG3gey
         C+llvsErGB40zch22e+B1UUqae1mLflD+O8gDB9xwQpnv4c+u5hmt+2YMQTdBH/vpa4O
         v+yw==
X-Gm-Message-State: AOAM532PmGvR8OOYoy1MffLDn9xDV7OjRGSFTlCScL6gOlCqdvMhX/ic
	QS72MY1HbvIhUE4vsi1fOH19tcnvmlk=
X-Google-Smtp-Source: 
 ABdhPJxlygu7RD54rTLyh5xhB2WV2rKBkMCfPLwguHSp5V+QC2TLifAqnxd6gCxYam0dnktuH15GYQ==
X-Received: by 2002:a17:907:3da2:b0:6f4:78d8:7c23 with SMTP id
 he34-20020a1709073da200b006f478d87c23mr23412185ejc.233.1652253041757;
        Wed, 11 May 2022 00:10:41 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-80.retail.telecomitalia.it. [87.5.19.80])
        by smtp.gmail.com with ESMTPSA id
 j21-20020a170906431500b006f3ef214e3asm590703ejm.160.2022.05.11.00.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 00:10:41 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [kirkstone][PATCH] vim: upgrade 8.2.4681 -> 8.2.4912
Date: Wed, 11 May 2022 09:10:12 +0200
Message-Id: <20220511071012.5501-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 07:11:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165488

This update include fixes for two CVEs.

CVE: CVE-2022-1381
CVE: CVE-2022-1420

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 21ff036cf4..c5922b7fcd 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -21,8 +21,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
            "
 
-PV .= ".4681"
-SRCREV = "15f74fab653a784548d5d966644926b47ba2cfa7"
+PV .= ".4912"
+SRCREV = "a7583c42cd6b64fd276a5d7bb0db5ce7bfafa730"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.32.0


