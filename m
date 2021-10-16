Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C81C433FE
	for <webhook@archiver.kernel.org>; Sat, 16 Oct 2021 11:30:46 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.9464.1634383845236439884
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Oct 2021 04:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=Gdpn05IJ;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.52, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f52.google.com with SMTP id x27so53789666lfu.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Oct 2021 04:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4IMcr9cV+cufihHRBpXSaeSfcs2K+66JKUtHXKNZgF4=;
        b=Gdpn05IJt7IbYMNnek8PjKdpKvipIlK4NsByEBsouzpl6qYGOpaH+Zp6gUkBtfzRWk
         DieJog50onNE/31KhpmSlNSmPJl2ZugKtQpBgybvLcrRknDCoz4ZaBnkwG+bhAriseMv
         IGS0fiSPwyQ9Zs8tTm1AcCterAEMtZoMW7kf4r3fS+zwL86VgO6ycZMe+Ep4fvl84oJM
         K6eYVPhGHRB1LTSLANGuxF4ICrge+hp6f/XVF5JAGdGN2/FG+aaw5adeNxGVK+KvpYH+
         IzkvdOkW+3YuxSvn8uhksj0L0xPocIi7swFryW430ZJBO9wBBSvJR6ArwflEQ4CpsKMJ
         o6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4IMcr9cV+cufihHRBpXSaeSfcs2K+66JKUtHXKNZgF4=;
        b=4Kh9/IwoVWgTIc2jXVI4fpj2+2+h+g9uapEmulFcoQB/CxEaJbs9e8hHvrOnHJb1hC
         vca3o5ZZMkofET8zZGCObHlaI3ElrqevjJMEQGTDXiYabdWWTgTJOS7/KiRcFkj8fDgX
         CQFj1NaAmMQU16sO91JvxjmYr5yY40eeE96cnZRVGDXOv0Ycm0v2OkOau/zcgDxqDbe/
         z3GbhBUR2Op6CTE3ClesnsNvVxSmGwMqbmdnVZxpjcCKNXYibQm2y9ZYSx9o78iHjDKi
         wW6c+z8yjJv9aFLbcmDFiSjPjJLMpBAfaqvf8fnU9Xe/+RWseVfuR6uG7cvODMvX7ZI8
         SCsg==
X-Gm-Message-State: AOAM533onyOGsd1evG+5x8KlCn13vg3BgRhOEaI1qJDwLMVxUATTz96z
	JRL1BQmP741JAbJlBkfLy+YLA1VBnPfUF7ve
X-Google-Smtp-Source: 
 ABdhPJzBkFJYXnBY/4qTjafnWmL/orSN6VFjT6yb+Uj4j53oh2/2lZf7K8iw/QV8k0OFMW/Ue6X6BQ==
X-Received: by 2002:ac2:51cd:: with SMTP id
 u13mr16550926lfm.200.1634383842545;
        Sat, 16 Oct 2021 04:30:42 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 i13sm822181lfb.45.2021.10.16.04.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 04:30:42 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] man-pages: update to 5.13
Date: Sat, 16 Oct 2021 13:30:36 +0200
Message-Id: <20211016113036.82208-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Oct 2021 11:30:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157014

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../man-pages/{man-pages_5.12.bb => man-pages_5.13.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/man-pages/{man-pages_5.12.bb => man-pages_5.13.bb} (92%)

diff --git a/meta/recipes-extended/man-pages/man-pages_5.12.bb b/meta/recipes-extended/man-pages/man-pages_5.13.bb
similarity index 92%
rename from meta/recipes-extended/man-pages/man-pages_5.12.bb
rename to meta/recipes-extended/man-pages/man-pages_5.13.bb
index ed30103ccd..2447d9fb14 100644
--- a/meta/recipes-extended/man-pages/man-pages_5.12.bb
+++ b/meta/recipes-extended/man-pages/man-pages_5.13.bb
@@ -7,7 +7,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=92cd5ee2e0b35d782817e7e277b6ce4b"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "2684d42ab53184d7607105834e277577daa7e854cdce0d4aacf9f7ad8437c7ce"
+SRC_URI[sha256sum] = "ed615e9a31978833f59e7316667b9aeffbbdb0a92d1391f9c66fadc6e77d0da8"
 
 inherit manpages
 
-- 
2.25.1


