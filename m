Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E99C28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 13:30:25 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.18013.1661175016584275822
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 06:30:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LAvmuUYh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id k9so13250885wri.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 06:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=m1mxEzJDii9TNMj+YDY2vQZaXe+YYT7b8t+KG3OLkW4=;
        b=LAvmuUYh+G+rzL8zr62l+e67wqoZ5gyLKNVnB9H+yyjocYGRx7tJtZdMLbEe2qBnRC
         950SCbhtw5DCH05V1MIZxAcWBee+02/jkfJASZAm5qWpu3p9KT5FvsBEUsbU4+V9D2g1
         UEDx0OWr3SGEtpDyxtNSk/kC92uxYfDb5y8Es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=m1mxEzJDii9TNMj+YDY2vQZaXe+YYT7b8t+KG3OLkW4=;
        b=ArWP/4KdvWto9I8mk7w0nYBG4k2YL7JE+kTj72d6h7dPFCsjr9VE7OYnmLfFB66+5Z
         YAByt3OUSa3YyKB8jdhYaGVt0GphZ5+krhyVnbsInOXTMvxstsW0QOICo4VF1hMFmuo8
         4+jYAAuF5spXTaALpdPOQ2kwoZhzwi7NWcw05P11EBhZEoTHkKzFM9xCH4RZVKYttvEN
         sM1K3YeNFoFAWZgz9qriRSD2I2UdO1BgWsTichwXHznEM4teLDYWdgZlbak0F4GFqZI/
         74hO7Hg3mWqG0Nil1HVwjis29LNS67xX7HHv+qPH5AceLh3UY0QVApbeQvTiYj+N2XKC
         ftEg==
X-Gm-Message-State: ACgBeo1SXo3YCiWPFY6LBe3pRg4OXle5NQDdBExCS5Ir7LfwTJGdYiNt
	rx39xU84NsxNe9idyP82Nz+lH4SZ5cwRWw==
X-Google-Smtp-Source: 
 AA6agR6h8hr2W1auaABgsNOu6qgZEIpjjOcvUmvbMmcwhh4CB+xz59uRHrSj5PKSkehWSUsr9QtdYw==
X-Received: by 2002:adf:f48d:0:b0:225:2c4d:74d1 with SMTP id
 l13-20020adff48d000000b002252c4d74d1mr10761931wro.588.1661175014317;
        Mon, 22 Aug 2022 06:30:14 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a4a9:e65c:bb6e:14cc])
        by smtp.gmail.com with ESMTPSA id
 c7-20020a05600c0a4700b003a342933727sm5900280wmq.3.2022.08.22.06.30.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 06:30:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] vim: Upgrade 9.0.0115 -> 9.0.0242
Date: Mon, 22 Aug 2022 14:30:12 +0100
Message-Id: <20220822133012.2747445-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Aug 2022 13:30:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169673

Includes fixes for:

CVE-2022-2816
CVE-2022-2817
CVE-2022-2819
CVE-2022-2845
CVE-2022-2849
CVE-2022-2862
CVE-2022-2874
CVE-2022-2889

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 48896465ed3..5b95ab2625c 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0115"
-SRCREV = "6747cf1671bd41cddee77c65b3f9a70509f968db"
+PV .= ".0242"
+SRCREV = "171c683237149262665135c7d5841a89bb156f53"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.34.1


