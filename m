Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A81D8C4708D
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:15 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.7365.1649342273803037785
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 07:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=SfU5c8XT;
 spf=pass (domain: linaro.org, ip: 209.85.160.171,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qt1-f171.google.com with SMTP id j21so8333838qta.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 07:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aWkOBAFw355XKziA3ir3OKEXjBBWaHy59MVo3zoJRBg=;
        b=SfU5c8XTSmxEtwIdKbRmSjIloyK5rn2dYlKKZeurdCrLPmWEOiktWOByr9Oi7XEmoo
         EzsSN+AasWwMW8NseAKCBB567tIo2fF5uzr/5Ew7aVchnTwzEoWaQMCQMlZG8FpvJSIb
         spsGLaNYhzL0Dz20COrorpmg32VBJgzcUMKNcSQsv1q9m25EKOUStLmI5cPAlez18Cxq
         7V29im+5FjebaWqrCOpHbS2a6YlROzqpQ9Kvx0yjbb6avfKRrsS3/AnIXXKXg9XnC4DJ
         mGmMM0kSYeuJT1jL1pD+vO45DBbBhj2nQSES7HYq48fGrRSBMc3u2NNcMCjlDWU0kgPO
         ysbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aWkOBAFw355XKziA3ir3OKEXjBBWaHy59MVo3zoJRBg=;
        b=3RzD55gqjoE5Ma9b1VDkOUAOajswm373xFAo5SGGzrhrqJnI/LHHHB5c2IFQiOGNBZ
         KVe8/Ji5brXQ3mME32d++LC2oZMFaNIlL4AZd2oTVxj+GwYDd0jSMjS6sABLVXeAwPTd
         QLaVHTL1SZ8JXDUT+ckKuqUw3+FFG42m8DKf7aD25CLfxr4+ri+2YSWYKaZJz0kGNmrQ
         T+5ZYDcbutmHh/OVoA7MkjwpTT+iibY4BIzz/MRi3T5eHDQ9NsPuUFa022T/21Alt1fn
         XKjKsaKccDdUyflhlIeRtN6JOQ2xLuapI4PMwmu6Fhq/MxgpVE/J1WgPRwPP+5fSc47R
         D/0g==
X-Gm-Message-State: AOAM531DJpsMYC43qWzAQF+/Dd2jY3yOb6MKDUA/FiqY4aLUAMLI9InN
	NpQ0+DhsTAmwOiKxbppxfxRy/Oh7QlrDpA==
X-Google-Smtp-Source: 
 ABdhPJw/DYmLvq0qVDoFkJNXsgHP+Oij759KDWL8VLAX85pHfR1y+4GsTfTXQkMrxCiJBjEjRSDclw==
X-Received: by 2002:ac8:7d86:0:b0:2e1:fe79:d602 with SMTP id
 c6-20020ac87d86000000b002e1fe79d602mr11812881qtd.502.1649342272790;
        Thu, 07 Apr 2022 07:37:52 -0700 (PDT)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id
 j11-20020a37a00b000000b0067b436faccesm11396801qke.122.2022.04.07.07.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 07:37:52 -0700 (PDT)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [dunfell][PATCH] vim: Upgrade 8.2.4524 -> 8.2.4681
Date: Thu,  7 Apr 2022 10:37:42 -0400
Message-Id: <20220407143742.1801695-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 15:41:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164112

From: Richard Purdie <richard.purdie@linuxfoundation.org>

License change is a date in the license file only.

This includes fixes for CVE-2022-0943, CVE-2022-1154, CVE-2022-1160.

(cherry picked from commit ca405e4529db47f471d8e49fd015c5d532e7c9ba)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 meta/recipes-support/vim/vim.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index b3c471225e..5f01fc3bca 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -11,7 +11,7 @@ RSUGGESTS_${PN} = "diffutils"
 
 LICENSE = "vim"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6b30ea4fa660c483b619924bc709ef99 \
-                    file://runtime/doc/uganda.txt;md5=a3f193c20c6faff93c69185d5d070535"
+                    file://runtime/doc/uganda.txt;md5=daf48235bb824c77fe8ae88d5f575f74"
 
 SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
@@ -21,8 +21,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
            "
 
-PV .= ".4524"
-SRCREV = "d8f8629b1bf566e1dada7515e9b146c69e5d9757"
+PV .= ".4681"
+SRCREV = "15f74fab653a784548d5d966644926b47ba2cfa7"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


