Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32646C43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 09:06:14 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.3962.1655197552791633767
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 02:05:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bqw4cSCA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id c21so10346018wrb.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 02:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mOqPHjs7BSNbKXV/P5dcwq5M+bewTsOjMlgXljiLlDM=;
        b=bqw4cSCAEXhwd1cqQLw++ilatM/nJemfbClb9SrbKSxrq/AQDG19N2kotGavNgpJCG
         9GCYH4BRldwg1p4q3rF8YgNfB8ffDgtPsC0sFu+kDdHgROJXc7dXMRK/ZhTgm3X8iKbh
         QMEIOdsrO1qeePrtYXsY3N2F2Oo78QG3N1TAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mOqPHjs7BSNbKXV/P5dcwq5M+bewTsOjMlgXljiLlDM=;
        b=fevOKcCNdW82nbpdEi1oeNMUqstM2SPq+XjRWYNP5T9PEF+4+AZBtX+VUtODwuLlzL
         AZiToGHjX3cK5zd3rBBbZj8ZKWAcdScHALhUC3gvvvqWIDlX2S7Pa06rtXVX3FXWdGtC
         V/c6EsjBkFff+2yQG8odnIMN1KDm3UHvQol64x7crwyPzMCckEF/XPsnH+nF+O2NMUUn
         hZxbqJJoCC4KzNny+kejAhVoYeYLCuA4Syjy9UxNjxiaUxER1OD1ttU+ceQ/q92+q4kC
         RSaIxcU1xtNCzY+V1C6Q5hM1rUt8RujT6WMrDA/qWsG/zeOwzzwJy6629nKL3Uu7Pwbt
         k9nw==
X-Gm-Message-State: AJIora9gaUZFkUT/CRG4zwyEWUy/X0lLjsCu3Sy/W2Q3gnM7yQgtewYo
	OLFCA4t5dZxit1AnIeCW3P/T+PHXLlIy5Q==
X-Google-Smtp-Source: 
 AGRyM1t5ymtT2EICWd4Arc1pyDvdJjeEUfpktGXD2eJclm7KHLUY90pbx+s6pgIGQ0s7BdUYz4Fhww==
X-Received: by 2002:adf:eccc:0:b0:212:f1ef:943c with SMTP id
 s12-20020adfeccc000000b00212f1ef943cmr3708764wro.179.1655197550819;
        Tue, 14 Jun 2022 02:05:50 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8492:b0dd:b0ac:744a])
        by smtp.gmail.com with ESMTPSA id
 h7-20020a5d6887000000b0020fdc90aeabsm11043210wru.82.2022.06.14.02.05.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 02:05:50 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] vim: Upgrade 8.2.5034 -> 8.2.5083
Date: Tue, 14 Jun 2022 10:05:49 +0100
Message-Id: <20220614090549.27507-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jun 2022 09:06:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166879

Includes fixes for CVE-2022-1927, CVE-2022-1942.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/vim/vim.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index b22e8016abb..41bbfd4959c 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -21,7 +21,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
            "
 
-PV .= ".5034"
+PV .= ".5083"
 SRCREV = "5a6ec10cc80ab02eeff644ab19b82312630ea855"
 
 # Remove when 8.3 is out
-- 
2.34.1


