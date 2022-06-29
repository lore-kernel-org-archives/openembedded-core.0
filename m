Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 703C2C43334
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 13:26:34 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.11514.1656509184771824174
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 06:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IkXd72ie;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id d17so16832149wrc.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 06:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TyEQg51LuCa4QdcKyuzaCWSH/lJPTyNCOcS6T30jtDQ=;
        b=IkXd72iejumDM1OWSRft+WB1j1Ick4CpbAmXoK0O6ZDhCckDSp+bkrGXXjcTOTdWFP
         BgFMSSutUGP73f9IxggSfr/Ljtx0fmNlR6yGOZOtcME30g9Dglb+SEM/BWntdFEXW9aL
         yKRlXhMuEJ+Dv7Qs08q/8gKNdJCcFq9Rk1X4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TyEQg51LuCa4QdcKyuzaCWSH/lJPTyNCOcS6T30jtDQ=;
        b=mlJR32frbz90KdsUf7JJVJGfSlgW8qAkWjYstxQox42EevA4qzy0gJ8hVz9tLJjkWh
         UGAB8NvVumAAcTE59ujsgxI/xsYko4gP6MN9a4uUDzDk0D4GFDg1iXJCZfL4g8RAEpt9
         f5GgtduCJqdAZBeRDsixSwu5aIDNOkDNkeic+DdykWaZLt6wBYUf5aNVo7gTiCk4MncV
         24w+3384c5cOpA4ddeLfHUkZ4FC4HfXTNxfCHpkNRYNm9DxJfAFICGrzt2yrSClIpTd2
         XCRyN0BjTles1a1BJnEv+0ZW4T3xVe99NlMXgFUFrPJRaPMNfNS0Z7X1h5PDsMs2JgRj
         Wrig==
X-Gm-Message-State: AJIora/lrA+xg4FFXS7gaEnmLJJyj4j0aX+HefWHBqM18pDDyfzNCjXa
	5cgbNYKokaGAmKvgTnrn8cauTFMFXxLSfQ==
X-Google-Smtp-Source: 
 AGRyM1uNOntisX1GzRNazkev/mcRVxilc2rjDNiqO6NtOAKReXOeLjojG3WiarsTf8Si348tVsvREA==
X-Received: by 2002:a5d:43cd:0:b0:21b:8e53:befe with SMTP id
 v13-20020a5d43cd000000b0021b8e53befemr3237013wrr.255.1656509182872;
        Wed, 29 Jun 2022 06:26:22 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7688:b75a:a909:895d])
        by smtp.gmail.com with ESMTPSA id
 v14-20020a1cf70e000000b003a02de5de80sm3243629wmh.4.2022.06.29.06.26.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 06:26:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] vim: 8.2.5083 -> 9.0.0005
Date: Wed, 29 Jun 2022 14:26:21 +0100
Message-Id: <20220629132621.581615-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 13:26:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167375

The license checksum changed due to a major version change in the referenced file.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../vim/{vim-tiny_8.2.bb => vim-tiny-9.0.bb}                | 0
 meta/recipes-support/vim/vim.inc                            | 6 +++---
 meta/recipes-support/vim/{vim_8.2.bb => vim_9.0.bb}         | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/vim/{vim-tiny_8.2.bb => vim-tiny-9.0.bb} (100%)
 rename meta/recipes-support/vim/{vim_8.2.bb => vim_9.0.bb} (100%)

diff --git a/meta/recipes-support/vim/vim-tiny_8.2.bb b/meta/recipes-support/vim/vim-tiny-9.0.bb
similarity index 100%
rename from meta/recipes-support/vim/vim-tiny_8.2.bb
rename to meta/recipes-support/vim/vim-tiny-9.0.bb
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 06707dbe112..b85f34d6c8e 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -11,7 +11,7 @@ RSUGGESTS:${PN} = "diffutils"
 
 LICENSE = "Vim"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6b30ea4fa660c483b619924bc709ef99 \
-                    file://runtime/doc/uganda.txt;md5=daf48235bb824c77fe8ae88d5f575f74"
+                    file://runtime/doc/uganda.txt;md5=001ef779f422a0e9106d428c84495b4d"
 
 SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
@@ -21,8 +21,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
            "
 
-PV .= ".5083"
-SRCREV = "db77c49401145d76441fbb3d22a1d7d987681c13"
+PV .= ".0005"
+SRCREV = "040674129f3382822eeb7b590380efa5228124a8"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
diff --git a/meta/recipes-support/vim/vim_8.2.bb b/meta/recipes-support/vim/vim_9.0.bb
similarity index 100%
rename from meta/recipes-support/vim/vim_8.2.bb
rename to meta/recipes-support/vim/vim_9.0.bb
-- 
2.34.1


