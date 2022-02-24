Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC90C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 05:03:53 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web08.6692.1645679032984156336
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 21:03:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m/xPAK6i;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 75so805490pgb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 21:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2lb5KgK2GpIJRM1/nTL0urueiE5UmFXV5+KcoBDNtwk=;
        b=m/xPAK6ixX722zEysPIOKfoXyi7PkMwFaSWBpQ4Doi1Q4z9vyWf7g8C6CiSMryKC/M
         iq5ZVNcbGTBMtTX9MVKFXWJ5dYto5W9SEAuvLwjTrouQNWiVSCCQGKd80OOiZRcDM0hz
         j/f35TByjXEPBa5P/Q4JQZmGxZH7WDtGgN7ESTdyL03ZTWI4OBP/iGsAa1go3hZZxi1G
         /wxRWsrg0FLWWeaY3hr6Wl8DYpx6R9TvOs983K01mR2G1m+8UKoQQDIe/ySa4NXxtgUr
         nGX73PtLTbmcLVGp5DXMl4rHshLwVHWJnGYWXqJLlgJsamg+uem3E5KkqkSuq5XF/wpW
         k0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2lb5KgK2GpIJRM1/nTL0urueiE5UmFXV5+KcoBDNtwk=;
        b=ODQnOq8K6mB28Yy7RBgPY1mso9o0lgUISAdhkqNV+gL8F0yHecY94H94Zx4fobZ3ho
         ke5zHwUw/sGyNZAbTfeSAtmjFjE29JWcARyhDzyKiAxREWz2erIaLAPPfJKyr+QFFA2V
         bNgoVKyRS2ogzei+6vAgx31U9IMEHXu5WLw28CjixjxFeuln8sv/6IdfcoTayV5PmC5u
         pFA9tvBkB5WweV9BRYt2nGh82zv9lMs8BQzaSzL223dqtXLvFTDLFb0N5kuCamSN6bpV
         tSKYiFMEixFd/rzkD473ZNpo8LwdU8780+uMJVSWq458XkeCQinqdfj+K4K0K+CSIWJ+
         ceow==
X-Gm-Message-State: AOAM532zHtZIu8QxuD7yRoYlD+xVZCOBUPu/lTQHrMMRpdIyg3UFPeJq
	c1Fc7ie9am5VseGa8VId6TysdvpOlDS3VQ==
X-Google-Smtp-Source: 
 ABdhPJzSwgF3u49CAV6AtGqX0VtBj4Lx2SddbqVg/I4/xBEkZuV6JfsfvovlRWhL7S6W7Dr1crtOGw==
X-Received: by 2002:a63:5f42:0:b0:373:d440:496e with SMTP id
 t63-20020a635f42000000b00373d440496emr987871pgb.529.1645679032022;
        Wed, 23 Feb 2022 21:03:52 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 u4sm1408106pfk.220.2022.02.23.21.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 21:03:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] documentation-audit: Use renamed LICENSE_FLAGS_ACCEPTED
 variable
Date: Wed, 23 Feb 2022 21:03:46 -0800
Message-Id: <20220224050346.1236428-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220224050346.1236428-1-raj.khem@gmail.com>
References: <20220224050346.1236428-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 05:03:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162294

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/contrib/documentation-audit.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/documentation-audit.sh b/scripts/contrib/documentation-audit.sh
index f436f9bae08..36f7f3287c8 100755
--- a/scripts/contrib/documentation-audit.sh
+++ b/scripts/contrib/documentation-audit.sh
@@ -26,8 +26,8 @@ if [ -z "$BITBAKE" ]; then
 fi
 
 echo "REMINDER: you need to build for MACHINE=qemux86 or you won't get useful results"
-echo "REMINDER: you need to set LICENSE_FLAGS_WHITELIST appropriately in local.conf or "
-echo " you'll get false positives.  For example, LICENSE_FLAGS_WHITELIST = \"commercial\""
+echo "REMINDER: you need to set LICENSE_FLAGS_ACCEPTED appropriately in local.conf or "
+echo " you'll get false positives.  For example, LICENSE_FLAGS_ACCEPTED = \"commercial\""
 
 for pkg in `bitbake -s | awk '{ print \$1 }'`; do
 	if [[ "$pkg" == "Loading" || "$pkg" == "Loaded" ||
-- 
2.35.1


