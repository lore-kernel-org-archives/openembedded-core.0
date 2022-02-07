Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F723C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 01:08:42 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.16540.1644196121094441296
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S2JD/Kd+;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id k18so21953158wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bh0Vi8ibCVxunWDhomgqLi296w8ELQGtLEaWeiaubow=;
        b=S2JD/Kd+Md9hASbKeIOO459QlqwYKYOvxfEPDtNdns+XF7M569yosPgprfU9+xCzMa
         BQeUDkl0cmTjxWpdgAfj7YSm3PgXqtvoc8+eO7m/Hef7wfZE20WLGVKRGgLrnm7H/ORx
         lj2H7jSMlBP4mamFXb+dqTEmPWVRV6WKSl8pq2VFDLlz1p6qb4RYRZluzQ0JPPfO5VSW
         uB4HqsrpRIkpzeNo7KmJgrv2wfrAMbW4cw17NeGzbxiT0iOI4xUDxeaQxryoMw/MZCVc
         IMbdmxzYRgbkroZ0545BNM76GmNHw1Nq/FU8vOc/M+0EwavdVWpdKmdEhGmd0YjfqsWo
         zIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bh0Vi8ibCVxunWDhomgqLi296w8ELQGtLEaWeiaubow=;
        b=PfivVzA7g35NLCUNlKzWZcaUd8l6mzRk2JCBFrcnBrILZr5351YBYUCFFefoGeN9KT
         Z242YD33jWvduova3JD6pTZq3oSooQzFCsRHtMbCO+OIpVfVn2sOhrr+KxVfv26wNrCf
         8fxDR3SkQkbVsmYgOPZa5xQ6BdkX6hVySL38zO3L2B6B3+YuslyX53OTFzC3nKKB7oOc
         SI+eKQnioIGR590tHN3qF4ZkKt2IvuOtBPWo9/bm9c3Xn/5kHLKbyvrHk7QUJaYI79tT
         tO4xM1vbfFG41ZwEEnD7EOVv3hVzi4qqzf5AmYHAr5L4aisVz92khxz9jd8OMwlWNRgx
         iewQ==
X-Gm-Message-State: AOAM531EYlHW8Mct9FhoiauRBIZwNxfkZ5+QZMFWMfiaIPMmuKdAG9uT
	efXvwYkMR6KDusT142IsHjJRDu7Nw5w=
X-Google-Smtp-Source: 
 ABdhPJyccQLCELmNVQa4ojdSQQsfze6n/4n3Cz84a8Ros+g6sr5ESKRkBOwyhxyfxZoHBUP6j7Q6tA==
X-Received: by 2002:adf:d087:: with SMTP id y7mr7786259wrh.274.1644196119317;
        Sun, 06 Feb 2022 17:08:39 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 o22sm3903556wmh.13.2022.02.06.17.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 17:08:38 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 02/17] spirv-headers: bump to b42ba6
Date: Mon,  7 Feb 2022 01:08:08 +0000
Message-Id: <20220207010823.143664-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220207010823.143664-1-quaresma.jose@gmail.com>
References: <20220207010823.143664-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 01:08:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161422

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/recipes-graphics/spir/spirv-headers_1.5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb b/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
index 522708618e..3144b1eb42 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c938b85bceb8fb26c1a807f28a52ae2d"
 
-SRCREV = "814e728b30ddd0f4509233099a3ad96fd4318c07"
+SRCREV = "b42ba6d92faf6b4938e6f22ddd186dbdacc98d78"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
-- 
2.35.1


