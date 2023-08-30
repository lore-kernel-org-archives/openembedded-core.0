Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36FECC83F01
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 15:31:53 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.145.1693409508325520099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 08:31:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XPMMxGv4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4018af1038cso54359895e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 08:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1693409506; x=1694014306; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0DDLSWyvvRCPmqClvlbef9iIJqKbkd7NFpkcdL8sVWg=;
        b=XPMMxGv4pT/xsXO66D4PPpnAadVkuwvQoK2oBqICMP3mQcRB2DCLjYJrL1uw5255rK
         U5BNLTClJsly1boo7ugrO2tIGW8qfavhRAP0+4OPVwbwEsIsxbT+o4pxP8Ke0o6JW0aD
         MwrPqmKqjGxKJt7J1hAN8D9LY/MQuPNsl1fWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693409506; x=1694014306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0DDLSWyvvRCPmqClvlbef9iIJqKbkd7NFpkcdL8sVWg=;
        b=jlUpUrlNC3jAtrh52FlWnn3cRWtXrYrya4clAAbzzq/F9NdTupC+rT63rQM6/SjO31
         K9VEGKuH+0mK2fv3Cf6Iwu0u5v9xyR7viMYvMuPwV9iRQjhX0/F83MOKRnE7ml7HblQY
         ESTcwAvFALFFUGT8Y1AdoeHAG6q7ZjsFsR9EV0cqHU3Oec+JFC9qg2AKOkbUfu+QuLyB
         q0tUPIA0W6l/g1bcnjZF2qs5XbtSRxEojMVgJqpJoS+q5vtbPiN6uBvtkRbqeZVYtNcg
         vXCsr3a/PrzPwK+LkuvHnogQ7fQ4cdXdPj2nPCJE3Ko3YFJZ4T8PV7byKqI9Fx9t8kX1
         XzsA==
X-Gm-Message-State: AOJu0Yx0PgDIKqsU96LeuD3Z5ielkhCab8PCAQFA05oRWWaFwuc/CyOD
	22hZGUQgDsuYFVlxA8u3eJ2SlEP3Ku2E7i0V/kY=
X-Google-Smtp-Source: AGHT+IG2ZMq0XQ99rDgrfLfpjpyl+Fcx0z+HTj125gOhNu9w0+7UwKhmVp5vn+JJzp/+BujGx17QIg==
X-Received: by 2002:a5d:69c9:0:b0:315:9362:3c70 with SMTP id s9-20020a5d69c9000000b0031593623c70mr1932287wrw.60.1693409506601;
        Wed, 30 Aug 2023 08:31:46 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:15ec:a052:9304:60a5])
        by smtp.gmail.com with ESMTPSA id k15-20020a05600c0b4f00b003fee6f027c7sm2566976wmr.19.2023.08.30.08.31.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 08:31:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] README: Update to point to new contributor guide
Date: Wed, 30 Aug 2023 16:31:45 +0100
Message-Id: <20230830153145.2015419-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 15:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186895

Now we have a contributor guide combining various wiki pages, point at
that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 README.OE-Core.md | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/README.OE-Core.md b/README.OE-Core.md
index 2f2127fb03a..31b1bf52b44 100644
--- a/README.OE-Core.md
+++ b/README.OE-Core.md
@@ -16,9 +16,13 @@ which can be found at:
 Contributing
 ------------
 
-Please refer to
-https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
-for guidelines on how to submit patches.
+Please refer to our contributor guide here: https://docs.yoctoproject.org/dev/contributor-guide/
+for full details on how to submit changes.
+
+As a quick guide, patches should be sent to openembedded-core@lists.openembedded.org
+The git command to do that would be:
+
+     git send-email -M -1 --to openembedded-corel@lists.openembedded.org
 
 Mailing list:
 
-- 
2.39.2


