Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F410CC05027
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 09:44:34 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.11095.1675331071592533354
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Feb 2023 01:44:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SjIti26H;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id q10so1130436wrm.4
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 01:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3ZyaOdmAT4cbfmtZltrE/lEkksBidrd/GqY3DhvhRFA=;
        b=SjIti26HSeGhruYZ80M/hNMCYvvHSfTaZZBpMuq7I8HoWgETL1PldLfNTjQCAFfOeT
         TMFprY/cEypzu6ASNcTsfG1GParwyqpxIZEp+8JdnKCHr8068t1KceM6X4gRZmAHcFNG
         9Cua3W0mFtLQus/LvkZfNUwftkXyH1PRhflwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ZyaOdmAT4cbfmtZltrE/lEkksBidrd/GqY3DhvhRFA=;
        b=nociM0TDtojbrE6kPZWQLLa8NCf9s00v3gxbhjrrENnhMIALo2nq7wV/ZYljwozuIG
         VqLYQ+966M6r+8Tx7ZwxJQ7phZgImT122DIocwSKVcehsZl1KWxwEi11Qs/k5yA8pqdT
         7+FnUxON3+X5Dw9kg9+YaGyyEGkBCBWJ9FqoV2cR+I2nn2uKutKnq0l1K8vZFcQgDvTh
         Jy6xBz4prdCvSAJa1QnytsVZX3ya1/azO+oo5m+8fA5ncP7pAc84sQcQk/K6zGCIauSc
         VXZxXJZC76U/vvgK0CGUCZBOns1US2ppd3AqSSU8ljNXiAX0JivIqUOSKV8y2Hr8TPrw
         DI/A==
X-Gm-Message-State: AO0yUKXXZs0ofdaMs6qx6CFazg9lSbdlwjjIjFLwFnwKLtfUYmRdGe/i
	7yDtLE8EK0CbKo30Kvq6g/cUhr9ritRCn1p7
X-Google-Smtp-Source: AK7set+34F07Bnvw1j4kdw87mct2dxtV6wdmnDno8S9Kj54ovjV7zRJ1ZJlDsWAwa+YgtK3oGxOXSg==
X-Received: by 2002:adf:ee87:0:b0:2bf:e288:6289 with SMTP id b7-20020adfee87000000b002bfe2886289mr5044512wro.15.1675331069761;
        Thu, 02 Feb 2023 01:44:29 -0800 (PST)
Received: from max.guestnet.cambridge.arm.com ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id v14-20020adfe4ce000000b002bfafadb22asm20077076wrm.87.2023.02.02.01.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 01:44:29 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Upgrade Helper <auh@yoctoproject.org>
Subject: [PATCH] python3-markupsafe: upgrade 2.1.1 -> 2.1.2
Date: Thu,  2 Feb 2023 09:44:27 +0000
Message-Id: <20230202094427.1092128-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 09:44:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176685

From: Upgrade Helper <auh@yoctoproject.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...{python3-markupsafe_2.1.1.bb => python3-markupsafe_2.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markupsafe_2.1.1.bb => python3-markupsafe_2.1.2.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb b/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb
rename to meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb
index 0544dd1b83d..f4f0ad2df0f 100644
--- a/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb
+++ b/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "7f91197cc9e48f989d12e4e6fbc46495c446636dfc81b9ccf50bb0ec74b91d4b"
+SRC_URI[sha256sum] = "abcabc8c2b26036d62d4c746381a6f7cf60aafcc653198ad678306986b09450d"
 
 PYPI_PACKAGE = "MarkupSafe"
 inherit pypi setuptools3
-- 
2.37.2


