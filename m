Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F065EE3F09
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 20:49:59 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.9427.1694465389011845819
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Sep 2023 13:49:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ll8VerE3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-31c4d5bd69cso5047792f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 13:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694465387; x=1695070187; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=v3S2k3RJnh70ni6vNcw0qqzIfFvyzatT5aZb5mY4nMU=;
        b=Ll8VerE3cRiH+7PYiTVqmX7oqtvqMdkgnGhkQqTmKfVQqemK4kOtVdURTKfWYLLu7A
         XzKnePP8TKFFdGlGTfssoXBOfSPV+CdwSjMSda7sJkrgwHacYl76TPMdY3S35Ti6n3Cd
         RLmz55oLr2hMtyXy0wDJhkL92POv4xCj8JzKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694465387; x=1695070187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v3S2k3RJnh70ni6vNcw0qqzIfFvyzatT5aZb5mY4nMU=;
        b=FSEJRNhZZOH6FHHLPjsrLFUDoXaYX9XchjJrgiVtMk2oikHSJKGQ+I5TIAIL9zCaj6
         U8fWL64PXXvSSefDXOob0LcOqV24BNjKFYdnieNhC0YfyIlnjLwLZkwuL8Bl6s80UvQJ
         AQrVTRU5U92qjpdN2qC0bf1HfTOiuSWagsJPCGos47CKdHC39QSbfSerqJDvHKbovvzT
         VJ/kpUWOrxnmgipRYgf+uFXVcfT2HSTNZyEn+h19JgjR7cF6Js8k8KFGE/zooHDVuPuK
         BL2RStJEPgtG4PgnLrhGaTvJlVXyvDAWQc+soymMYaKqYHEhVOrC8JMFFyORpo9xvtQG
         epzw==
X-Gm-Message-State: AOJu0YyhaUuWy6O71dNUIvDf1WbK/fcW3B3bPjZnFNi6Omt1cuC35jC+
	J/uMfQD/gRzxmIbLJuLWykbacyPzuD6kcG+Rh1M=
X-Google-Smtp-Source: AGHT+IGfJp5uVXoFaNuW4nFk/1Qn1yGblXYwSs1SA78iW1hx8fYq7zZkQ92S6PdbkmBG5Lebx2sIvQ==
X-Received: by 2002:a05:6000:1816:b0:317:6cd2:b90c with SMTP id m22-20020a056000181600b003176cd2b90cmr8315764wrh.13.1694465386722;
        Mon, 11 Sep 2023 13:49:46 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c19a:2e97:b04:7abd])
        by smtp.gmail.com with ESMTPSA id gw18-20020a05600c851200b004030c778396sm5249262wmb.4.2023.09.11.13.49.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 13:49:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] vim: Upgrade 9.0.1664 -> 9.0.1894
Date: Mon, 11 Sep 2023 21:49:45 +0100
Message-Id: <20230911204945.3853310-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 20:49:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187497

This includes multiple CVE fixes.

The license change is due to changes in maintainership, the license
itself is unchanged.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/vim/vim.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 8a399cd8028..5f55f590e65 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -10,7 +10,7 @@ DEPENDS = "ncurses gettext-native"
 RSUGGESTS:${PN} = "diffutils"
 
 LICENSE = "Vim"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6b30ea4fa660c483b619924bc709ef99"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d1a651ab770b45d41c0f8cb5a8ca930e"
 
 SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1664"
-SRCREV = "8154e642aa476e1a5d3de66c34e8289845b2b797"
+PV .= ".1894"
+SRCREV = "e5f7cd0a60d0eeab84f7aeb35c13d3af7e50072e"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.39.2


