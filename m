Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F093C433F5
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:42 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web12.33927.1649072758141168194
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Apr 2022 04:45:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k6/SOpLx;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: flowergom@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id x16so3369715pfa.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Apr 2022 04:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=mirnXLH1fN34Ks5in3P2hcMCiBDpN+hK00y7Cw6qUrk=;
        b=k6/SOpLxPihr1MprLsBBLqlnzXGLCMw+mTnc06ohOGkHR62KPyzivI+Dj77UBey4LS
         CtEtYV+kHVTYhFl2UkP71H8fxXXLwaldzznpXhRnRzovyRlNGzYqbhMMs68jFvMPJ4fN
         r30isoNQ3rjKdkR7Gqr+9nzqlAhYLtIrW6ORJlfBLeWlDmPKc4Pz4n44UEUYeNCJLpb5
         RU4coxeuSU7lp/0UcPkpVyHCmALs1tvJlQ/A0H1hKF9hj+tsSlWsaWhYNpewguLQecQm
         I2Yfo1VbZ8uBDnNyZ9YBp4ddPuYm6eG3gnrvqdi/Px0zYJ/Z3f5P4R3KV2heqqTp7GUB
         5oNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mirnXLH1fN34Ks5in3P2hcMCiBDpN+hK00y7Cw6qUrk=;
        b=RXDKz5lybi+VXNIWGlw099eUkHt/AvP4WlQYNZuNnJaBaZUqpciQS/YID9lTC0ANLZ
         HdGfQDH/cblsTxSaJlpp2k1y/K6WA5oBupmwmufdPtuiwXXMFERTSTjibrNkeQg6tz9N
         PUyuLlBwTQLg+4pKQ0Ttmyv4Nx98r2EwABsmlYGi80KA6zURrmUAecelQ/BYjAgOYEdB
         yxjuqmI8exSJ9+dOndcZtDxboy8HCLiJ1SqCGMqTGndcn3w2iNFBOvf+/38MQN3SXBvY
         WqlunVzH2C7Gz17AAXJgK46NNqg3NfSjbc9BM02mvSyfbGevxCxEBjnobc9SI4fiA2zd
         vbzQ==
X-Gm-Message-State: AOAM532jS55as9DKqzo5NED5n5M0l6IvXtSV7lpu7dRtVCq6sz3w7ZwA
	qZ6KSq6322K1ueWu6lLB1RnCMO8VNXLIqA==
X-Google-Smtp-Source: 
 ABdhPJzxsxwDEDXGaChHn82A9KY8tpcSAvadkAz/MDAVLUUjkNKcxm8GESMu4tZ4u20E8CmmwaWWHw==
X-Received: by 2002:a63:6c8a:0:b0:398:5208:220a with SMTP id
 h132-20020a636c8a000000b003985208220amr25771684pgc.176.1649072757094;
        Mon, 04 Apr 2022 04:45:57 -0700 (PDT)
Received: from localhost.localdomain ([121.168.114.144])
        by smtp.gmail.com with ESMTPSA id
 y63-20020a638a42000000b0039870096849sm10278842pgd.63.2022.04.04.04.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 04:45:56 -0700 (PDT)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [PATCH] multipath-tools: update SRC_URI
Date: Mon,  4 Apr 2022 11:45:38 +0000
Message-Id: <20220404114538.259-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163986

The git repo for multipath-tools was changed, so update the
SRC_URI accordingly with the new link.

Signed-off-by:Minjae Kim <flowergom@gmail.com>
---
 .../recipes-support/multipath-tools/multipath-tools_0.8.4.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
index c0c4412c7..5a8db0877 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
@@ -29,7 +29,7 @@ DEPENDS = "libdevmapper \
 
 LICENSE = "GPL-2.0-only"
 
-SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http;branch=master \
+SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=http;branch=master \
            file://multipathd.oe \
            file://multipath.conf.example \
            file://0021-RH-fixup-udev-rules-for-redhat.patch \
-- 
2.17.1


