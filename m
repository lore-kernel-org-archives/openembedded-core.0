Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2DCBC61DA4
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 09:45:24 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.11082.1675331120837417442
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Feb 2023 01:45:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FQRMKV8K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id f47-20020a05600c492f00b003dc584a7b7eso3261612wmp.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 01:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UXrcSxL3aL4OuCszIlKzqSiT1R/gjAKMoc9zrjq3YxE=;
        b=FQRMKV8KiGqqraxfU+URasfamKMbo0yhk5gI2jR0zyyWQpKjay2EEu3/YnR6DPoxOZ
         iIhh+ifw+HBfEMrLKoPiGh3f7/EasLU3Cz9WwlgOOxE7Vj2MczSWc1ZZI1wOjt0F0qCJ
         If3cD9e2O8iRhFU2ELPcBxOI/T10oHSaOAqgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UXrcSxL3aL4OuCszIlKzqSiT1R/gjAKMoc9zrjq3YxE=;
        b=yGz3hPYSkQr1CPzFtmtQO9EEH3nIwUaB7/71/9HnrmwFEPWBwttH1mZGXGsa3hZOWY
         xmgZNZrCLNjrnlFVxBdVNxOb+xtnn4qfSzScV77QnVIa58az3liVMas2aDThHLw15YfM
         BVBOaocrDq2+vUR+fXdo7vWc7RhWSHZzHTw9r/ZDetdWltKdhnLyL1Q36BcabOrHd1jw
         IdZJS2NVyXux9BHSij/QzLQTYLnP+eUuPpGltD5LboAxg/U+yzO313le7nF1Bzdbows0
         fchFM0W7RwYTGuf2fciKgEkpA9syrlV+rCbhBLHSPld9K37knDzNOSjJyCzyu+lj8PX5
         XkpQ==
X-Gm-Message-State: AO0yUKXUm5ohwC1lGcVuPn6wFQrCoj58vW+tnNdEaZOIA8ygH24Db5y8
	x3WZav79uovpDOxevEh4kLYZmHEYdl0gb/vd
X-Google-Smtp-Source: AK7set8lH+f5/6pQuG/FmtFqkFu60iCCZVeYnBBfX+dKb6KH4r/Y3IfRSUuhNnVmPY2J6C6Kwu8CHw==
X-Received: by 2002:a05:600c:1c16:b0:3de:c612:df56 with SMTP id j22-20020a05600c1c1600b003dec612df56mr4981777wms.15.1675331118899;
        Thu, 02 Feb 2023 01:45:18 -0800 (PST)
Received: from max.guestnet.cambridge.arm.com ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id y21-20020a05600c341500b003dc522dd25esm4054548wmp.30.2023.02.02.01.45.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 01:45:18 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-markupsafe: upgrade 2.1.1 -> 2.1.2
Date: Thu,  2 Feb 2023 09:45:16 +0000
Message-Id: <20230202094516.1092250-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 09:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176686

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


