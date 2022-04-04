Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6542EC5DF62
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:45 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.34889.1649075586689878645
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Apr 2022 05:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GHbYOcxB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id
 n63-20020a1c2742000000b0038d0c31db6eso5509382wmn.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Apr 2022 05:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qS3Bw96Oj7PElmW5lxICz8goT39j6Ey8E1Uh5TnQlMY=;
        b=GHbYOcxBiww6zMHRSwDdVlpEBgsPkaq8HCsHtUd7cgrxf5fxv5cHmgliDfGlvoWHEH
         3mt1GeNlk8CUtf4ecwtY4uipdwuDwCoNF7Q4numP41Q/sMomNIcDpbpBslM7AyvHxfiL
         v+/B/fZXuIi4E5s4HiR2BSbS4b3Ym+mtuZDRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qS3Bw96Oj7PElmW5lxICz8goT39j6Ey8E1Uh5TnQlMY=;
        b=jGVrgC7gB23YFa1mfaOVMSD0YwTxtLXnTC+PfJZtI6lR9/riFy+Tdirtv3sLQ/LCNb
         BxziHDrEnbyEXorDJXotr2bDcYXlfmH+3vywHP20qXuNdozj8xME81YRoAFMtuqzLHWn
         a3KQH9dy/DEd5TLvPj2MeVXOi8FA7wjAfOfSnv9zZX1exV/hDyMegZbYEtysp2eQ7AWX
         2kBszQ3dyfpekAqjpbP2YkMBfWhsPzFcjNPKbcTgqYB8oeU8vP3pmgplaD0hjxCFqQQX
         wtE8WiDkm+kpPY1dpApQJiXnUMeny9wiIThntzWTNyjuPPpwxn0orqdj+fIR0g4DkvMu
         IFqQ==
X-Gm-Message-State: AOAM530IyqtVfVT8uBoAOcaDkZCmB67A3kThyW2sKLXQ3eg8HNd4pGxg
	7rQkW3ebfTojS7uGd07Ag0/myszZR0bnoiHX
X-Google-Smtp-Source: 
 ABdhPJyoh/KrPiUgymMf3jHHj1JD2R9X6T0RQSlWjXI45xV4FvKAqZMF4ack22ndcNGpPdwNbUDeUw==
X-Received: by 2002:a1c:f30b:0:b0:380:e444:86b9 with SMTP id
 q11-20020a1cf30b000000b00380e44486b9mr19172059wmq.81.1649075584655;
        Mon, 04 Apr 2022 05:33:04 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:4552:8cb0:e722:b501])
        by smtp.gmail.com with ESMTPSA id
 l11-20020a5d410b000000b002060e6a02cesm3825585wrp.13.2022.04.04.05.33.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 05:33:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] vim: Upgrade 8.2.4524 -> 8.2.4681
Date: Mon,  4 Apr 2022 13:33:03 +0100
Message-Id: <20220404123303.1731638-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163992

License change is a date in the license file only.

This includes a fix for CVE-2022-0943.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/vim/vim.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 905ba3f9c61..21ff036cf4c 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -11,7 +11,7 @@ RSUGGESTS:${PN} = "diffutils"
 
 LICENSE = "Vim"
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
2.32.0


